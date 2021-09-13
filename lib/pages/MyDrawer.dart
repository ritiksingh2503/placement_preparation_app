import 'package:flutter/material.dart';
import 'package:placement_preparation_app/pages/About.dart';
import 'package:placement_preparation_app/pages/LogOutPage.dart';
import 'package:placement_preparation_app/pages/Notes.dart';
import 'package:placement_preparation_app/pages/ToDoList.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);
  Widget _createHeader() {
    return DrawerHeader(
        margin: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(
            image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage('assets/images/drawerheader.jpg'),
        )),
        child: Stack(children: <Widget>[
          Positioned(
              bottom: 12.0,
              left: 16.0,
              child: Text("PLACEMENT PREP",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500))),
        ]));
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.black,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _createHeader(),
            Divider(),
              SizedBox(
                width: double.infinity,
                child: Container(
                  color: Colors.blueGrey,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TodoList()));
                      },
                      style: ElevatedButton.styleFrom(
                          primary: Colors.blueGrey,
                          textStyle: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold)),
                      child: ListTile(
                        leading: Icon(Icons.checklist),
                        title: Text("To Do List"),
                      )),
                ),
              ),
         
              SizedBox(
                width: double.infinity,
                child: Container(
                  color: Colors.blueGrey,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Notes()));
                      },
                      style: ElevatedButton.styleFrom(
                          primary: Colors.blueGrey,
                          textStyle: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold)),
                      child: ListTile(
                        leading: Icon(Icons.notes),
                        title: Text("Notes"),
                      )),
                ),
              ),
             
              SizedBox(
                width: double.infinity,
                child: Container(
                  color: Colors.blueGrey,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => About()));
                      },
                      style: ElevatedButton.styleFrom(
                          primary: Colors.blueGrey,
                          textStyle: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold)),
                      child: ListTile(
                        leading: Icon(Icons.details),
                        title: Text("About"),
                      )),
                ),
              ),
               
              SizedBox(
                width: double.infinity,
                child: Container(
                  color: Colors.blueGrey,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LogOutPage()));
                      },
                      style: ElevatedButton.styleFrom(
                          primary: Colors.blueGrey,
                          textStyle: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold)),
                      child: ListTile(
                        leading: Icon(Icons.logout_outlined),
                        title: Text("LOG OUT"),
                      )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
