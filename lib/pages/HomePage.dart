import 'package:flutter/material.dart';
import 'package:placement_preparation_app/Items/HomePageItem.dart';
import 'package:placement_preparation_app/pages/MyDrawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          drawer: MyDrawer(),
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: Text(
              
              "Placement Preparation App",
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.w900,
                fontFamily: "lato",
              ),
            ),
         
            //backgroundColor: Colors.black,
            elevation: 4.0,
            titleTextStyle: TextStyle(color: Colors.yellow),
          ),
          body: SafeArea(
            child: Center(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black
                         ),
                child: Column(
                  children: <Widget>[
                 
                    Expanded(
                      child: ListView(
                        padding: EdgeInsets.symmetric(),
                        children: [
                          HomePageItem(
                            subject: "Data Base Management System",
                            subject_desc: "This is Subject Description",
                          ),
                          HomePageItem(
                              subject: "Operating System",
                              subject_desc: "This is Subject Description"),
                          HomePageItem(
                              subject: "Data Structures and Algorithms",
                              subject_desc: "This is Subject Description"),
                          HomePageItem(
                              subject: "Computer Networks",
                              subject_desc: "This is Subject Description"),
                          HomePageItem(
                              subject: "Object Oriented Programming",
                              subject_desc: "This is Subject Description"),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
