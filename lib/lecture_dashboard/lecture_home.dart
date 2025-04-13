import 'package:flutter/material.dart';
import 'package:project_app/lecture_dashboard/lecture_module/lecture_module.dart';


// void main(){
//   runApp(
//     lecture_home1_1()
//   );
// }

// class lecture_home1_1 extends StatelessWidget{
//   @override  
//   Widget build(BuildContext context ){
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: lecture_home1_2(),
//     );
//   }
// }


class lecture_home1_2 extends StatefulWidget{
  @override  
  lecture_home1_3 createState()=> lecture_home1_3();
}


class lecture_home1_3 extends State<lecture_home1_2>{

  String lecture_admissionNumber = "22050513037";

  List<Widget> gridContainers(BuildContext context){
    return [
      GestureDetector(
        onTap: (){
          // print("Modules enrolled");
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => lecture_module1_2(),
            )
          );
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Color(0xFF48C9B0)
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.book,
                size: 50,
                color: Colors.white,
              ),
              SizedBox(height: 10,),
              Text("Modules \n Enrolled",
              style: TextStyle(
                color: Colors.white,
                fontFamily: "PlayfairDisplay",
                fontSize: 16,
              ),
              )
            ],
          ),
        ),
      ),
      GestureDetector(
        onTap: (){
          print("Industrial section");
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Color(0xFFF7DC6F)
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.engineering,
                size: 50,
                color: Colors.white,
              ),
              SizedBox(height: 10,),
              Text("Industrial \n Section",
              style: TextStyle(
                color: Colors.white,
                fontFamily: "PlayfairDisplay",
                fontSize: 16,
              ),
              )
            ],
          ),
        ),
      )      
    ];
  }

  @override  
  Widget build(BuildContext context){

    final containersGrid = gridContainers(context);

    return Scaffold(
      backgroundColor: Color(0xFF002147),
      body: Stack(
        children: [
          Positioned(
            left: 14,
            top: 45,
            child: Row(
              children: [
                CircleAvatar(
                  radius: 28,
                  child: Icon(
                    Icons.person,
                    size: 40,
                  ),
                ),
                SizedBox(width: 10,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("James Mariki",
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: "PlayfairDisplay",
                      color: Colors.white
                    ),
                    ),
                    Text("Lecture",
                    style: TextStyle(
                      fontFamily: "PlayfairDisplay",
                      fontSize: 15,
                      color: Colors.white
                    ),
                    )
                  ],
                )
              ],
            ),
          ),

          Positioned(
            top: 120,
            right: 16,
            left: 16,
            
            child: Container(
              height: 300,
              child: GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 1
                ),
                itemCount: containersGrid.length,
                itemBuilder: (BuildContext context,index){
                  return containersGrid[index];
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}







