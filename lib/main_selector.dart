import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_with_notifylisteners/my_model.dart';

class MainSelector extends StatefulWidget {
  MainSelector({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MainSelectorState createState() => _MainSelectorState();
}

class _MainSelectorState extends State<MainSelector> {
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
              'Date Without Selector :' + DateTime.now().toString(),
            ),
            Selector<MyModel, String>(
              builder: (context, value, child) => Column(
                children: <Widget>[
                  Text(
                    'Second Current Date :' + DateTime.now().toString(),
                  ),
                  FlatButton(
                    onPressed: () {
                      myModel.updateSecond();
                    },
                    child: Text("Increment Second: " + value),
                  ),
                ],
              ),
              selector: (buildContext, model) => model.second,
            ),
            Selector<MyModel, String>(
              builder: (context, value, child) => Column(
                children: <Widget>[
                  Text(
                    'Third Current Date :' + DateTime.now().toString(),
                  ),
                  FlatButton(
                    onPressed: () {
                      myModel.updateThird();
                    },
                    child: Text("Increment Third: " + value),
                  ),
                ],
              ),
              selector: (buildContext, model) => model.third,
            ),
            Selector<MyModel, int>(
              builder: (context, value, child) => Column(
                children: <Widget>[
                  Text(
                    'Listening a value:' + value.toString(),
                  ),
                  Text(
                    'Third Current Date:' + DateTime.now().toString(),
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
