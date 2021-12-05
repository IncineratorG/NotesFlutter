import 'package:notes_flutter/data/common/notes_list_sort_types/notes_list_sort_types.dart';

class NotesListModel {
  String sortType = NotesListSortTypes.MANUAL;
  bool useCompactView = false;
  bool groupByCategories = false;

  NotesListModel();
}