import 'package:flutter/material.dart';
import 'package:placement_preparation_app/pages/MyDrawer.dart';

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "ABOUT",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        drawer: MyDrawer(),
        body: SafeArea(
          child: Center(child: Text("Some info about the project")),
        ),
      ),
    );
  }
}
