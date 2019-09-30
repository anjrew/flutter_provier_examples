import 'package:flutter/material.dart';
import 'package:flutter_provider_examples/model/main_model.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return Provider<MainModel>.value(
                value: MainModel(),
                child: MaterialApp(
                    title: 'Provider Demo',
                    theme: ThemeData(
                        primarySwatch: Colors.red,
                    ),
                    home: MyHomePage(title: 'Provider Demo'),
                ));
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
                child: Consumer<MainModel>(
                    builder: (BuildContext context, MainModel model, Widget child) => Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                            child,
                            Text(
                                '${model.counter}',
                                style: Theme.of(context).textTheme.display1,
                            )
                        ],
                    ),
					child: Text(Provider.of<MainModel>(context).indicator,),
                ),
            ),
            floatingActionButton: FloatingActionButton(
                onPressed: Provider.of<MainModel>(context).incrementCounter,
                tooltip: 'Increment',
                child: Icon(Icons.add),
            ),
        );
    }
}
