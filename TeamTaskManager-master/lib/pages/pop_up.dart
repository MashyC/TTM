import 'package:flutter/material.dart';
import 'package:flutter_login_demo/pages/home_page.dart';

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
            onPressed: () {
            },
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
                  ),
                ),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(4, 20, 4, 20),
                    child: Text(
                      "Due Date",
                      style: TextStyle(
                        color: Colors.grey[600], 
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
                Container(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 9, 240, 8),
                    child: IconButton(
                      icon: Icon(
                        Icons.calendar_view_day,
                        color: Colors.blue,
                        size: 30.0,
                      ),
                      tooltip: "Set the project's due date.",
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomePage()),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      )      
    );
  }
}