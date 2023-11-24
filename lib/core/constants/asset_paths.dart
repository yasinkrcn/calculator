class AssetPaths {
  static final AssetPaths _instance = AssetPaths._init();
  AssetPaths._init();

  factory AssetPaths() {
    return _instance;
  }

  String _toSVG(String name) => 'assets/svg/$name.svg';
  // String _toPNG(String name) => 'assets/png/$name.png';
  // String _toJPEG(String name) => 'assets/jpeg/$name.jpeg';
  // String _toJSON(String name) => 'assets/json/$name.json';
  // String _toGIF(String name) => 'assets/gif/$name.gif';

  //!SVG
  //? Numbers
  String get zero => _toSVG("zero");
  String get one => _toSVG("one");
  String get two => _toSVG("two");
  String get three => _toSVG("three");
  String get four => _toSVG("four");
  String get five => _toSVG("five");
  String get six => _toSVG("six");
  String get seven => _toSVG("seven");
  String get eight => _toSVG("eight");
  String get nine => _toSVG("nine");

  //? Symbols
  String get plus => _toSVG("plus");
  String get minus => _toSVG("minus");
  String get equal => _toSVG("equal");
  String get divide => _toSVG("divide");
  String get multiply => _toSVG("multiply");
  String get delete => _toSVG("delete");
  String get clear => _toSVG("clear");
  String get dot => _toSVG("dot");
  String get percent => _toSVG("percent");
  String get unknow => _toSVG("unknow");

  //? Themes

  String get darkMode => _toSVG("dark_mode");
  String get lightMode => _toSVG("light_mode");
}
