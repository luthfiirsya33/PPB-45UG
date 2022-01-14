import 'package:flutter/material.dart';
import 'package:flutter_newsapp/Views/BottomBar.dart';
import 'package:flutter_newsapp/Views/HomeScreen.dart';
import 'package:flutter_newsapp/RegisterScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginScreen extends StatefulWidget {
  @override 
  _LoginScreenState createState() => _LoginScreenState();
}
class _LoginScreenState extends State<LoginScreen>{
  bool isHiddenPassword = true;
  final TextEditingController _emailController =  TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  loginSubmit() async {
    try{
      _firebaseAuth
          .signInWithEmailAndPassword(
            email: _emailController.text, password: _passwordController.text)
          .then((value)=>{Fluttertoast.showToast(msg: "Login Successful"),
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> BottomBar()))});
    } catch (e){
      print(e);
      SnackBar(content: Text(e.toString()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(10),
              margin:  const EdgeInsets.only(top: 40),
              child: Text(
                "UPI NewsApp",
                style: TextStyle(
                  color: Colors.red[700],
                  fontWeight: FontWeight.w500,
                  fontSize: 30),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image(image: AssetImage("assets/img/Logoku.png"),
                height: 200,
                width: 200,
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: "Email",
                  prefixIcon: Icon(Icons.email),),
                )),
            Container(
              padding: EdgeInsets.all(10),
              child: TextField(
                obscureText: isHiddenPassword,
                controller: _passwordController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: "Password",
                  prefixIcon: Icon(Icons.security),
                  suffixIcon: InkWell(
                    onTap: _togglePasswordView,
                  child: Icon(
                    Icons.visibility,
                  ))),
                )),
                SizedBox(height:20),
                Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("Don't have an account ? "),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          RegisterScreen()));
                            },
                            child: Text(
                              "SignUp",
                              style: TextStyle(
                                  color: Colors.red[700],
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                          )
                        ]),
                  
                      SizedBox(height: 20),
                      Container(
                        height: 50,
                        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: ElevatedButton(
                          style: raisedButtonStyle,
                          child: Text('Login'),
                          onPressed: (){
                            loginSubmit();
                          },
                          )),
            ],
        ),
        ),
        );
        }
        void _togglePasswordView(){
          setState((){
            isHiddenPassword = !isHiddenPassword;
          });
        }
}

final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
  onPrimary: Colors.white,
  primary: Colors.red[700],
  minimumSize: Size(88, 36),
  padding: EdgeInsets.symmetric(horizontal: 16),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(6))
  ),
);