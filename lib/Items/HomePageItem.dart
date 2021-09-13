import 'package:flutter/material.dart';
import 'package:placement_preparation_app/pages/YouTube.dart';

class HomePageItem extends StatelessWidget {
  
  final String subject;
  // ignore: non_constant_identifier_names
  final String subject_desc;
  const HomePageItem({
    Key? key,
    required this.subject,
    // ignore: non_constant_identifier_names
    required this.subject_desc,
     
  }) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    return ListTile(
      hoverColor: Colors.grey,
      leading: Icon(Icons.subject_outlined),
      title: Text("$subject"),
      subtitle: Text("$subject_desc"),
      trailing: ElevatedButton(onPressed: (){
        Navigator.push((context), MaterialPageRoute(builder: (context) => Youtube(url : "https://www.youtube.com/watch?v=bkSWJJZNgf8&list=PLxCzCOWd7aiGz9donHRrE9I3Mwn6XdP8p", title: '$subject',)));
      }, child: Text("Watch Videos")),
    );
  }
}
