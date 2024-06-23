import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:saloon_application/pages/home.dart';
import 'package:saloon_application/pages/signup.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {

  String? mail,password;

  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  final _formkey = GlobalKey<FormState>();

  userLogin() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: mail!, password: password!);
      Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
    } on FirebaseException catch(e) {
      if(e.code=='user-not-found') {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Not user found that Email", style: TextStyle(fontSize: 18.0, color: Colors.black),),));
      }else if(e.code=='wrong-password') {
         ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("User provide wrong password", style: TextStyle(fontSize: 18.0, color: Colors.black),),));
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
              height: MediaQuery.of(context).size.height/2,
              width: MediaQuery.of(context).size.width,
              decoration:const BoxDecoration( 
                gradient: LinearGradient(colors: [
                   Color(0xFF891635),
                   Color(0xff621d3c),
                   Color(0xff311937),
                ]
                ),
              ) ,
              child: Text("Hello...\nSign In!", style: TextStyle(color: Colors.white, fontSize: 30.0, fontWeight: FontWeight.bold),),
            ),

            Container( 
              padding: EdgeInsets.only(top: 40.0, left: 20.0, right: 20.0),
              margin: EdgeInsets.only(top: MediaQuery.of(context).size.height/4),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration( 
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(50), topRight: Radius.circular(50)),
              ),
              child: SingleChildScrollView(
                child: Form(
                  key: _formkey,
                  child: Column( 
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [ 
                      Text(
                        "Gmail :", 
                        style: TextStyle(
                          color: Colors.red, 
                          fontSize: 24.0, 
                          fontWeight: FontWeight.w600),),
                      TextFormField(
                         validator: (value) {
                          if(value == null || value.isEmpty){
                            return 'Please Enter e-mail';
                          } 
                          return null;
                        },
                        controller: emailController,
                        decoration: InputDecoration( 
                          hintText: "ABC@gmail.com",
                          prefixIcon: Icon(
                            Icons.email_outlined
                            ),
                        )
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
                          if(value == null || value.isEmpty){
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
                  
                      SizedBox(height: 50.0),
                  
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                            "Forgot Password?", 
                            style: TextStyle(
                              color: Colors.blue, 
                              fontSize: 18.0, 
                              fontWeight: FontWeight.w400),
                              ),
                          ],
                        ),
                  
                        SizedBox(height: 45.0),
                  
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                            "Don't have an account yet?", 
                            style: TextStyle(
                              color: Colors.redAccent, 
                              fontSize: 18.0, 
                              fontWeight: FontWeight.w600),
                              ),
                  
                              SizedBox(width: 10.0),
                  
                               GestureDetector(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp()));
                                },
                                 child: Text(
                                    "Sign Up", 
                                      style: TextStyle(
                                        color: Colors.blue, 
                                        fontSize: 18.0, 
                                        fontWeight: FontWeight.w800),
                                  ),
                               ),
                          ],
                        ),
                  
                  
                        SizedBox(height: 100.0),
                  
                        GestureDetector(
                          onTap: () {
                            if(_formkey.currentState!.validate()){
                                    setState(() {
                                mail= emailController.text;
                                password= passwordController.text;
                              });
                              userLogin();
                                }
                          },
                          child: Container( 
                            width: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.symmetric(vertical: 8.0),
                            decoration: BoxDecoration( 
                              gradient: LinearGradient(colors: [
                                Color(0xFF891635),
                                Color(0xff621d3c),
                                Color(0xff311937),
                              ]
                             ),
                             borderRadius: BorderRadius.circular(30.0),
                            ),
                            child: Center(
                              child: Text("Sign In", 
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






