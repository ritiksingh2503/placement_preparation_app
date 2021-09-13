import 'package:flutter/material.dart';

class MainPageItem extends StatelessWidget {
  final String text;

  final String route;
  final Icon itemicon;
  MainPageItem(
      {required this.text, required this.itemicon, required this.route});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Material(
        animationDuration: Duration(seconds: 3),
        borderRadius: BorderRadius.circular(15),
        child: InkWell(
          splashColor: Colors.greenAccent,
          onTap: () {
            Navigator.pushNamed(context, "$route");
          },

          // onTap: (){
          //   Navigator.push(context, MaterialPageRoute(builder: (context) => "$route")
          // },
          child: Container(
            color: Colors.red,
            child: Stack(
              children: [
                // Container(
                //   child: Icon( ),
                // ),
                Container(
                  decoration: BoxDecoration(
                    
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "$text",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                  ),
                ),

                //   Container(
                //   decoration: BoxDecoration(
                //       image: DecorationImage(image:  AssetImage("$imagelocation"))),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
