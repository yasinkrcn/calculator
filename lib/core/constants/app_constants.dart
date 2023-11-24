import 'dart:ui';

class AppConstants {
  static final AppConstants _instance = AppConstants._init();
  AppConstants._init();

  factory AppConstants() {
    return _instance;
  }

  ///Tasarımda bulunan cihazın ekran boyutları

  Size designDeviceSize = const Size(375, 812);

  String appName = "Calculator";

  static const String slug = "{slug}";
  static const String image = "https://image.hurimg.com/i/hurriyet/75/750x422/6500af144e3fe02d1823703a.jpg";
}
// http://10.0.2.2:5000/api/todo/