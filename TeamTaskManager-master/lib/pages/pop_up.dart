import 'package:flutter/material.dart';

class Popup extends StatefulWidget{
  @override
  PopupState createState()=> PopupState();
  
  }
  
class PopupState extends State<Popup> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text(
          'Create Project',
          style: TextStyle(
            fontSize: 20.0,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.check_circle),
            iconSize: 30.0,
            color: Colors.white,
            onPressed: () {},
          ),
        ],
      ),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
          children: <Widget>[
            Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(4, 2, 4, 2),
                child: TextField(
                decoration: InputDecoration(
                  labelText: 'Project Name',
                  labelStyle: TextStyle(fontSize: 20),
                )
            ),
            
              ),
            ),
          ],
        ),
      )      
      );
  }
}