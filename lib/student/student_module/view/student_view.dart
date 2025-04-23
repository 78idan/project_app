// import 'dart:async';

import 'package:flutter/material.dart';
// import 'package:dio/dio.dart';
// import 'package:video_player/video_player.dart';



// void main(){
//   runApp(
//     student_viewContent1_1()
//   );
// }


// class student_viewContent1_1 extends StatelessWidget{

//   @override  
//   Widget build(BuildContext context){
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: student_viewVideo1_2(),
//     );
//   }
// }

class student_view1_2 extends StatefulWidget{
  final String video_content;
  student_view1_2({ required this.video_content });
  @override  
  student_view1_3 createState()=> student_view1_3();
}

class student_view1_3 extends State<student_view1_2>{
  @override  
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Color(0xFF002147),
      appBar: student_viewAppBar(context),
      body: Padding(
        padding: EdgeInsets.fromLTRB(10, 15, 10, 0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: student_viewContent1_1(video_content: widget.video_content)
        ),
      ),
    );
  }
}


PreferredSizeWidget student_viewAppBar(BuildContext context){
  return AppBar(
    backgroundColor: Color(0xFF002147),
    leading: IconButton(
      onPressed: (){
        Navigator.of(context).pop();
      },
      icon: Icon(
        Icons.arrow_back,
        color: Colors.white,
      ),
    ),
  );
}



class student_viewContent1_1 extends StatefulWidget{
  final String video_content;
  student_viewContent1_1({ required this.video_content });  
  @override  
  student_viewContent1_2 createState()=> student_viewContent1_2();
}


class student_viewContent1_2 extends State<student_viewContent1_1>{


  @override  
  Widget build(BuildContext context ){
    return Text(widget.video_content,
    style: TextStyle(
      color: Colors.white,
      fontFamily: "PlayfairDisplay"
    ),
    );
  }
}



