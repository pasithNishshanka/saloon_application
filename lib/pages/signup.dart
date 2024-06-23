import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:random_string/random_string.dart';
import 'package:saloon_application/pages/home.dart';
import 'package:saloon_application/pages/login.dart';
import 'package:saloon_application/services/database.dart';
import 'package:saloon_application/services/shared_pref.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String? name, email, password;

  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> registration() async {
    if (_formKey.currentState!.validate()) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
      setState(() {
        email = emailController.text.trim();
        name = nameController.text.trim();
        password = passwordController.text.trim();
      });

      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email!, password: password!);
            String id = randomAlphaNumeric(10);
            await SharedpreferenceHelper().saveUserName(nameController.text);
            await SharedpreferenceHelper().saveUserEmail(emailController.text);
            await SharedpreferenceHelper().saveUserImage("https://firebasestorage.googleapis.com/v0/barber-app");
            await SharedpreferenceHelper().saveUserId(id);
            Map<String, dynamic> userInfoMap= {
              "Name":nameController.text,
              "Email":emailController.text,
              "id":id,
              "image":"https://firebasestorage.googleapis.com/v0/barber-app;"
            };
            await DatabaseMethods().addUserDetails(userInfoMap, id);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Registered Successfully",
                style: TextStyle(fontSize: 20.0)),
          ),
        );
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const Home()),
        );
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Password is weak", style: TextStyle(fontSize: 20.0)),
            ),
          );
        } else if (e.code == 'email-already-in-use') {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content:
                  Text("Account already exists", style: TextStyle(fontSize: 20.0)),
            ),
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.only(top: 50.0, left: 20.0),
              height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
                  Color(0xFF891635),
                  Color(0xff621d3c),
                  Color(0xff311937),
                ]),
              ),
              child: Text(
                "Hello....\nCreate Your Sign Up!",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 40.0, left: 20.0, right: 20.0),
              margin: EdgeInsets.only(top: MediaQuery.of(context).size.height / 4),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50), topRight: Radius.circular(50)),
              ),
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Name :",
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 24.0,
                            fontWeight: FontWeight.w600),
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter name';
                          }
                          return null;
                        },
                        controller: nameController,
                        decoration: const InputDecoration(
                          hintText: "ABC",
                          prefixIcon: Icon(
                            Icons.person_2_outlined,
                          ),
                        ),
                      ),
                      SizedBox(height: 50.0),
                      Text(
                        "E-Mail :",
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 24.0,
                            fontWeight: FontWeight.w600),
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter e-mail';
                          }
                          if (!value.contains('@')) {
                            return 'Please enter a valid email';
                          }
                          return null;
                        },
                        controller: emailController,
                        decoration: InputDecoration(
                          hintText: "ABC@gmail.com",
                          prefixIcon: Icon(
                            Icons.email_outlined,
                          ),
                        ),
                      ),
                      SizedBox(height: 50.0),
                      Text(
                        "Password :",
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 24.0,
                            fontWeight: FontWeight.w600),
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter password';
                          }
                          return null;
                        },
                        controller: passwordController,
                        decoration: InputDecoration(
                          hintText: "ABC@123",
                          prefixIcon: Icon(
                            Icons.password_outlined,
                          ),
                        ),
                        obscureText: true,
                      ),
                      SizedBox(height: 20.0),
                      SizedBox(height: 45.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Already have an account?",
                            style: TextStyle(
                                color: Colors.redAccent,
                                fontSize: 18.0,
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(width: 10.0),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => LogIn()),
                              );
                            },
                            child: Text(
                              "Sign In",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w800),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 80.0),
                      GestureDetector(
                        onTap: () {
                          registration();
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.symmetric(vertical: 8.0),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(colors: [
                              Color(0xFF891635),
                              Color(0xff621d3c),
                              Color(0xff311937),
                            ]),
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          child: Center(
                            child: Text(
                              "Sign Up",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}