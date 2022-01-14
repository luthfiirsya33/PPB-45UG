import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_newsapp/LoginScreen.dart';
import 'package:flutter_newsapp/Model/articleModel.dart';
import 'package:flutter_newsapp/Service/apiService.dart';
import 'package:flutter_newsapp/Views/DrawerScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_newsapp/Model/UserModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_newsapp/Model/sourceModel.dart';
import 'package:flutter_newsapp/Component/customListTile.dart';


class HomeScreen extends StatefulWidget{
  const HomeScreen({Key? key}) : super(key: key);

 @override
  _HomeScreenState createState() => _HomeScreenState();
}
Future<void> _signOut() async{
   await FirebaseAuth.instance.signOut();
}

class _HomeScreenState extends State<HomeScreen> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();
  ApiService client = ApiService();

  @override 
  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;
    if (auth.currentUser != null){
      print(auth.currentUser!.email);
    }
    return Scaffold(
      appBar: AppBar(title: Text("UPI NewsApp"),
      backgroundColor: Colors.red[700],
      actions: <Widget>[
        Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(icon: Icon(Icons.share), onPressed: () {}),
                IconButton(icon: Icon(Icons.logout), onPressed: () {
                  _signOut().then((value)=> Navigator.of(context)
                      .pushReplacement(MaterialPageRoute(
                        builder: (context)=> LoginScreen())));
                }),
              ],
            ),
      ],
      ),
      drawer: DrawerScreen(),
      body: FutureBuilder(
        future: client.getArticle(),
        builder: (BuildContext context, AsyncSnapshot<List<ArticleModel>> snapshot) {
          if (snapshot.hasData) {
            List<ArticleModel>? articles = snapshot.data;
            return ListView.builder(
              itemCount: articles!.length,
              itemBuilder: (context, index) =>
                  customListTile(articles[index], context),
            );
    }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}


  