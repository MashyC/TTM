import 'package:flutter/material.dart';
import 'package:flutter_login_demo/pages/due.dart';
import 'package:table_calendar/table_calendar.dart';


class Popup extends StatefulWidget{
  @override
  PopupState createState()=> PopupState();
  
  }
  
class PopupState extends State<Popup> {
   CalendarController _calendarController; 
   TextEditingController x = TextEditingController();
   List<Widget> _children = [];
   int _count = 0;
  @override
void initState() {
  super.initState();
  _calendarController = CalendarController();
}

@override
void dispose() {
  _calendarController.dispose();
  super.dispose();
}
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
            icon: Icon(Icons.add),
            iconSize: 30.0,
            color: Colors.white,
            onPressed: () {
              _add();
            },
          ),
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
            Container(
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                      padding: const EdgeInsets.fromLTRB(4, 0, 4, 0),
                      child: Text(
                        "Due Date",
                        style: TextStyle(
                          color: Colors.grey[600], 
                          fontSize: 15.0,
                        ),
                      ),
                    ),
                IconButton(
                        icon: Icon(
                          Icons.calendar_today,
                          color: Colors.blue,
                          size: 15.0,
                        ),
                        tooltip: "Set the project's due date.",
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Due()),
                          );
                        },
                      ),
                ],
              ),
            ),
            SizedBox(height: 15,),
            // Container(
            //   color: Colors.white,
            //   child: Padding(
            //     padding: const EdgeInsets.fromLTRB(4, 2, 4, 2),
            //     child: TextField(
            //       decoration: InputDecoration(
            //         hintText: 'Add Member',
            //         labelStyle: TextStyle(fontSize: 16),
            //         suffixIcon: IconButton(
            //           icon: Icon(Icons.add_circle),
            //           onPressed: () {
            //             _add();
            //           })),
            //     ),
            //   ),
            // ),
        ListView(
          shrinkWrap: true,
          children: _children,
          physics: ScrollPhysics(),
          
        ),
            // Container(
            //   child: ListView(children: _children),
            // )
    //         Container(
    //           color: Colors.white70,
    //           child:  TableCalendar(
    //   calendarController: _calendarController,
    // ),
    //     ),
              
           
          ],
          
        ),
         
      )  ,
         
    );
  }
  void _add() {
  _children = List.from(_children)
    ..add(Container(
      color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(4, 7, 4, 7),
            child: TextField(
            decoration: InputDecoration(
              hintText: 'Add Member',
              labelStyle: TextStyle(fontSize: 16),
              suffixIcon: IconButton(
                icon: Icon(Icons.cancel),
                onPressed: () {
                  _remove();
                  
                  print("AAAA");
                })),
          ),
          ),
    ));

  setState(() => ++_count);
}

void _remove(){
 // int index =  List.from(_chi)
    setState(() {
  _children = List.from(_children)..removeAt(_count-1);
  --_count;
    });
}

}
