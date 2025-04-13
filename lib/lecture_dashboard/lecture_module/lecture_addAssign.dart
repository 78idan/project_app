import 'package:flutter/material.dart';
// import 'package:dio/dio.dart';



// void main(){
//   runApp(
//     lecture_addAssign1_1()
//   );
// }

// class lecture_addAssign1_1 extends StatelessWidget{
//   @override  
//   Widget build(BuildContext context ){
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: lecture_addAssign1_2(),
//     );
//   }
// }



class lecture_addAssign1_2 extends StatefulWidget{
  @override  
  lecture_addAssign1_3 createState()=> lecture_addAssign1_3();
}


class lecture_addAssign1_3 extends State<lecture_addAssign1_2>{
  @override  
  Widget build(BuildContext context ){
    return Scaffold(
      backgroundColor: Color(0xFF002147),
      appBar: lecture_addAssignAppBar(context),
      body: Padding(
        padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              lecture_addAssignTextField1_1()
            ],
          ),
        ),
      ),
    );
  }
}

PreferredSizeWidget lecture_addAssignAppBar(BuildContext context){
  return AppBar(
    elevation: 0,
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


class lecture_addAssignTextField1_1 extends StatefulWidget{
  lecture_addAssignTextField1_1();  
  @override  
  lecture_addAssignTextField1_2 createState()=> lecture_addAssignTextField1_2();
}

class lecture_addAssignTextField1_2 extends State<lecture_addAssignTextField1_1>{
  // String? regionValue;
  // String? courseValue;
  // String? levelValue;
  // List<String> regionList = ['Arusha',"Manyara","Kigoma","Dar Es Salaam","Singida","Dododma"];
  // List<String> courseList = ["Computer Science","Information Technology"];
  // List<String> levelList = ["Level 4","Level 5","Level 6","Level 7-1","Level 7-2","Level 8"];
  final keyAssignQuestion = GlobalKey<FormState>();
  TextEditingController descriptionQuestion = TextEditingController();
  TextEditingController questionNum = TextEditingController();

//start of validation function
Future<void> validatelecture_addCourse() async {
  if(descriptionQuestion.text.isEmpty){
     customNotification.notificationCustom(context, message: "Description Question empty");
  }else if(questionNum.text.isEmpty){
     customNotification.notificationCustom(context, message: "Question number empty");
  }else {
    print("Hello");
  }
} 
//end of validation function




  @override  
  Widget build(BuildContext context ){
    return Container(
      // height: MediaQuery.of(context).size.height * 0.9,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        // color: Colors.red
      ),
      child: Column(
        children: [
          SizedBox(
            // height: MediaQuery.of(context).size.height * 0.05,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 35,
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.add,
                  size: 45,
                ),
              )
            ],
          ),
          SizedBox(height: 15,),
          Form(
            key: keyAssignQuestion,
            child: Column(
              children: [                                                                                           
                SizedBox(height: 10,),
                ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: 100,
                    maxHeight: 100
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: descriptionQuestion,
                          maxLines: null,
                          expands: true,
                          keyboardType: TextInputType.multiline,
                          textAlignVertical: TextAlignVertical.top,
                          style: TextStyle(
                            color: Colors.white 
                          ),
                          decoration: InputDecoration(
                            hintText: "Description of Question",
                            hintStyle: TextStyle(
                              color: Colors.white70
                            ),
                            fillColor: Color(0xFF1A3A6F),
                            filled: true,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none
                            ),
                            prefixIcon: Icon(
                              Icons.description_outlined,
                              color: Colors.grey[400],
                            )
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10,),
                TextFormField(
                  controller: questionNum,
                  style: TextStyle(
                    color: Colors.white
                  ),
                  decoration: InputDecoration(
                    hintText: "@ eg Question 1 ",
                    hintStyle: TextStyle(
                      color: Colors.white70
                    ),
                    fillColor: Color(0xFF1A3A6F),
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none
                    ),
                    prefixIcon: Icon(
                      Icons.notes,
                      color: Colors.grey[400],
                    )
                  ),
                ),                                 
                SizedBox(height: 15,),                              
                Row(
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: MaterialButton(
                          onPressed: (){
                            validatelecture_addCourse();
                          },
                          textColor: Colors.white,
                          color: Color(0xFF5DADE2),
                          height: 50,
                          child: Text("Post"),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 140,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}




class customNotification{
  static notificationCustom(
    BuildContext context,
    {
      required message,
      Color? containerColor,
      Icon? picIcon,
      Duration timeDuration = const Duration(seconds: 2)
    }
  ){

    containerColor ??= Colors.green;
    picIcon ??= Icon(
      Icons.warning,
      color: Colors.white,
      size: 14,
    );

    OverlayEntry layEntry = OverlayEntry(
      builder: (context)=>Positioned(
        top: 40,
        left: 16,
        right: 16,
        child: Center(
          child: Material(
            color: Colors.transparent,
            child: Container(
              decoration: BoxDecoration(
                color: containerColor,
                borderRadius: BorderRadius.circular(5),
              ),
              padding: EdgeInsets.symmetric(horizontal: 10,vertical: 11),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  picIcon!,
                  SizedBox(width: 4,),
                  Text(message,
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: "PlayfairDisplay",
                    fontSize: 14
                  ),
                  )
                ],
              ),
            ),
          ),
        ),
      )
    );

    Overlay.of(context).insert(layEntry);

    Future.delayed(timeDuration,(){
      layEntry.remove();
    });

  }
}




