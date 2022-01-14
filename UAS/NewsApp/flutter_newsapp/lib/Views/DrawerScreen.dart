import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_newsapp/LoginScreen.dart';
import 'package:flutter_newsapp/Views/AboutScreen.dart';
import 'package:flutter_newsapp/Views/DrawerScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_newsapp/Model/UserModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_newsapp/Views/MapScreen.dart';



class DrawerScreen extends StatefulWidget{
  const DrawerScreen({Key? key}) : super(key: key);
  @override 
  _DrawwerScreenState createState() => _DrawwerScreenState();
}
Future<void> _signOut() async{
   await FirebaseAuth.instance.signOut();
}

class _DrawwerScreenState extends State<DrawerScreen>{
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }
  @override 
  Widget build(BuildContext context){
    return Drawer(child: ListView(
      children: <Widget>[
        UserAccountsDrawerHeader(
          accountName: Text("${loggedInUser.firstName} ${loggedInUser.lastName}"),
          currentAccountPicture: CircleAvatar(
            backgroundColor: Colors.white,
            child: const Text('News'),
            foregroundColor: Colors.red[700],
            ),
            accountEmail: Text("${loggedInUser.email}"),
            ),
            DrawerListTile(
              iconData: Icons.person,
              title: 'About',
              onTilePressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => AboutScreen(),));
              },
            ),
            DrawerListTile(
              iconData: Icons.map,
              title: 'Maps',
              onTilePressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => MapScreen(),));
              },
            ),
            DrawerListTile(
              iconData: Icons.logout,
              title: "Logout",
              onTilePressed: (){
                _signOut().then((value)=> Navigator.of(context)
                      .pushReplacement(MaterialPageRoute(
                        builder: (context)=> LoginScreen())));
              },
            ),
      ],
      )
      );
  }
}

class DrawerListTile extends StatelessWidget{
  final IconData? iconData;
  final String? title;
  final VoidCallback? onTilePressed;

  const DrawerListTile({Key? key, this.iconData, this.title, this.onTilePressed})
  :super(key:key);
  @override 
  Widget build(BuildContext context){
    return ListTile(
      onTap: onTilePressed,
      dense: true,
      leading: Icon(iconData),
      title: Text(title!, style: TextStyle(fontSize: 16),),
    );
  }
}