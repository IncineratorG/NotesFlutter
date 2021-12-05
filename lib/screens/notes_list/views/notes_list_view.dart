import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:notes_flutter/components/common/touchable_opacity/touchable_opacity.dart';
import 'package:notes_flutter/utils/common/localization/localization.dart';
import 'package:notes_flutter/utils/common/system_events_handler/system_events_handler.dart';

class NotesListView extends StatefulWidget {
  const NotesListView({Key? key}): super(key: key);

  @override
  State createState() {
    return _NotesListViewModel();
  }
}

class _NotesListViewModel extends State<NotesListView> {
  _NotesListViewModel();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void buttonOnePressHandler() {
    SystemEventsHandler.onInfo(info: "buttonOnePressHandler()->EN");

    GetIt.I<Localization>().changeLocale(locale: Localization.LOCALE_EN);
  }

  void buttonTwoPressHandler() {
    SystemEventsHandler.onInfo(info: "buttonTwoPressHandler()->RU");

    GetIt.I<Localization>().changeLocale(locale: Localization.LOCALE_RU);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
            flex: 1,
            child: Container(
              margin: const EdgeInsets.all(8.0),
              padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0, bottom: 8.0),
              color: Colors.orange,
              child: Column(
                children: <Widget>[
                  Container(
                      height: 50,
                      color: Colors.green,
                      child: const Center(
                        child: Text(
                          "String Value",
                          style: TextStyle(
                              color: Colors.white
                          ),
                        ),
                      )
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                        color: Colors.teal,
                    ),
                  )
                ],
              ),
            )
        ),
        Container(
            color: Colors.orange,
            height: 50,
            child: TouchableOpacity(
              onTap: buttonOnePressHandler,
              child: Container(
                  color: Colors.blueAccent,
                  margin: const EdgeInsets.all(8.0),
                  child: const Center(
                    child: Text(
                      "Button One",
                      style: TextStyle(
                          color: Colors.white
                      ),
                    ),
                  )
              ),
            )
        ),
        Container(
            color: Colors.orange,
            height: 50,
            child: TouchableOpacity(
              onTap: buttonTwoPressHandler,
              child: Container(
                  color: Colors.blueAccent,
                  margin: const EdgeInsets.all(8.0),
                  child: const Center(
                      child: Text(
                          "Button two",
                          style: TextStyle(
                              color: Colors.white
                          )
                      )
                  )
              ),
            )
        )
      ],
    );
  }
}