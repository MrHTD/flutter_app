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
          fontFamily: 'Raleway'),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "MyApp",
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(
          height: 100,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 16),
          child: Text(
            'GET ON BOARD!',
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w900,
                color: Colors.deepOrange),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
          child: Text(
            'Create your profile to start your jorney!',
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.w700, color: Colors.black),
          ),
        ),
        //textbox
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextField(
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
                borderSide:
                    const BorderSide(color: Colors.deepOrange, width: 1),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
                borderSide: const BorderSide(
                    width: 2,
                    color: Colors
                        .deepOrange), // Change the color to your desired color
              ),
              prefixIcon: const Icon(Icons.person),
              prefixIconColor: Colors.deepOrange,
              hintText: 'Enter Fullname',
            ),
            style: const TextStyle(color: Colors.deepOrange),
            cursorColor: Colors.deepOrange,
          ),
        ),
      body: ListView.builder(
        itemCount: jsonList == [] ? 0 : jsonList.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return MyWidget(object: jsonList[index]);
        },
      ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
          child: TextField(
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
                borderSide:
                    const BorderSide(color: Colors.deepOrange, width: 1),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
                borderSide: const BorderSide(
                    width: 2,
                    color: Colors
                        .deepOrange), // Change the color to your desired color
              ),
              prefixIcon: const Icon(Icons.fingerprint_outlined),
              prefixIconColor: Colors.deepOrange,
              hintText: 'Enter Password',
            ),
            style: const TextStyle(color: Colors.deepOrange),
            cursorColor: Colors.deepOrange,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: SizedBox(
            width: 100000, // Set your desired width
            height: 50, // Set your desired height
            child: ElevatedButton(
              onPressed: () {}, // Empty callback
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepOrange,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                // Set the button's background color here
              ),
              child: const Text(
                'SIGNUP',
                style: TextStyle(
                  color: Colors.white, // Set the text color here
                ),
              ),
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(10),
          child: Center(child: Text("OR")),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: SizedBox(
            width: 100000, // Set your desired width
            height: 50, // Set your desired height
            child: ElevatedButton(
              onPressed: () {}, // Empty callback
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black87,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        20.0)), // Set the button's background color here
              ),
              child: const Text(
                'SIGN WITH GOOGLE',
                style: TextStyle(
                  color: Colors.white, // Set the text color here
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
