import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_newsapp/LoginScreen.dart';
import 'package:flutter_newsapp/RegisterScreen.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({ Key? key }) : super(key: key);

  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                color: Colors.red[700],   
            ),
            child: Container(
              width: double.infinity,
              height: 350.0,
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                      Icon(FontAwesomeIcons.newspaper,
                                        size: 100, 
                                        color: Colors.white, 
                                    ),
            SizedBox(height: 24.0,),

            Text("UPI NewsApp",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 30.0,
              ),
            ),
                    
                    SizedBox(
                      height: 10.0,
                    ),
                  ],
                ),
              ),
            )
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 30.0,horizontal: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                      "Welcome to My Application",
                    style: TextStyle(
                      color: Colors.red[700],
                      fontStyle: FontStyle.normal,
                      fontSize: 36
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text('UPI NewsApp is a mobile based application using the dart language and flutter framework.\n' 
                  'This application uses 2 APIs, namely News Api and Google Maps Api.',
                    style: TextStyle(
                      fontSize: 22.0,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w300,
                      color: Colors.black,
                      letterSpacing: 2.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            width: 300.00,

            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
              primary: Colors.white,
              backgroundColor: Colors.red[700],),
              onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginScreen(),));
              },
              
                child: Container(
                  constraints: BoxConstraints(maxWidth: 300.0, minHeight: 50.0),
                  alignment: Alignment.center,
                  child: Text("Login",
                  style: TextStyle(color: Colors.white, fontSize: 26.0, fontWeight:FontWeight.w300),
                  ),
                ),
              )
            ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: 300.00,

            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
              primary: Colors.white,
              backgroundColor: Colors.white,
              side: BorderSide(color: Color(0xFFD32F2F), width: 3),
            ),
              onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => RegisterScreen(),));
              },
              
                child: Container(
                  constraints: BoxConstraints(maxWidth: 300.0, minHeight: 50.0),
                  alignment: Alignment.center,
                  child: Text("Register",
                  style: TextStyle(color: Colors.red[700], fontSize: 26.0, fontWeight:FontWeight.w300),
                  ),
                ),
              )
            ),
        ],
      ),
    );
  }
}

