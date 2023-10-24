// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import './login.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';

class signup extends StatefulWidget {
  const signup({super.key});

  @override
  State<signup> createState() => _SignupState();
}

class _SignupState extends State<signup> {
  TextEditingController firstnamecontroller = TextEditingController();
  TextEditingController lastnamecontroller = TextEditingController();
  TextEditingController usernamecotroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  Future<void> signup() async {
    try {
      if (firstnamecontroller.text == "" ||
          lastnamecontroller.text == "" ||
          usernamecotroller.text == "") {
        Fluttertoast.showToast(
            msg: "Fill all the fields",
            toastLength: Toast.LENGTH_LONG,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      } else {
        String url =
            'https://newt-assured-curiously.ngrok-free.app/api/signup.php';
        var res = await http.post(Uri.parse(url), body: {
          'firstname': firstnamecontroller.text,
          'lastname': lastnamecontroller.text,
          'username': usernamecotroller.text,
          'email': emailcontroller.text,
          'password': passwordcontroller.text
        });

        var response = json.decode(res.body.toString());
        if (response == "Success") {
          Fluttertoast.showToast(
              msg: "Data Inserted",
              toastLength: Toast.LENGTH_LONG,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.greenAccent,
              textColor: Colors.white,
              fontSize: 16.0);
        } else {
          print("Error");
        }
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
            const SizedBox(height: 0),
            Container(
              height: 150.0,
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
              "REGISTER",
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const SizedBox(height: 10),
            Text(
              "Create your account",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            //field1
            const SizedBox(height: 20),
            TextFormField(
              controller: firstnamecontroller,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                labelText: "First Name",
                prefixIcon: const Icon(
                  Icons.person_rounded,
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
              controller: lastnamecontroller,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                labelText: "Last Name",
                prefixIcon: const Icon(
                  Icons.person_rounded,
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
            //field3
            const SizedBox(height: 10),
            TextFormField(
              controller: usernamecotroller,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                labelText: "Username",
                prefixIcon: const Icon(
                  Icons.person_outline,
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
            //field4
            const SizedBox(height: 10),
            TextFormField(
              controller: emailcontroller,
              keyboardType: TextInputType.visiblePassword,
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
            //field5
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
            const SizedBox(height: 40),
            Column(children: [
              ElevatedButton(
                onPressed: signup,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue.shade900,
                  minimumSize: const Size.fromHeight(60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text(
                  "REGISTER",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account?"),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const login()));
                    },
                    child: const Text("Login"),
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
