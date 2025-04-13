import 'package:flutter/material.dart';



// void main(){
//   runApp(
//     student_Assign1_1()
//   );
// }

// class student_Assign1_1 extends StatelessWidget{
//   @override  
//   Widget build(BuildContext context ){
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: student_Assign1_2(),
//     );
//   }
// }

class student_Assign1_2 extends StatefulWidget{
  @override  
  student_Assign1_3 createState()=> student_Assign1_3();
}


class student_Assign1_3 extends State<student_Assign1_2>{
  @override  
  Widget build(BuildContext context ){
    return Scaffold(
      backgroundColor: Color(0xFF002147),
      appBar: student_AssignAppBar(context),
      body: Padding(
        padding: EdgeInsets.fromLTRB(15, 20, 15, 0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              student_questionAnswer1_2()
            ],
          ),
        )
      ),
    );
  }
}


PreferredSizeWidget student_AssignAppBar( BuildContext context ){
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


class student_questionAnswer1_2 extends StatefulWidget{
  @override  
  student_questionAnswer1_3 createState()=> student_questionAnswer1_3();
}

class student_questionAnswer1_3 extends State<student_questionAnswer1_2>{
  GlobalKey questionKey = GlobalKey<FormState>();
  @override  
  Widget build(BuildContext context){
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      child: Text("If you were given unlimited resources and support to take your chip design company, Chang, from an idea to a fully operational tech giant competing with companies like NVIDIA and AMD, what specific steps would you take first? How would you handle challenges such as funding, talent acquisition, and competition in the global semiconductor industry",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: "PlayfairDisplay",
                        fontSize: 15
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Answer Below",
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 13,
                    fontFamily: "PlayfairDisplay"
                  ),
                  )
                ],
              ),
              SizedBox(height: 10,),
              Form(
                key: questionKey,
                child: Column(
                  children: [
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxHeight: 300,
                        minHeight: 300
                      ),
                      child: Column(
                        children: [
                          Expanded(
                            child: TextFormField(
                              expands: true,
                              maxLines: null,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontFamily: "PlayfairDisplay",
                              ),
                              keyboardType: TextInputType.multiline,
                              textAlignVertical: TextAlignVertical.top,
                              decoration: InputDecoration(
                                hintText: "Answer......",
                                hintStyle: TextStyle(
                                  color: Colors.white
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
                                )
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 4,),
                    Row(
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: MaterialButton(
                              onPressed: (){
                                print("question");
                              },
                              height: 50,
                              color: Color(0xFF5DADE2),
                              textColor: Colors.white,
                              child: Text("Submit"),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 40,),
                  ],
                ),
              )
            ],
          ),
    );
  }
}



