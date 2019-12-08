import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_with_notifylisteners/my_model.dart';

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
        home: MyHomePage(title: 'Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              'Date Without Consumer :' + DateTime.now().toString(),
            ),
            Consumer<MyModel>(
              builder: (context, model, child) => Column(
                children: <Widget>[
                  Text(
                    'Second Current Date :' + DateTime.now().toString(),
                  ),
                  FlatButton(
                    onPressed: () {
                      model.updateSecond();
                    },
                    child: Text("Increment Second: " + model.second),
                  ),
                ],
              ),
            ),
            Consumer<MyModel>(
              builder: (context, model, child) => Column(
                children: <Widget>[
                  Text(
                    'Third Current Date :' + DateTime.now().toString(),
                  ),
                  FlatButton(
                    onPressed: () {
                      model.updateThird();
                    },
                    child: Text("Increment Third: " + model.third),
                  ),
                ],
              ),
            ),
            Consumer<MyModel>(
              builder: (context, model, child) => Column(
                children: <Widget>[
                  Text(
                    'Listening a value :' + model.value.toString(),
                  ),
                  FlatButton(
                    onPressed: () {
                      model.changeValue();
                    },
                    child: Text("Change Value"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}