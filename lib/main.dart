// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              indicatorColor: Colors.redAccent,
              labelColor: Colors.redAccent,
              tabs: [
                Tab(
                    icon: Icon(Icons.apps),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text("APPS"),
                    )),
                Tab(
                    icon: Icon(Icons.movie),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text("MOVIES"),
                    )),
                Tab(
                    icon: Icon(Icons.games),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text("GAMES"),
                    )),
              ],
            ),
            title: const Text('Tabs'),
            backgroundColor: Colors.black,
          ),
          body: const TabBarView(
            children: [
              Center(
                  child: Text(
                'Content of Tab One',
                style: TextStyle(color: Colors.red),
              )),
              Center(
                  child: Text(
                'Content of Tab Two',
                style: TextStyle(color: Colors.red),
              )),
              Center(
                  child: Text(
                'Content of Tab Three',
                style: TextStyle(color: Colors.red),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
