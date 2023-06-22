import 'package:flutter/foundation.dart';

class Logging
{
  static const String _prefixDebug   = "[Noto]/Debug/";
  static const String _prefixInfo    = "[Noto]/Info/";
  static const String _prefixWarning = "[Noto]/Warning/";
  static const String _prefixError   = "[Noto]/Error/";

  static void debug(String message)   { if (kDebugMode) print("$_prefixDebug$message"); }
  static void info(String message)    { if (kDebugMode) print("$_prefixInfo$message"); }
  static void warning(String message) { if (kDebugMode) print("$_prefixWarning$message"); }
  static void error(String message)   { if (kDebugMode) print("$_prefixError$message"); }
}