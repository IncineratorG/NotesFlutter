import 'package:notes_flutter/data/common/notes_list_sort_types/notes_list_sort_types.dart';
import 'package:notes_flutter/screens/notes_list/models/notes_list_model.dart';
import 'package:notes_flutter/utils/common/system_events_handler/system_events_handler.dart';

class NotesListSortOptionsMenuController {
  NotesListSortOptionsMenuController();

  void sortOptionPressHandler(String option, NotesListModel model, Function setState) {
    SystemEventsHandler.onInfo(info: "NotesListSortOptionsMenuController->sortOptionPressHandler(): " + option);

    switch (option) {
      case (NotesListSortTypes.MANUAL): {
        setState(() {
          model.sortType = NotesListSortTypes.MANUAL;
          model.groupByCategories = false;
        });
        break;
      }

      case (NotesListSortTypes.ALPHABETICAL): {
        setState(() {
          model.sortType = NotesListSortTypes.ALPHABETICAL;
        });
        break;
      }

      case (NotesListSortTypes.CREATION_DATE): {
        setState(() {
          model.sortType = NotesListSortTypes.CREATION_DATE;
        });
        break;
      }

      case (NotesListSortTypes.LAST_UPDATE_DATE): {
        setState(() {
          model.sortType = NotesListSortTypes.LAST_UPDATE_DATE;
        });
        break;
      }

      case (NotesListSortTypes.REMINDER_DATE): {
        setState(() {
          model.sortType = NotesListSortTypes.REMINDER_DATE;
        });
        break;
      }

      default: {
        SystemEventsHandler.onInfo(info: "NotesListSortOptionsMenuController->sortOptionPressHandler()->UNKNOWN_SORT_OPTION: " + option);
      }
    }
  }

  void groupByCategoriesPressHandler(NotesListModel model, Function setState) {
    SystemEventsHandler.onInfo(info: "NotesListSortOptionsMenuController->groupByCategoriesPressHandler()");

    setState(() {
      model.groupByCategories = !model.groupByCategories;
    });
  }

  void compactViewPressHandler(NotesListModel model, Function setState) {
    SystemEventsHandler.onInfo(info: "NotesListSortOptionsMenuController->compactViewPressHandler()");

    setState(() {
      model.useCompactView = !model.useCompactView;
    });
  }
}