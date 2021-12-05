import 'package:flutter/material.dart';
import 'package:notes_flutter/assets/translations/en.dart';
import 'package:notes_flutter/assets/translations/ru.dart';
import 'package:notes_flutter/utils/common/system_events_handler/system_events_handler.dart';

class Localization {
  static const String LOCALE_RU = "ru";
  static const String LOCALE_EN = "en";

  String _currentLocale = LOCALE_RU;
  BuildContext? _context;

  static const Map<String, String> _ru = Ru.translation;
  static const Map<String, String> _en = En.translation;

  static const Map<String, Map<String, String>> _translationsMap = <String, Map<String, String>>{
    LOCALE_RU: _ru,
    LOCALE_EN: _en,
  };

  Localization();

  Localization.init({
    String locale = LOCALE_RU,
    required BuildContext context
  }) : _context = context {
    bool localeChanged = _setLocale(locale: locale);
    if (localeChanged) {
      _applyChanges();
    }
  }

  String t({required String pattern}) {
    if (_translationsMap[_currentLocale] != null) {
      Map<String, String> translations = _translationsMap[_currentLocale]!;
      if (translations[pattern] != null) {
        return translations[pattern]!;
      }
    }
    return "";
  }

  void changeLocale({required String locale}) {
    if (_context == null) {
      SystemEventsHandler.onInfo(info: "Localization->changeLocale()->CONTEXT_IS_NULL");
      return;
    }

    bool localeChanged = _setLocale(locale: locale);
    if (localeChanged) {
      // SystemEventsHandler.onInfo(info: "Localization->changeLocale()->LOCALE_CHANGED");
      _applyChanges();
    } else {
      // SystemEventsHandler.onInfo(info: "Localization->changeLocale()->LOCALE_NOT_CHANGED");
    }
  }

  bool _setLocale({required String locale}) {
    if (locale == _currentLocale) {
      return false;
    }

    switch (locale) {
      case (LOCALE_RU): {
        _currentLocale = LOCALE_RU;
        return true;
      }

      case (LOCALE_EN): {
        _currentLocale = LOCALE_EN;
        return true;
      }

      default: {
        SystemEventsHandler.onError(err: "Localization->setLocale()->UNKNOWN_LOCALE: " + locale);
        return false;
      }
    }
  }

  void _applyChanges() {
    void rebuild(Element el) {
      el.markNeedsBuild();
      el.visitChildren(rebuild);
    }
    (_context as Element).visitChildren(rebuild);
  }

// void init({required String locale, required Function updater}) {
//
// }

// void test(String callback(int i)) {
//
// }
}

// class Localization {
//   static const String LOCALE_RU = "ru";
//   static const String LOCALE_EN = "en";
//
//   static const Map<String, String> _ru = <String, String>{
//     "testValue": "Значение",
//   };
//   static const Map<String, String> _en = <String, String>{
//     "testValue": "Value",
//   };
//
//   static String _currentLanguageCode = LOCALE_RU;
//
//   static const Map<String, Map<String, String>> _translationsMap = <String, Map<String, String>>{
//     "en": _en,
//     "ru": _ru,
//   };
//
//   static String t({required String pattern}) {
//     if (_translationsMap[_currentLanguageCode] != null) {
//       Map<String, String> translations = _translationsMap[_currentLanguageCode]!;
//       if (translations[pattern] != null) {
//         return translations[pattern]!;
//       }
//     }
//     return "";
//   }
//
//   static void changeLocale({required String locale, required Function stateUpdater}) {
//     switch (locale) {
//       case (LOCALE_RU): {
//         _currentLanguageCode = LOCALE_RU;
//         stateUpdater(() {});
//         break;
//       }
//
//       case (LOCALE_EN): {
//         _currentLanguageCode = LOCALE_EN;
//         stateUpdater(() {});
//         break;
//       }
//     }
//   }
// }