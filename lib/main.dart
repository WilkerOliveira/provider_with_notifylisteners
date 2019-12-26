import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_with_notifylisteners/my_model.dart';

import 'main_selector.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyModel(),
      child: MaterialApp(
        title: 'Provider with NotifyListeners',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MainSelector(title: 'Home Page'),
      ),
    );
  }
}