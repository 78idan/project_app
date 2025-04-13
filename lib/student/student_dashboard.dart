import 'package:flutter/material.dart';
import 'package:project_app/student/student_home.dart';
import 'package:project_app/student/student_profile.dart';


void main(){
  runApp(
    student_dashboard1_1()
  );
}

class student_dashboard1_1 extends StatelessWidget{
  @override  
  Widget build(BuildContext context ){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: student_dashboard1_2(),
    );
  }
}


class student_dashboard1_2 extends StatefulWidget{
  @override  
  student_dashboard1_3 createState()=> student_dashboard1_3();
}



class student_dashboard1_3 extends State<student_dashboard1_2>{

  int indexSelected = 0;

  List pages = [
    student_home1_2(),
    student_profile1_2()
  ];

  @override  
  Widget build(BuildContext context ){
    return Scaffold(
      backgroundColor: Color(0xFF002147),
      body: Stack(
        children: [
          SafeArea(
            child: pages[indexSelected],
          ),
          Positioned(
            bottom: 20,
            left: 15,
            right: 15,
            child: Container(
              height: 65,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 38, 82, 117),
                borderRadius: BorderRadius.circular(10)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  selectedItems(Icons.home, 0),
                  selectedItems(Icons.settings, 1)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }


  Widget selectedItems(IconData icon, int index){
    bool SelectedIs = indexSelected == index;

    return GestureDetector(
      onTap: (){
        setState(() {
          indexSelected = index;
        });
      },
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: SelectedIs ? Color(0xFF2E7A88).withOpacity(0.8) : Colors.transparent
        ),
        child: Icon(
          icon,
          color: SelectedIs ? const Color(0xFFB4C7D4) : Colors.grey,
          size: 24,
        ),
      ),
    );

  }
}



