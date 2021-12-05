import 'package:notes_flutter/utils/common/system_events_handler/system_events_handler.dart';

class NotesListHeaderController {
  NotesListHeaderController();

  void menuPressHandler() {
    SystemEventsHandler.onInfo(info: "NotesListHeaderController->menuPressHandler()");
  }

  void searchPressHandler() {
    SystemEventsHandler.onInfo(info: "NotesListHeaderController->searchPressHandler()");
  }
}