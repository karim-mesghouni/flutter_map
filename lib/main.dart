import 'package:flutter/material.dart';
import 'package:jame3ty_map/data/data_sources/data_source_r.dart';
import 'package:jame3ty_map/presintation/pages/google_map_page.dart';
import 'package:provider/provider.dart';

import 'data/data_sources/dijkstraShortestPath.dart';

void main() {


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DijkstraShortestPath()),
        ChangeNotifierProvider(create: (_) => Data())
      ],
      child: MaterialApp(
showSemanticsDebugger: false,        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        title: Text("Map"),
      ),
      body: const GoogleMapScreen(),
      //This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
