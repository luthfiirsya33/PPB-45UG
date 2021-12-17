import 'package:flutter/material.dart';
class LoginScreen extends StatefulWidget {
  @override 
  _LoginScreenState createState() => _LoginScreenState();
}
class _LoginScreenState extends State<LoginScreen>{
  bool isHiddenPassword = true;
  

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
                "Login Screen",
                style: TextStyle(
                  color: Colors.blue[700],
                  fontWeight: FontWeight.w500,
                  fontSize: 30),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image(image: AssetImage("assets/img/flutter.png"),
                height: 200,
                width: 200,
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: "Email",
                  prefixIcon: Icon(Icons.email),),
                )),
            Container(
              padding: EdgeInsets.all(10),
              child: TextField(
                obscureText: isHiddenPassword,
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
                          Text("Forgot Password ? "),
                        ]),
                  
                      SizedBox(height: 20),
                      Container(
                        height: 50,
                        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: ElevatedButton(
                          style: raisedButtonStyle,
                          child: Text('Login'),
                          onPressed: (){},
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
  primary: Colors.blue[700],
  minimumSize: Size(88, 36),
  padding: EdgeInsets.symmetric(horizontal: 16),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(6))
  ),
);