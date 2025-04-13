import 'package:flutter/material.dart';



void main(){
  runApp(
    student_module1_1()
  );
}

class student_module1_1 extends StatelessWidget{
  @override  
  Widget build(BuildContext context ){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: student_module1_2(),
    );
  }
}



class student_module1_2 extends StatefulWidget{
  @override  
  student_module1_3 createState()=> student_module1_3();
}


class student_module1_3 extends State<student_module1_2>{
  @override  
  Widget build(BuildContext context ){
    return Scaffold(
      backgroundColor: Color(0xFF002147),
      appBar: studentModuleAppBar(context),
      body: Padding(
        padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: studentModuleContainer1_1()
        ),
      ),
    );
  }
}

PreferredSizeWidget studentModuleAppBar( BuildContext context ){
  return AppBar(
    backgroundColor: Color(0xFF002147),
    leading: IconButton(
      onPressed: (){
        Navigator.of(context).pop();
      },
      icon: Icon(
        Icons.arrow_back
      ),
    ),
  );
}



class studentModuleContainer1_1 extends StatefulWidget{
  @override  
  studentModuleContainer1_2 createState()=> studentModuleContainer1_2();
}

class studentModuleContainer1_2 extends State<studentModuleContainer1_1>{
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
              child: Container(
                height: 120,
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
                        Text("CRYPTOGRAPHY AND CODE THEORY",
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
                        Container(
                          width: 60,
                          child: Text("Lecture",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "PlayfairDisplay",
                            fontSize: 16
                          ),
                          overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        Container(
                          width: 120,
                          child: Text("Mr Mwasaga",
                          style: TextStyle(
                            fontFamily: "PlayfairDisplay",
                            fontSize: 16,
                            color: Colors.white
                          ),
                          overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Flexible(
                          child: SizedBox(
                            width: double.infinity
                          ),
                        ),
                        GestureDetector(
                          onTap: (){
                            print("Let us go");
                          },
                          child: Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white,
                            size: 15,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 15,),
        Row(
          children: [
            Expanded(
              child: Container(
                height: 120,
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
                        Text("CRYPTOGRAPHY AND CODE THEORY",
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
                        Container(
                          width: 60,
                          child: Text("Lecture",
                          style: TextStyle(
                            fontFamily: "PlayfairDisplay",
                            fontSize: 16,
                            color: Colors.white
                          ),
                          overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        Container(
                          width: 120,
                          child: Text("Mr Nkata",
                          style: TextStyle(
                            fontFamily: "PlayfairDisplay",
                            fontSize: 16,
                            color: Colors.white
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          ),
                        ),
                        Flexible(
                          child: SizedBox(
                            width: double.infinity
                          ),
                        ),
                        GestureDetector(
                          onTap: (){
                            print("Let us go");
                          },
                          child: Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white,
                            size: 15,
                          ),
                        )
                      ],
                    ),
                  ],
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




