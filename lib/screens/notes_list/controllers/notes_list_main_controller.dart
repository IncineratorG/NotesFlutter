import 'package:notes_flutter/screens/notes_list/controllers/header/notes_list_header_controller.dart';
import 'package:notes_flutter/screens/notes_list/controllers/sort_options_menu/notes_list_sort_options_menu_controller.dart';

class NotesListMainController {
  final NotesListHeaderController _headerController = NotesListHeaderController();
  final NotesListSortOptionsMenuController _sortOptionsMenuController = NotesListSortOptionsMenuController();

  NotesListMainController();

  NotesListHeaderController get headerController => _headerController;
  NotesListSortOptionsMenuController get sortOptionsMenuController => _sortOptionsMenuController;
}