class StringConstants {
  static StringConstants? _instance;
  static StringConstants get instance => _instance ??= StringConstants._init();
  StringConstants._init();
//Splash_view
  final String splashFirst = 'Cleanning your inbox has never been easier.';

  final String splashSecond =
      'Clean up old subscriptions and say no to email carbon!';
  final String getStarted = 'Get started';
//Home_view
  final String keepUp = 'Email Address';
  final String cleaned = 'Password';
}
