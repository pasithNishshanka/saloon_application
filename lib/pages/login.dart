import 'package:flutter/material.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
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
              child: Column( 
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [ 
                  Text(
                    "Gmail :", 
                    style: TextStyle(
                      color: Colors.red, 
                      fontSize: 24.0, 
                      fontWeight: FontWeight.w600),),
                  TextField(
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
                  TextField(
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

                    Container( 
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration( 
                        gradient: LinearGradient(colors: [
                          Color(0xFF891635),
                          Color(0xff621d3c),
                          Color(0xff311937),
                        ]
                       ),
                       borderRadius: BorderRadius.circular(30.0),
                      ),
                    )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}






