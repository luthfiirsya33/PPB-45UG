import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// class MyApp extends StatelessWidget {
//   @override
//   var questionsIndex = 0;
//   void answerQuestion(){
//     questionsIndex = questionsIndex + 1;
//     print(questionsIndex);
// }
//   @override
//   Widget build(BuildContext context) {
//     var questions = ['What\'s your favorite color?',
//     'What\'s your favorite animal?',
//     'What\'s your favorite fruit?',
//     'What\'s your favorite drink?'
//     'What\'s your favorite car?',];
//     return MaterialApp(home: Scaffold(
//       appBar: AppBar(
//         title: Text('Stateless VS Stateful'),
//         ),
//       body: Column(
//         children: <Widget> [
//           SizedBox(height:20),
//           Text(questions[questionsIndex]),
//           SizedBox(height:20),
//           RaisedButton(
//             child: Text("A"), 
//             onPressed: answerQuestion,),
//           RaisedButton(
//             child: Text("B"), 
//             onPressed:answerQuestion,),
//           RaisedButton(
//             child: Text("C"), 
//             onPressed: answerQuestion,),
//         ],),
//     ),
//     );
//   }
// }

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}
class MyAppState extends State<MyApp>{
  var questionsIndex = 0;
  void answerQuestion(){
    setState(() {
      questionsIndex = questionsIndex + 1 ;
    });
  print(questionsIndex);
}
  @override
  Widget build(BuildContext context) {
    var questions = ['What\'s your favorite color?',
    'What\'s your favorite animal?',
    'What\'s your favorite fruit?',
    'What\'s your favorite drink?',
    'What\'s your favorite car?',];
    return MaterialApp(home: Scaffold(
      appBar: AppBar(
        title: Text('Stateless VS Stateful'),
        ),
      body: Column(
        children: <Widget> [
          SizedBox(height:20),
          Text(questions[questionsIndex]),
          SizedBox(height:20),
          RaisedButton(
            child: Text("A"), 
            onPressed: answerQuestion,),
          RaisedButton(
            child: Text("B"), 
            onPressed:answerQuestion,),
          RaisedButton(
            child: Text("C"), 
            onPressed: answerQuestion,),
        ],),
    ),
    );
    }
}