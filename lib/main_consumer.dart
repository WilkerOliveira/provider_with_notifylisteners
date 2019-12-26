import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_with_notifylisteners/my_model.dart';

class MainConsumer extends StatefulWidget {
  MainConsumer({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MainConsumerState createState() => _MainConsumerState();
}

class _MainConsumerState extends State<MainConsumer> {
  @override
  Widget build(BuildContext context) {
    MyModel myModel = Provider.of<MyModel>(context, listen: false);
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
            Selector<MyModel, int>(
              builder: (context, value, child) => Column(
                children: <Widget>[
                  Text(
                    'Listening a value with Selector :' + value.toString(),
                  ),
                  Text(
                    'Third Current Date :' + DateTime.now().toString(),
                  ),
                  FlatButton(
                    onPressed: () {
                      myModel.changeValue();
                    },
                    child: Text("Change Value"),
                  ),
                ],
              ),
              selector: (buildContext, model) => model.value,
            ),
          ],
        ),
      ),
    );
  }
}
