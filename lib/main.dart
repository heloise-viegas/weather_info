import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:z_weather_info/weather.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Weather(), //builder replaced by create
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Heading(),
              Content(),
            ],
          ),
        ),
        floatingActionButton: Fab(),
      ),
    );
  }
}

class Heading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var w1 = Provider.of<Weather>(context);
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Text(w1.tType),
    );
  }
}

class Content extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var w2 = Provider.of<Weather>(context);
    return Padding(
      padding: const EdgeInsets.all(10.0), //
      child: Text('${w2.tVal}'),

      //incase we dont want to use Provider.of
      // Consumer<Weather>(
      //   builder: (context, w3, _) => Text('${w3.tVal}'),
      // ),
    );
  }
}

class Fab extends StatelessWidget {
  Color getColor(String c) {
    return c == 'celcius' ? Colors.deepOrange : Colors.green;
  }

  @override
  Widget build(BuildContext context) {
    var weather = Provider.of<Weather>(context);
    return FloatingActionButton(
      backgroundColor: getColor(weather.tType),
      child: Icon(Icons.build_circle_outlined),
      onPressed: () {
        String tWeather =
            weather.tType == 'celcius' ? 'far' : 'celcius'; //use getter
        weather.tempType = tWeather; //use setter
        int tVal = weather.tType != 'celcius' ? 70 : 25; //use getter
        weather.tempVal = tVal;
      },
    );
  }
}
