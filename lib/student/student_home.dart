import 'package:flutter/material.dart';


// void main(){
//   runApp(
//     student_home1_1()
//   );
// }

// class student_home1_1 extends StatelessWidget{
//   @override  
//   Widget build(BuildContext context ){
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: student_home1_2(),
//     );
//   }
// }


class student_home1_2 extends StatefulWidget{
  @override  
  student_home1_3 createState()=> student_home1_3();

}



class student_home1_3 extends State<student_home1_2>{

  List<Widget> gridWidget (BuildContext context) {
    return [
      GestureDetector(
        onTap: (){
          print("Hello Module");
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
                Icons.book_sharp,
                size: 50,
                color: Colors.white,
              ),
              SizedBox(
                height: 10,
              ),
              Text("Module\nEnrolled",
              style: TextStyle(
                color: Colors.white,
                fontFamily: "PlayfairDisplay"
              ),
              )
            ],
          ),
        ),
      ),
      GestureDetector(
        onTap: (){
          print("Industrial Practical training");
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.yellow
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.engineering,
                size: 50,
                color: Colors.white,
              ),
              Text("Industrial Training\n Section",
              style: TextStyle(
                color: Colors.white,
                fontFamily: "PlayfairDisplay"
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

    final widgetGrid = gridWidget(context);

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
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.person,
                    size: 40,
                  ),
                ),
                SizedBox(width: 10,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Isaack Bertam",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "PlayfairDisplay",
                      fontSize: 14
                    ),
                    ),
                    Text("Student",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "PlayfairDisplay",
                      fontSize: 15
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
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 1,
                ),
                itemCount: widgetGrid.length,
                itemBuilder: (BuildContext context, index){
                  return widgetGrid[index];
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}



