import 'package:authentication/login.dart';
import 'package:flutter/material.dart';
import 'package:authentication/main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class First extends StatelessWidget {
  const First({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'Home',
    );
  }
}

class Search extends StatelessWidget {
  const Search({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'Likes',
    );
  }
}

class Settings extends StatelessWidget {
  const Settings({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'Settings',
    );
  }
}

class Logout extends StatelessWidget {
  const Logout({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        var sharedpref = await SharedPreferences.getInstance();
        sharedpref.setBool(SplashPageState.KEYLOGIN, false);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const login()));
      },
      child: Text("Logout"),
    );
  }
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    First(),
    Search(),
    Settings(),
    Logout(),
  ];

  late Future<String> email; // Make email non-nullable

  @override
  void initState() {
    super.initState();
    email = getEmail(); // Assign the future returned by getEmail()
  }

  Future<String> getEmail() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var obtemail = sharedPreferences.getString("email");
    return obtemail ?? "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _selectedIndex >= 0 && _selectedIndex < _widgetOptions.length
            ? _widgetOptions[_selectedIndex]
            : Text('Invalid Index'),
      ),
      bottomNavigationBar: Container(
        color: Colors.blueAccent,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
          child: GNav(
            rippleColor:
                Colors.blueAccent, // tab button ripple color when pressed
            hoverColor: Colors.blue,
            gap: 8,
            tabBorderRadius: 30,
            backgroundColor: Colors.blueAccent,
            color: Colors.white,
            tabBackgroundColor: Colors.white,
            activeColor: Colors.blueAccent,
            tabs: [
              GButton(icon: Icons.home_outlined, text: 'First'),
              GButton(icon: Icons.search_rounded, text: 'Search'),
              GButton(icon: Icons.settings, text: 'Settings'),
              GButton(icon: Icons.logout_rounded, text: 'Logout'),
            ],
            selectedIndex: _selectedIndex,
            onTabChange: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
          ),
        ),
      ),
    );
  }
}

// children: [
//   FutureBuilder<String>(
//     future: email,
//     builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
//       if (snapshot.connectionState == ConnectionState.waiting) {
//         return const CircularProgressIndicator();
//       } else if (snapshot.hasError) {
//         return Text('Error: ${snapshot.error}');
//       } else {
//         return Text("Email: ${snapshot.data}");
//       }
//     },
//   ),
//   const SizedBox(height: 20),
//   ElevatedButton(
//     onPressed: () async {
//       var sharedpref = await SharedPreferences.getInstance();
//       sharedpref.setBool(SplashPageState.KEYLOGIN, false);
//       Navigator.push(context,
//           MaterialPageRoute(builder: (context) => const login()));
//     },
//     style: ElevatedButton.styleFrom(
//       backgroundColor: Colors.redAccent,
//       minimumSize: const Size.fromHeight(60),
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(20),
//       ),
//     ),
//     child: const Text(
//       "Logout",
//       style: TextStyle(color: Colors.white),
//     ),
//   ),
// ],
