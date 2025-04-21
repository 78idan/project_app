import 'package:flutter/material.dart';
import 'package:project_app/lecture_dashboard/lecture_home.dart';
import 'package:project_app/lecture_dashboard/lecture_profile.dart';


// void main(){
//   runApp(
//     lecture_dashboard2_1()
//   );
// }

// class lecture_dashboard2_1 extends StatelessWidget{
//   @override  
//   Widget build(BuildContext context ){
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: lecture_dashboard2_2(),
//     );
//   }
// }


class lecture_dashboard2_2 extends StatefulWidget{
  final String admission_number;
  final String IpAddress;
  lecture_dashboard2_2({ required this.admission_number, required this.IpAddress });
  @override  
  lecture_dashboard2_3 createState()=> lecture_dashboard2_3();
}

class lecture_dashboard2_3 extends State<lecture_dashboard2_2>{

  int selectedIndex = 0;



  @override  
  Widget build(BuildContext context ){
  List<Widget> lecturePages = [
    lecture_home1_2(admission_number: widget.admission_number,  IpAddress: widget.IpAddress,),
    lecture_profile1_2(admission_number: widget.admission_number, IpAddress: widget.IpAddress)
  ];    
    return Scaffold(
      backgroundColor: Color(0xFF002147),
      body: Stack(
        children: [
          SafeArea(
            child: lecturePages[selectedIndex],
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
                  itemSelected(Icons.home, 0),
                  itemSelected(Icons.settings, 1)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget itemSelected(IconData icon, int index){
    bool isSelected = selectedIndex == index;

    return GestureDetector(
      onTap: (){
        setState(() {
          selectedIndex = index;
        });
      },
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: isSelected? Color(0xFF2E7A88).withOpacity(0.8) : Colors.transparent,
        ),
        child: Icon(
          icon,
          color: isSelected? const Color(0xFFB4C7D4): Colors.grey, 
          size: 24,
        ),
      ),
    );

  }

}


