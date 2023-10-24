// ignore_for_file: camel_case_types

import 'package:authentication/home.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import './signup.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _LoginState();
}

class _LoginState extends State<login> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  Future<void> login(String email, password) async {
    try {
      String url =
          'https://newt-assured-curiously.ngrok-free.app/api/login.php';
      var res = await http
          .post(Uri.parse(url), body: {'email': email, 'password': password});

      var response = json.decode(res.body.toString());
      if (response == "Success") {
        Fluttertoast.showToast(
          msg: "Login Successful",
          toastLength: Toast.LENGTH_LONG,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.greenAccent,
          textColor: Colors.white,
          fontSize: 16.0,
        );
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Home()));
      } else {
        Fluttertoast.showToast(
            msg: "Not Matched",
            toastLength: Toast.LENGTH_LONG,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    } catch (ex) {
      print(ex.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(30.0),
          child: Column(children: [
            const SizedBox(height: 50),
            Container(
              height: 160.0,
              width: 190.0,
              padding: const EdgeInsets.only(top: 40),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(200),
              ),
              child: Center(
                child: Image.network(
                    'https://icons-for-free.com/iconfiles/png/512/login-1329545823141024311.png'),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              "Welcome back",
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const SizedBox(height: 10),
            Text(
              "Login to your account",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            //field1
            const SizedBox(height: 60),
            TextFormField(
              controller: emailcontroller,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                labelText: "Email",
                prefixIcon: const Icon(
                  Icons.email_outlined,
                  color: Color.fromARGB(255, 13, 71, 161),
                ),
                border: OutlineInputBorder(
                  borderSide:
                      const BorderSide(width: 2, color: Colors.blueAccent),
                  borderRadius: BorderRadius.circular(20),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 2, color: Colors.blue.shade900),
                  borderRadius: BorderRadius.circular(20),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      const BorderSide(width: 2, color: Colors.blueAccent),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            //field2
            const SizedBox(height: 10),
            TextFormField(
              controller: passwordcontroller,
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecoration(
                labelText: "Password",
                prefixIcon: const Icon(
                  Icons.fingerprint_outlined,
                  color: Color.fromARGB(255, 13, 71, 161),
                ),
                border: OutlineInputBorder(
                  borderSide:
                      const BorderSide(width: 2, color: Colors.blueAccent),
                  borderRadius: BorderRadius.circular(20),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 2, color: Colors.blue.shade900),
                  borderRadius: BorderRadius.circular(20),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      const BorderSide(width: 2, color: Colors.blueAccent),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            //login btn
            const SizedBox(height: 60),
            Column(children: [
              ElevatedButton(
                onPressed: () {
                  login(emailcontroller.text.toString(),
                      passwordcontroller.text.toString());
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue.shade900,
                  minimumSize: const Size.fromHeight(60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text(
                  "Login",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account?"),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const signup()));
                    },
                    child: const Text("Signup"),
                  ),
                ],
              ),
            ]),
          ]),
        ),
      ),
    );
  }
}
