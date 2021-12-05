class SystemEventsHandler {
  static const bool _infoVerbose = true;
  static const bool _errorVerbose = false;

  static void onInfo({required String info}) {
    if (_infoVerbose) {
      print(info);
    }
  }

  static void onError({required String err}) {
    if (_errorVerbose) {
      print(err);
    }
  }
}