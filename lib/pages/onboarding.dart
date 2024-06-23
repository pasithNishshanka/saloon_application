import 'package:flutter/material.dart';
import 'package:saloon_application/pages/login.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<Onboarding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 35, 31, 32),
      body: Container(
        margin: const EdgeInsets.only(top: 220.0, left: 55.0),
        child: Column( 
          children: [ 
            Image.asset("assest/images/saloonOnboarding.jpg"),

            SizedBox(height: 150.0,),


            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => LogIn()));
              },
              child: Container( 
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                decoration: BoxDecoration( 
                  color: Color.fromARGB(255, 251, 250, 248),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: const Text("Get Your Style", 
                style: TextStyle( 
                  color: Color.fromARGB(255, 5, 5, 5), 
                  fontSize: 24.0, 
                  fontWeight: FontWeight.bold),
                  ),
              ),
            )
          ],
        ),
      ),
    );
  }
}