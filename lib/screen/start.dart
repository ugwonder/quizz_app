import 'dart:collection';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:quizzapp/components/cutom_button.dart';

class Start extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    Size screen = MediaQuery
        .of(context)
        .size;
          return Scaffold(
            backgroundColor: theme.backgroundColor,
            body: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(bottom: 30.0),
                    height: screen.width / 3,
                    width: screen.width / 3,
                  ),
                  Center(
                    child: GestureDetector(
                        onTap: () {
                            Navigator.pushReplacementNamed(
                                context, 'quiz');
                        },
                        child: CustomButton(text: "Start Quiz"),
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}