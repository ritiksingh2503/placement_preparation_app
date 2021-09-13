import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:placement_preparation_app/pages/About.dart';
import 'package:placement_preparation_app/pages/HomePage.dart';
import 'package:placement_preparation_app/pages/MainPage.dart';
import 'package:placement_preparation_app/pages/Notes.dart';
import 'package:placement_preparation_app/pages/ToDoList.dart';
 
 void main(){
   runApp(MyApp());
 }
 class MyApp extends StatelessWidget {
   const MyApp({ Key? key }) : super(key: key);
 
   @override
   Widget build(BuildContext context) {
     return MaterialApp(
       routes: {
         '/':    (context) => MainPage(),
         'homepage': (context) => HomePage(),
         'todolist' : (context) => TodoList(),
         'notes' : (context) => Notes(),
         'about' : (context) =>About(),
          
       },
       title: "Placement Preparation App",
       debugShowCheckedModeBanner: false,
       theme: ThemeData(
         brightness: Brightness.light,
         textTheme: GoogleFonts.nunitoSansTextTheme(
            Theme.of(context).textTheme
         ),
        
         appBarTheme: AppBarTheme(
           brightness: Brightness.light,
           titleTextStyle: TextStyle(
             color: Colors.yellow,
           )
         )
       ),
       //home: MainPage(),
     );
   }
 }

 