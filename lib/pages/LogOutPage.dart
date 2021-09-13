import 'package:flutter/material.dart';

class LogOutPage extends StatelessWidget {
  const LogOutPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child:  Container(
                   height: 200,
                    width: 299,
                   
                   
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.blueGrey,
                      image:DecorationImage(
                         
                        image: AssetImage("assets/images/hottea.jpg"),
                      ) 
                    ),
              
                 ),
    );
  }
}