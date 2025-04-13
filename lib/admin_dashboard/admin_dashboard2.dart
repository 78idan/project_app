import 'package:flutter/material.dart';
import 'package:project_app/admin_dashboard/admin_home.dart';
import 'package:project_app/admin_dashboard/admin_profile.dart';



// void main(){
//   runApp(
//     admin_dashboard1_1()
//   );
// }

// class admin_dashboard1_1 extends StatelessWidget{
//   @override  
//   Widget build(BuildContext context ){
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: admin_dashboard1_2(),
//     );
//   }
// }


class admin_dashboard1_2 extends StatefulWidget{
  final String IpAddress;
  final String admission_number;

  admin_dashboard1_2({ required this.IpAddress, required this.admission_number  });

  @override  
  admin_dashboard1_3 createState()=> admin_dashboard1_3();
}


class admin_dashboard1_3 extends State<admin_dashboard1_2>{
  int idSelected = 0;
  late String IpAddress;
  late String admission_number;
  @override  
   void initState(){
    super.initState();
    IpAddress = widget.IpAddress;
    admission_number = widget.admission_number;
   }



  @override  
  Widget build(BuildContext context){

  List<Widget> pages = [
    admmin_home1_2(IpAddress: IpAddress,admission_number: admission_number ,),
    admin_profile1_2(IpAddress: IpAddress,admission_number: admission_number,),
  ];    

    return Scaffold(
      backgroundColor: Color(0xFF002147),
      body: Stack(
        children: [
          SafeArea(
            child: pages[idSelected],
          ),
          Positioned(
            left: 15,
            right: 15,
            bottom: 20,
            child: Container(
              height: 65,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color.fromARGB(255, 38, 82, 117)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  itemTapped(Icons.home, 0),
                  itemTapped(Icons.settings, 1)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
  

  Widget itemTapped(IconData icons,int index){
    bool selectedId = idSelected == index;
    return GestureDetector(
      onTap: (){
        setState((){
          idSelected = index;
        });
      },
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: selectedId ? Color(0xFF2E7A88).withOpacity(0.8) : Colors.transparent
        ),
        child: Icon(
          icons,
          color: selectedId ? const Color(0xFFB4C7D4): Colors.grey,
          size: 24,
        ),
      ),
    );
  }

}


