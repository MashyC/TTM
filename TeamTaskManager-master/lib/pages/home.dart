import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_login_demo/models/todo.dart';
import 'package:flutter_login_demo/pages/home_page.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_login_demo/services/authentication.dart';
import 'package:intl/intl.dart';


import 'login_signup_page.dart';

class Home extends StatefulWidget {
    Home({Key key, this.auth, this.userId, this.logoutCallback})
      : super(key: key);
  final BaseAuth auth;
  final VoidCallback logoutCallback;
  final String userId;
  @override
  _HomeState createState() => _HomeState();
}


class _HomeState extends State<Home> {
  List<Todo> _todoList;

  final FirebaseDatabase _database = FirebaseDatabase.instance;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final _textEditingController = TextEditingController();
  StreamSubscription<Event> _onTodoAddedSubscription;
  StreamSubscription<Event> _onTodoChangedSubscription;

  var months = [];

  Query _todoQuery;
@override
  void initState() {
    super.initState();

    //_checkEmailVerification();

    _todoList = new List();
    _todoQuery = _database
        .reference()
        .child("todo")
        .orderByChild("userId")
        .equalTo(widget.userId);
    _onTodoAddedSubscription = _todoQuery.onChildAdded.listen(onEntryAdded);
    _onTodoChangedSubscription =
        _todoQuery.onChildChanged.listen(onEntryChanged);
  }
  signOut() async {
    try {
      await widget.auth.signOut();
      widget.logoutCallback();
    } catch (e) {
      print(e);
    }
  }
   onEntryChanged(Event event) {
    var oldEntry = _todoList.singleWhere((entry) {
      return entry.key == event.snapshot.key;
    });

    setState(() {
      _todoList[_todoList.indexOf(oldEntry)] =
          Todo.fromSnapshot(event.snapshot);
    });
  }

  onEntryAdded(Event event) {
    setState(() {
      _todoList.add(Todo.fromSnapshot(event.snapshot));
    });
  }
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      color: Colors.yellow,
      home: DefaultTabController(
        length: 4,
        child: new Scaffold(
          appBar: AppBar(
            title: Text(
              'TeamTaskManager',
              style: TextStyle(
                fontWeight: FontWeight.bold
              ),
            ),
             actions: <Widget>[
          IconButton(
            icon: Icon(Icons.exit_to_app),
            iconSize: 30.0,
            color: Colors.white,
           onPressed: signOut //{
           //   Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) //=> Texting()));
          //  },
          ),
        ],
            backgroundColor: Colors.redAccent,
            automaticallyImplyLeading: false,
          ),
          body: TabBarView(
            children: [
              new Container(
                color: Colors.redAccent[100],
                child: HomePage(
                  // userId: _userId,
                  // auth: widget.auth,
                  // logoutCallback: logoutCallback,
                ),
              ),
              Container(
                color: Colors.red[900],
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        'Friends: ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white
                        ),
                      ),
                    ),
                   //insert page
                  ],
                ),
              ),
              new Container(
                color: Colors.lightGreen,
                  child: LoginSignupPage(),
              ),
              new Container(
                color: Colors.red,
              ),
            ],
          ),
          bottomNavigationBar: new TabBar(
          tabs: [
            Tab(
              icon: new Icon(Icons.home),
            ),
            Tab(
              icon: new Icon(Icons.chat_bubble),
            ),
            Tab(
              icon: new Icon(Icons.person),
            ),
            Tab(icon: new Icon(Icons.settings),)
          ],
          labelColor: Colors.redAccent,
          unselectedLabelColor: Colors.black,
          indicatorSize: TabBarIndicatorSize.label,
          indicatorPadding: EdgeInsets.all(5.0),
          indicatorColor: Colors.redAccent,
          ),
          backgroundColor: Colors.white,
        ), 
      ),
    );
  }
}
