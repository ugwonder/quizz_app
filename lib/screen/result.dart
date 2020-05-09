import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quizzapp/components/cutom_button.dart';

class Result extends StatefulWidget {
  int marks;

  Result({Key key, @required this.marks}) : super(key: key);
  @override
  _ResultState createState() => _ResultState(marks);
}

class _ResultState  extends State<Result>{
  String message;

  @override
  void initState() {
    int score = marks * 4;
    debugPrint("marks $marks");
    if (score == 0) {
      message = " Lets laugh together" + "you scored $score";
    } else if (score > 20 ){
      message = "Oga abeg try again..\n" + "you scored $score";
    } else if (score > 25) {
      message = "Bad Guyyy... \n" + "you scored $score";
    } else {

    }
    super.initState();
  }

    int marks;
    _ResultState(this.marks);

    @override
    Widget build(BuildContext context) {
      ThemeData theme = Theme.of(context);
      Size screen = MediaQuery
          .of(context)
          .size;
      int marks;
      _ResultState(this.marks);
      int result = marks;
      return Scaffold(
        backgroundColor: theme.backgroundColor,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                width: screen.width - 40.0,
                padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(20.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.green,
                        offset: Offset(6.0, 12.0),
                        blurRadius: 6.0,
                      )
                    ]),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      height: screen.width / 3,
                      width: screen.width / 1.5,
                      child: Text(
                        "$message",
                        style: TextStyle(
                            fontSize: 30.0,
                            color: Colors.black
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacementNamed(context, 'start');
                      },
                      child: CustomButton(text: 'Play Again'),
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