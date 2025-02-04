import 'package:calculator/core/_core_exports.dart';
import 'package:calculator/core/constants/theme/app_theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeViewModel extends BaseViewModel {
  // Theme storage key
  static const String _themePreferenceKey = 'selected_theme';

  // Initialize with default values to prevent late initialization errors
  ThemeData _themeData = AppTheme.darkTheme;
  bool _isDarkTheme = true;

  // Getters for theme state
  ThemeData get theme => _themeData;
  bool get isDarkTheme => _isDarkTheme;

  /// Creates a new instance of [ThemeViewModel] and initializes theme state
  ThemeViewModel() {
    _loadSavedTheme();
  }

  /// Loads the saved theme preference from persistent storage
  Future<void> _loadSavedTheme() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final savedIsDarkTheme = prefs.getBool(_themePreferenceKey);

      // Only update if a preference exists and is different from current
      if (savedIsDarkTheme != null && savedIsDarkTheme != _isDarkTheme) {
        _isDarkTheme = savedIsDarkTheme;
        _themeData = savedIsDarkTheme ? AppTheme.darkTheme : AppTheme.lightTheme;
        notifyListeners();
      }
    } catch (e) {
      debugPrint('Error loading theme preference: $e');
      // Continue with default theme if loading fails
    }
  }

  /// Persists the current theme preference
  Future<void> _saveThemePreference() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool(_themePreferenceKey, _isDarkTheme);
    } catch (e) {
      debugPrint('Error saving theme preference: $e');
    }
  }

  /// Toggles between light and dark themes
  Future<void> toggleTheme() async {
    _isDarkTheme = !_isDarkTheme;
    _themeData = _isDarkTheme ? AppTheme.darkTheme : AppTheme.lightTheme;
    notifyListeners();
    await _saveThemePreference();
  }

  /// Sets a specific theme mode
  Future<void> setTheme({required bool isDark}) async {
    if (_isDarkTheme == isDark) return;

    _isDarkTheme = isDark;
    _themeData = isDark ? AppTheme.darkTheme : AppTheme.lightTheme;
    notifyListeners();
    await _saveThemePreference();
  }
}
