import 'package:flutter/material.dart';
import 'package:placement_preparation_app/Items/mainpageitem.dart';
import 'package:placement_preparation_app/pages/MyDrawer.dart';

class MainPage extends StatelessWidget {
  const MainPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Placement Preparation",
        style: TextStyle(
          color: Colors.red,
          fontWeight: FontWeight.bold,
        ),),
      ),
      body: Container(
        color: Colors.black,
         padding: EdgeInsets.only(left: 15,top: 40, right: 15),
      margin: EdgeInsets.symmetric(),
      child: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
      
      children: [
        MainPageItem(text: "SUBJECTS",  itemicon: Icon(Icons.subject), route: "homepage"),
        MainPageItem(text: "NOTES", itemicon: Icon(Icons.notes), route: "notes"),
        MainPageItem(text: "TO DO LIST" ,itemicon: Icon(Icons.list), route: "todolist"),
        MainPageItem(text: "ABOUT" , itemicon: Icon(Icons.person),route: "about"),
         
       

      ],
      ),
      ),
     
    );
     
  }
}

















// class MainPage extends StatefulWidget {
//   const MainPage({Key? key}) : super(key: key);

//   @override
//   _MainPageState createState() => _MainPageState();
// }

// class _MainPageState extends State<MainPage> {
//   List info = [];

//   _initData() {
//     DefaultAssetBundle.of(context)
//         .loadString("assets/json/mainpageitem.json")
//         .then((value) {
//       info = json.decode(value);
//     });
//   }

//   @override
//   void initState() {
//     super.initState();
//     _initData();
//   }

//   Widget build(BuildContext context) {
//     return Scaffold(
//         drawer: MyDrawer(),
//         appBar: AppBar(
//           title: Text("Home"),
//         ),
//         body: Container(
//           decoration: BoxDecoration(
//             color: Colors.black,
//           ),
//           child: Column(
//             children: [
//               Container(
//                 child: Expanded(
//                   child: OverflowBox(
//                     maxWidth: (MediaQuery.of(context).size.width),
//                     child: ListView.builder(
//                         itemCount: (info.length.toDouble() / 2).toInt(),
//                         itemBuilder: (_, index) {
//                           int a = 2 * index;
//                           int b = 2 * index + 1;
//                           int c = b;
//                           if (info.length.isOdd && (index + 1) == info.length) {
//                             c = info.length;
//                             b = c;
//                           }
//                           return Row(
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             children: [
//                               Container(
//                                 height: 200,
//                                 width:(MediaQuery.of(context).size.width - 90) /
//                                         2,
//                                 // padding: EdgeInsets.only(bottom: 50),
//                                 margin: EdgeInsets.only(
//                                 left: 30, bottom: 15, top: 40),
//                                 decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(15),

//                                   color: Colors.white,
//                                   // image: DecorationImage(

//                                   //   image: AssetImage(info[a]["img"]),
//                                   // ),
//                                   boxShadow: [
//                                     BoxShadow(
//                                       color: Colors.blue.withOpacity(0.5),
//                                       spreadRadius: 5,
//                                       blurRadius: 7,
//                                       offset: Offset(
//                                           0, 3), // changes position of shadow
//                                     ),
//                                   ],
//                                 ),

//                                 child: Material(
//                                   borderRadius: BorderRadius.circular(15),
//                                   child: InkWell(
//                                     splashColor: Colors.orange,
//                                     onTap: () {
//                                       //  Navigator.push(context , MaterialPageRoute(builder: (context) => info[a]['route']));
//                                     },
//                                     child: Center(
//                                       child: Align(
//                                         alignment: Alignment.bottomCenter,
//                                         child: Text(
//                                           info[a]['subject'],
//                                           style: TextStyle(
//                                             fontSize: 20,
//                                             fontWeight: FontWeight.bold,
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ),
                             
//                                 Container(
//                                   height: 200,
//                                   width:
//                                       (MediaQuery.of(context).size.width - 90) /
//                                           2,
//                                   margin: EdgeInsets.only(
//                                       left: 30, bottom: 15, top: 40),
//                                   decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(15),

//                                     color: Colors.white,
//                                     // image: DecorationImage(
//                                     //   alignment: Alignment.topCenter,
//                                     //   image: AssetImage(info[b]["img"]),
//                                     // ),
//                                     boxShadow: [
//                                       BoxShadow(
//                                         color: Colors.blue.withOpacity(0.5),
//                                         spreadRadius: 5,
//                                         blurRadius: 7,
//                                         offset: Offset(
//                                             0, 3), // changes position of shadow
//                                       ),
//                                     ],
//                                   ),
//                                   child: Material(
//                                     borderRadius: BorderRadius.circular(15),
//                                     child: InkWell(
//                                       splashColor: Colors.green,
//                                       onTap: () {
//                                         // Navigator.push(context , MaterialPageRoute(builder: (context) => info[b]['route']));
//                                       },
//                                       child: Center(
//                                         child: Align(
//                                           alignment: Alignment.bottomCenter,
//                                           child: Text(
//                                             info[b]['subject'],
//                                             style: TextStyle(
//                                               color: Colors.black,
//                                               fontWeight: FontWeight.bold,
//                                               fontSize: 20,
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ) 
//                             ],
//                           );
//                         }),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ));
//   }
// }
