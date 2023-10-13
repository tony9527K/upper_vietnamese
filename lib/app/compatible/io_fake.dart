class Platform {
  static int get numberOfProcessors => 0;
  static String get pathSeparator => '';
  static String get localeName => '';
  static String get operatingSystem => '';
  static String get operatingSystemVersion => '';
  static String get localHostname => '';
  static const bool isLinux = false;
  static const bool isMacOS = false;
  static const bool isWindows = false;
  static const bool isAndroid = false;
  static const bool isIOS = false;
  static const bool isFuchsia = false;
  static Map<String, String> get environment => ({});
  static String get executable => '';
  static String get resolvedExecutable => '';
  static Uri get script => Uri();
  static List<String> get executableArguments => [];
  static String? get packageConfig => null;
  static String get version => '1.0';
}
