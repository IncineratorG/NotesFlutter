import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:notes_flutter/assets/styles/app_styles.dart';
import 'package:notes_flutter/data/common/notes_list_sort_types/notes_list_sort_types.dart';
import 'package:notes_flutter/utils/common/localization/localization.dart';

class SortOptionsMenuButton extends StatelessWidget {
  final String selectedSortOption;
  final bool groupByCategories;
  final bool useCompactView;
  final Function onSortOptionPressed;
  final Function onGroupByCategoriesPressed;
  final Function onCompactViewPressed;

  const SortOptionsMenuButton({
    Key? key,
    required this.selectedSortOption,
    required this.groupByCategories,
    required this.useCompactView,
    required this.onSortOptionPressed,
    required this.onGroupByCategoriesPressed,
    required this.onCompactViewPressed
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const String compactViewOptionValue = "compactView";
    const String groupByCategoriesOptionValue = "groupByCategories";

    void onListItemPressHandler(String itemValue) {
      if (itemValue == compactViewOptionValue) {
        onCompactViewPressed();
      } else if (itemValue == groupByCategoriesOptionValue) {
        onGroupByCategoriesPressed();
      } else {
        onSortOptionPressed(itemValue);
      }
    }

    Localization localization = GetIt.I<Localization>();

    const checkedRadioButtonIcon = Icon(Icons.radio_button_checked, color: AppStyles.activeItemColor);
    const uncheckedRadioButtonIcon = Icon(Icons.radio_button_unchecked);

    const checkedCheckboxIcon = Icon(Icons.check_box, color: AppStyles.activeItemColor);
    const uncheckedCheckboxIcon = Icon(Icons.check_box_outline_blank);

    var sortManuallyOption = PopupMenuItem<String>(
      value: NotesListSortTypes.MANUAL,
      child: ListTile(
        trailing: selectedSortOption == NotesListSortTypes.MANUAL ? checkedRadioButtonIcon : uncheckedRadioButtonIcon,
        title: Text(localization.t(pattern: "SortOptionMenu_sortManually")),
      ),
    );

    var sortAlphabeticallyOption = PopupMenuItem<String>(
      value: NotesListSortTypes.ALPHABETICAL,
      child: ListTile(
        trailing: selectedSortOption == NotesListSortTypes.ALPHABETICAL ? checkedRadioButtonIcon : uncheckedRadioButtonIcon,
        title: Text(localization.t(pattern: "SortOptionMenu_sortAlphabetically")),
      ),
    );

    var sortByLastUpdateOption = PopupMenuItem<String>(
      value: NotesListSortTypes.LAST_UPDATE_DATE,
      child: ListTile(
        trailing: selectedSortOption == NotesListSortTypes.LAST_UPDATE_DATE ? checkedRadioButtonIcon : uncheckedRadioButtonIcon,
        title: Text(localization.t(pattern: "SortOptionMenu_sortByLastUpdate")),
      ),
    );

    var sortByCreationDateOption = PopupMenuItem<String>(
      value: NotesListSortTypes.CREATION_DATE,
      child: ListTile(
        trailing: selectedSortOption == NotesListSortTypes.CREATION_DATE ? checkedRadioButtonIcon : uncheckedRadioButtonIcon,
        title: Text(localization.t(pattern: "SortOptionMenu_sortByCreationDate")),
      ),
    );

    var sortByReminderDateOption = PopupMenuItem<String>(
      value: NotesListSortTypes.REMINDER_DATE,
      child: ListTile(
        trailing: selectedSortOption == NotesListSortTypes.REMINDER_DATE ? checkedRadioButtonIcon : uncheckedRadioButtonIcon,
        title: Text(localization.t(pattern: "SortOptionMenu_sortByReminderDate")),
      ),
    );

    var groupByCategoriesOption = PopupMenuItem<String>(
      value: groupByCategoriesOptionValue,
      enabled: selectedSortOption != NotesListSortTypes.MANUAL,
      child: Opacity(
        opacity: selectedSortOption != NotesListSortTypes.MANUAL ? 1.0 : 0.5,
        child: ListTile(
          trailing: groupByCategories ? checkedCheckboxIcon : uncheckedCheckboxIcon,
          title: Text(localization.t(pattern: "SortOptionMenu_groupByCategories")),
        ),
      )
    );

    var compactViewOption = PopupMenuItem<String>(
      value: compactViewOptionValue,
      child: ListTile(
        trailing: useCompactView ? checkedCheckboxIcon : uncheckedCheckboxIcon,
        title: Text(localization.t(pattern: "SortOptionMenu_compactView")),
      ),
    );

    return PopupMenuButton<String>(
      icon: const Icon(Icons.sort, color: Colors.white),
      onSelected: (String result) {
        onListItemPressHandler(result);
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
        sortManuallyOption,
        sortAlphabeticallyOption,
        sortByLastUpdateOption,
        sortByCreationDateOption,
        sortByReminderDateOption,
        groupByCategoriesOption,
        compactViewOption
      ],
    );
  }
}