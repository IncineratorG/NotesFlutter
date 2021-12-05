import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:notes_flutter/components/specific/notes_list/app_bar/notes_list_app_bar.dart';
import 'package:notes_flutter/components/specific/notes_list/sort_options_menu_button/sort_options_menu_button.dart';
import 'package:notes_flutter/data/common/notes_list_sort_types/notes_list_sort_types.dart';
import 'package:notes_flutter/screens/notes_list/controllers/notes_list_main_controller.dart';
import 'package:notes_flutter/screens/notes_list/models/notes_list_model.dart';
import 'package:notes_flutter/utils/common/localization/localization.dart';

class NotesList extends StatefulWidget {
  const NotesList({Key? key}) : super(key: key);

  @override
  State createState() {
    return _NotesListState();
  }
}

class _NotesListState extends State<NotesList> {
  @override
  void initState() {
    super.initState();

    GetIt.I.registerSingleton<NotesListModel>(NotesListModel());
    GetIt.I.registerSingleton<NotesListMainController>(NotesListMainController());
  }

  @override
  void dispose() {
    super.dispose();

    GetIt.I.unregister<NotesListModel>();
    GetIt.I.unregister<NotesListMainController>();
  }

  @override
  Widget build(BuildContext context) {
    NotesListModel model = GetIt.I.get<NotesListModel>();
    NotesListMainController controller = GetIt.I.get<NotesListMainController>();

    var sortOptionMenuButton = SortOptionsMenuButton(
        selectedSortOption: model.sortType,
        groupByCategories: model.groupByCategories,
        useCompactView: model.useCompactView,
        onSortOptionPressed: (String sortOption) {
          controller.sortOptionsMenuController.sortOptionPressHandler(sortOption, model, setState);
        },
        onGroupByCategoriesPressed: () {
          controller.sortOptionsMenuController.groupByCategoriesPressHandler(model, setState);
        },
        onCompactViewPressed: () {
          controller.sortOptionsMenuController.compactViewPressHandler(model, setState);
        }
    );

    return Scaffold(
      appBar: NotesListAppBar(
        appBarText: GetIt.I<Localization>().t(pattern: "NoteList_screenTitle"),
        sortOptionsMenuButton: sortOptionMenuButton,
        menuPressHandler: controller.headerController.menuPressHandler,
        searchPressHandler: controller.headerController.searchPressHandler,
      ),
    );
  }
}
