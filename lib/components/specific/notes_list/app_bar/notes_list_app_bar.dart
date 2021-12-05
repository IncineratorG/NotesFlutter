import 'package:flutter/material.dart';
import 'package:notes_flutter/assets/styles/app_styles.dart';
import 'package:notes_flutter/components/common/app_bar_icon/app_bar_icon.dart';
import 'package:notes_flutter/components/specific/notes_list/sort_options_menu_button/sort_options_menu_button.dart';
import 'package:notes_flutter/data/common/notes_list_sort_types/notes_list_sort_types.dart';
import 'package:notes_flutter/utils/common/system_events_handler/system_events_handler.dart';

class NotesListAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String appBarText;
  final SortOptionsMenuButton sortOptionsMenuButton;
  final Function menuPressHandler;
  final Function searchPressHandler;

  const NotesListAppBar({
    Key? key,
    required this.appBarText,
    required this.sortOptionsMenuButton,
    required this.menuPressHandler,
    required this.searchPressHandler,
  }) : preferredSize = const Size.fromHeight(kToolbarHeight), super(key: key);

  @override
  final Size preferredSize; // default is 56.0

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
            flex: 1,
            child: Container(
              color: AppStyles.headerColor,
              child: Column(
                children: [
                  Container(
                      height: 24,
                      color: AppStyles.headerColor
                  ),
                  Expanded(
                      child: Row(
                        children: [
                          AppBarIcon(
                            icon: Icons.menu,
                            onPressed: () {
                              menuPressHandler();
                            },
                          ),
                          Expanded(
                            child: Container(
                              color: AppStyles.headerColor,
                              child: Center(
                                child: Text(
                                  appBarText,
                                  style: const TextStyle(
                                      color: AppStyles.headerTextColor,
                                      fontSize: 18
                                  ),
                                ),
                              ),
                            ),
                          ),
                          AppBarIcon(
                            icon: Icons.search,
                            onPressed: () {
                              searchPressHandler();
                            },
                          ),
                          sortOptionsMenuButton,
                          // SortOptionsMenuButton(
                          //     selectedSortOption: NotesListSortTypes.MANUAL,
                          //     groupByCategories: false,
                          //     useCompactView: false,
                          //     onSortOptionPressed: (String sortOption) {
                          //       SystemEventsHandler.onInfo(info: "NotesListAppBar->onSortOptionPressed(): " + sortOption);
                          //     },
                          //     onGroupByCategoriesPressed: () {
                          //       SystemEventsHandler.onInfo(info: "NotesListAppBar->onGroupByCategoriesPressed()");
                          //     },
                          //     onCompactViewPressed: () {
                          //       SystemEventsHandler.onInfo(info: "NotesListAppBar->onCompactViewPressed()");
                          //     }
                          // )
                        ],
                      )
                  )
                ],
              ),
            )
        ),
      ],
    );
  }
}