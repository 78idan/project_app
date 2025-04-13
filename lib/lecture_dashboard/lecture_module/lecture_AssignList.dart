import 'package:flutter/material.dart';
import 'package:project_app/lecture_dashboard/lecture_module/lecture_AssignView.dart';


// void main(){
//   runApp(
//     lecture_AssignList1_1()
//   );
// }

// class lecture_AssignList1_1 extends StatelessWidget{
//   @override  
//   Widget build(BuildContext context ){
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: lecture_AssignList1_2(),
//     );
//   }
// }



class lecture_AssignList1_2 extends StatefulWidget{
  @override  
  lecture_AssignList1_3 createState()=> lecture_AssignList1_3();
}


class lecture_AssignList1_3 extends State<lecture_AssignList1_2>{
  @override  
  Widget build(BuildContext context ){
    return Scaffold(
      backgroundColor: Color(0xFF002147),
      appBar: lectureAssignListAppBar(context),
      body: Padding(
        padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: lectureAssignListContainer1_1()
        ),
      ),
    );
  }
}

PreferredSizeWidget lectureAssignListAppBar(BuildContext context ){
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



class lectureAssignListContainer1_1 extends StatefulWidget{
  @override  
  lectureAssignListContainer1_2 createState()=> lectureAssignListContainer1_2();
}

class lectureAssignListContainer1_2 extends State<lectureAssignListContainer1_1>{
  @override  
  Widget build(BuildContext context ){
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.05,
        ),
        Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: (){
                  // print("Thank God");
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context)=> lecture_AssignView1_2()
                    )
                  );
                },
                child: Container(
                  height: 90,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black54.withOpacity(0.3),
                        offset: Offset(0, 5),
                        blurRadius: 7,
                        spreadRadius: 2
                      )
                    ],
                    color: Color(0xFF2E7A88).withOpacity(0.8),
                    borderRadius: BorderRadius.circular(15)
                  ),
                  padding: EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("22050513038",
                          style: TextStyle(
                            fontFamily: "PlayfairDisplay",
                            fontSize: 16,
                            color: Colors.white
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Text("LEVEL 8",
                          style: TextStyle(
                            fontFamily: "PlayfairDisplay",
                            fontSize: 16,
                            color: Colors.white
                          ),
                          ),
                          SizedBox(
                            width: 6,
                          ),
                          Text("18:06",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "PlayfairDisplay"
                          ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 15,),
        Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: (){
                  print("Thank You God");
                },
                child: Container(
                  height: 90,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black54.withOpacity(0.3),
                        offset: Offset(0, 5),
                        blurRadius: 7,
                        spreadRadius: 2
                      )
                    ],
                    color: Color(0xFF2E7A88).withOpacity(0.8),
                    borderRadius: BorderRadius.circular(15)
                  ),
                  padding: EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("22050513037",
                          style: TextStyle(
                            fontFamily: "PlayfairDisplay",
                            fontSize: 16,
                            color: Colors.white
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Text("LEVEL 8",
                          style: TextStyle(
                            fontFamily: "PlayfairDisplay",
                            fontSize: 16,
                            color: Colors.white
                          ),
                          ),
                          SizedBox(
                            width: 6,
                          ),
                          Text("17:08",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "PlayfairDisplay"
                          ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 50,
        )
      ],
    );
  }
}




