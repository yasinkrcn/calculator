import 'dart:async';
import 'package:calculator/core/utils/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:logger/logger.dart';
import 'package:calculator/core/init/injection_container.dart' as locator;

/// StartupManager sınıfı, uygulamanın başlangıç sürecini yönetir.
/// Singleton pattern kullanılarak tek bir instance üzerinden çalışır.
/// Uygulama başlatılırken gerekli tüm servislerin ve bağımlılıkların
/// initialize edilmesini sağlar.
class StartupManager {
  StartupManager._internal();

  static final StartupManager _instance = StartupManager._internal();

  static StartupManager get instance => _instance;

  bool _isInitialized = false;

  bool get isInitialized => _isInitialized;

  final _logger = Logger();

  static Future<void> initialize() async {
    // Eğer zaten başlatılmışsa tekrar etme
    if (_instance._isInitialized) {
      _instance._logger.w('StartupManager zaten başlatılmış durumda');
      return;
    }

    // Flutter engine'in başlatılması
    WidgetsFlutterBinding.ensureInitialized();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    // Hata yönetimi ile başlatma işlemlerini çalıştır
    await runZonedGuarded<Future<void>>(
      _init,
      (error, stackTrace) {
        _instance._logger.e('Başlatma sırasında yakalanmamış hata', error: error, stackTrace: stackTrace);
      },
    );

    _instance._isInitialized = true;
    _instance._logger.i('StartupManager başlatma işlemi tamamlandı');
  }

  static Future<void> _init() async {
    try {
      // Service locator pattern kullanarak uygulama için gerekli tüm servis ve bağımlılıkları başlatır
      await locator.init();

      // Cihaz ekranına göre duyarlı tasarım parametrelerini sağlamak için ScreenSize yardımcısını başlatır
      ScreenSize.init();
    } catch (e, stackTrace) {
      _instance._logger.e('Kritik başlatma hatası', error: e, stackTrace: stackTrace);
      // Kritik bir hata oluştuğunda uygulamanın nasıl davranacağını belirle
      rethrow;
    }
  }

  Future<void> dispose() async {
    try {
      _isInitialized = false;
      _logger.i('StartupManager başarıyla kapatıldı');
    } catch (e, stackTrace) {
      _logger.e('StartupManager kapatma sırasında hata', error: e, stackTrace: stackTrace);
    }
  }
}
