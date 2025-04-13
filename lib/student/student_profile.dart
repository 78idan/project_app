import 'package:flutter/material.dart';


// void main(){
//   runApp(
//     student_profile1_1()
//   );
// }

// class student_profile1_1 extends StatelessWidget{
//   @override  
//   Widget build(BuildContext context ){
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: student_profile1_2(),
//     );
//   }
// }

class student_profile1_2 extends StatefulWidget{
  @override 
  student_profile1_3 createState()=> student_profile1_3();
}

class student_profile1_3 extends State<student_profile1_2>{
  @override  
  Widget build(BuildContext context){
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Color(0xFF002147),
      body: Padding(
        padding: EdgeInsets.fromLTRB(15, 25, 15, 0),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.17,
            ),
            profileStudentContainer1_1()
          ],
        ),
      ),
    );
  }

}


class profileStudentContainer1_1 extends StatefulWidget{
  @override  
  profileStudentContainer1_2 createState()=> profileStudentContainer1_2();
}


class profileStudentContainer1_2 extends State<profileStudentContainer1_1>{


  @override  
  Widget build(BuildContext context){
    return Container(
      height: MediaQuery.of(context).size.height * 0.6,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        // color: Colors.red,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 35,
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.person,
                  size: 45,
                ),
              )
            ],
          ),
          SizedBox(height: 5,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Isaack OLomi",
              style: TextStyle(
                fontFamily: "PlayfairDisplay",
                color: Colors.white70,
                fontSize: 19,
              ),
              )
            ],
          ),
          SizedBox(height: 25,),

          GestureDetector(
            onTap: (){
              print("Password change");
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white
                  ),
                  child: Icon(
                    Icons.edit,
                    size: 17,
                  ),
                ),
                SizedBox(width: 10,),
                GestureDetector(
                  onTap: (){
                  },
                  child: Text("Change Password",
                  style: TextStyle(
                    color: Colors.white70,
                    fontFamily: "PlayfairDisplay",
                    fontSize: 18
                  ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 20,),
          GestureDetector(
            onTap: (){
              print("logout");
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white
                  ),
                  child: Icon(
                    Icons.logout,
                    size: 17,
                  ),
                ),
                SizedBox(width: 10,),
                GestureDetector(
                  onTap: (){
                  },
                  child: Text("Log Out                 ",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 18,
                    fontFamily: "PlayfairDisplay"
                  ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}







