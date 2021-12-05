import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:notes_flutter/data/common/routes/app_routes.dart';
import 'package:notes_flutter/screens/notes_list/notes_list.dart';
import 'package:notes_flutter/utils/common/localization/localization.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    GetIt.I.registerSingleton<Localization>(Localization.init(context: context));
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        initialRoute: AppRoutes.NotesList,
        routes: {
          AppRoutes.NotesList: (context) => const NotesList(),
          // "second": (context) => const SecondScreen(),
        }
    );
  }
}
