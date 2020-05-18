import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_login_demo/models/todo.dart';
import 'package:flutter_login_demo/pages/home_page.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_login_demo/services/authentication.dart';
import 'package:intl/intl.dart';

import 'login_signup_page.dart';

var today = DateTime.now();

  var months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];

class Project extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Route"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text(
            months[today.month-1]+" "+(today.day).toString(),
            textAlign: TextAlign.center, 
            style: TextStyle(
              color: Colors.grey,
              fontSize: 32.0,
            ),
          ),
          Center(
            child: RaisedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Go back!'),
            ),
          ),
        ],
      ),
    );
  }
}