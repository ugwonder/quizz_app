
import 'dart:convert';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quizzapp/components/cutom_button.dart';
import 'package:quizzapp/screen/result.dart';




class Quiz extends StatelessWidget {
  List data;
  String assetToLoad;

  setAsset() {
    assetToLoad = "assests/quiz.json";
  }
  @override
  Widget build(BuildContext context) {
    setAsset();
    ThemeData theme = Theme.of(context);
    return FutureBuilder(
      future:
        DefaultAssetBundle.of(context).loadString('assests/quiz.json'),
    builder: (context, snapshot) {
      List myData = jsonDecode(snapshot.data.toString());

      if(myData == null) {
        debugPrint('file didnt load');
      return Scaffold(
        backgroundColor: theme.backgroundColor,
        body:Center(
          child: CircularProgressIndicator(
            valueColor: new AlwaysStoppedAnimation<Color>(
              theme.primaryColor,
            ),
          ),
        ),
      );
      } else {
        debugPrint('file loaded');
        return new QuizPage(myData: myData);
      }
      },
  );
  }
}



class QuizPage extends StatefulWidget {
  var myData;

  QuizPage({Key key, @required this.myData }) : super(key: key);

  _QuizPageState createState() => _QuizPageState(myData);
}



class _QuizPageState extends State<QuizPage> {
  var myData;



  _QuizPageState(this.myData);

  Color colorToShow = Colors.indigoAccent;
  Color right = Colors.green;
  Color wrong = Colors.red;
  int marks = 0;
  int i = 1;

  int j = 1;

  var random_array;

  Map<String, Color> btnColor = {
    "a": Colors.indigoAccent,
    "b": Colors.indigoAccent,
    "c": Colors.indigoAccent,
    "d": Colors.indigoAccent,
  };





  @override
  void initState() {

    super.initState();
  }

  @override
  void setState( fn) {
    if(mounted) {
      super.setState(fn);
    }
  }

  void nextQuestion() {
    setState(() {
      if (j < 9) {
        i = j;
        j++;

      } else {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => Result(marks: marks),
        ));

      }
      btnColor["a"] = Colors.indigoAccent;
      btnColor["b"] = Colors.indigoAccent;
      btnColor["c"] = Colors.indigoAccent;
      btnColor["d"] = Colors.indigoAccent;
    });
  }

  void checkAnswer(String k) {
    String correctAnswer = myData[2][i.toString()];
    String options = myData[1][i.toString()][k];

    if (correctAnswer == options) {
      marks = marks + 4;
      colorToShow = right;
    } else {
      colorToShow = wrong;
    }
    setState(() {
      btnColor[k] =colorToShow;
    });
  }

  Widget choiceButton(String k) {

    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 20.0,
      ),
      child: MaterialButton(
        onPressed: () => checkAnswer(k),
        child: Text(
          myData[1][i.toString()][k],
          style: TextStyle(
            color: Colors.white,
            fontFamily: "Alike",
            fontSize: 16.0,
          ),
          maxLines: 1,
        ),
        color: btnColor[k],
        splashColor: Colors.indigo[700],
        highlightColor: Colors.indigo[700],
        minWidth: 200.0,
        height: 45.0,
        shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);

    ThemeData theme = Theme.of(context);
    return WillPopScope (
      onWillPop: () {
        return showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text(
                "Complete the quizz",
              ),
              content: Text("You Can't Go Back At This Stage."),
              actions: <Widget>[
                FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'Ok',
                  ),
                )
              ],
            ));
      },

      child: new  Scaffold(
        backgroundColor: theme.backgroundColor,
        body: Card (
          child: new Padding(
            padding: const EdgeInsets.only(
              left: 20.0,
              right: 20.0,
              bottom: 20.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacementNamed(context, 'start');
                        },
                        child: Icon(
                          Icons.close,
                          color: Colors.white,
                          size: 32.0,
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      'Question $j',
                      style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      '/8',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.grey[300],
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.all(25.0),
                  margin: const EdgeInsets.symmetric(vertical: 30.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Text(
                    myData[0][i.toString() ],
                    textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 22.0,
                        color: Colors.white,
                      ),
                  ),
                ),
                Expanded(
                  flex: 6,
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        choiceButton('a'),
                        choiceButton('b'),
                        choiceButton('c'),
                        choiceButton('d'),
                      ],
                    ),
                  ),
                ),
                new Container(
                  padding: const EdgeInsets.all(0.0),
                  child: RaisedButton(
                    onPressed: () {
                      nextQuestion();
                    },
                      child: CustomButton(text:'Next'),
                  ),
                )
            ],
            ),
          ),
        ),
    ),
    );
  }
}



