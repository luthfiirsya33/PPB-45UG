import 'package:flutter/material.dart';
import 'package:flutter_newsapp/Views/BottomBar.dart';
import 'package:flutter_newsapp/Views/HomeScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_newsapp/Model/UserModel.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);
  @override 
  _RegisterScreenState createState() => _RegisterScreenState();
}
class _RegisterScreenState extends State<RegisterScreen>{
  bool isHiddenPassword = true;
  final _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController =  TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  registerSubmit() async{
    try {
      await _auth.createUserWithEmailAndPassword(
        email: _emailController.text.toString().trim(),
        password: _passwordController.text)
        .then((value) => {postDetailsToFirestore()});
    }catch (e){
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
              child: TextFormField(
                controller: _firstNameController,
                keyboardType: TextInputType.name,
                validator: (value) {
                  RegExp regex = new RegExp(r'^.{3,}$');
                  if (value!.isEmpty) {
                    return ("First Name cannot be Empty");
                  }
                  if (!regex.hasMatch(value)) {
                    return ("Enter Valid name(Min. 3 Character)");
                  }
                  return null;
                },
                onSaved: (value) {
                  _firstNameController.text = value!;
                },
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: "Firstname",
                  prefixIcon: Icon(Icons.person),),
                )),
            Container(
              padding: EdgeInsets.all(10),
              child: TextFormField(
                controller: _lastNameController,
                keyboardType: TextInputType.name,
                validator: (value) {
                  if (value!.isEmpty) {
                    return ("Last Name cannot be Empty");
                  }
                  return null;
                },
                onSaved: (value) {
                  _lastNameController.text = value!;
                },
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: "Lastname",
                  prefixIcon: Icon(Icons.person),),
                )),
            Container(
              padding: EdgeInsets.all(10),
              child: TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value!.isEmpty) {
                    return ("Please Enter Your Email");
                  }
                  // reg expression for email validation
                  if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                      .hasMatch(value)) {
                    return ("Please Enter a valid email");
                  }
                  return null;
                },
                onSaved: (value) {
                  _emailController.text = value!;
                },
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: "Email",
                  prefixIcon: Icon(Icons.email),),
                )),
            Container(
              padding: EdgeInsets.all(10),
              child: TextFormField(
                obscureText: isHiddenPassword,
                controller: _passwordController,
                        validator: (value) {
                  RegExp regex = new RegExp(r'^.{6,}$');
                  if (value!.isEmpty) {
                    return ("Password is required for login");
                  }
                  if (!regex.hasMatch(value)) {
                    return ("Enter Valid Password(Min. 6 Character)");
                  }
                },
                onSaved: (value) {
                  _passwordController.text = value!;
                },
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: "Password",
                  prefixIcon: Icon(Icons.security),
                  suffixIcon: InkWell(
                    onTap: _togglePasswordView,
                  child: Icon(
                    Icons.visibility,
                  ))),
                )),
                Container(
              padding: EdgeInsets.all(10),
              child: TextFormField(
                obscureText: isHiddenPassword,
                controller: _confirmPasswordController,
                validator: (value) {
                  if (_confirmPasswordController.text !=_passwordController.text) {
                      return "Password don't match";
                }
                return null;
              },
                onSaved: (value) {
                  _confirmPasswordController.text = value!;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: "Confirm Password",
                  prefixIcon: Icon(Icons.security),
                  suffixIcon: InkWell(
                    onTap: _togglePasswordView,
                  child: Icon(
                    Icons.visibility,
                  ))),
                )),
                SizedBox(height:10),
                  Container(
                    height: 50,
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: ElevatedButton(
                      style: raisedButtonStyle,
                      child: Text("Register"),
                      onPressed: (){
                        registerSubmit();;
                      })),
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
        postDetailsToFirestore() async {
    // calling our firestore
    // calling our user model
    // sending these values

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    UserModel userModel = UserModel();

    // writing all the values
    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.firstName = _firstNameController.text;
    userModel.lastName = _lastNameController.text;

    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userModel.toMap());
    Fluttertoast.showToast(msg: "Account created successfully ");

    Navigator.pushAndRemoveUntil(
        (context),
        MaterialPageRoute(builder: (context) => BottomBar()),
        (route) => false);
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

