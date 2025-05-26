import 'package:flutter/material.dart';



// void main(){
//   runApp(lecture_book_week1_1());
// }


// class lecture_book_week1_1 extends StatelessWidget{
//   @override  
//   Widget build(BuildContext context ){
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: lecture_book_week1_2(),
//     );
//   }
// }

class lecture_book_week1_2 extends StatefulWidget{
  @override  
  lecture_book_week1_3 createState()=> lecture_book_week1_3();
}

class lecture_book_week1_3 extends State<lecture_book_week1_2>{
  @override  
  Widget build(BuildContext context ){
    return Scaffold(
      backgroundColor: Color(0xFF002147),
      appBar: LectureBookWeekAppBar(context),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              lecture_bookContainer_week1_1()
            ],
          ),
        ),
      ),
    );
  }
}


PreferredSizeWidget LectureBookWeekAppBar(BuildContext context ){
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


class lecture_bookContainer_week1_1 extends StatefulWidget{
  @override  
  lecture_bookContainer_week1_2 createState()=> lecture_bookContainer_week1_2();
}

class lecture_bookContainer_week1_2 extends State<lecture_bookContainer_week1_1>{

  GlobalKey keyBook = GlobalKey<FormState>();
  TextEditingController dateController = TextEditingController();
  @override  
  Widget build(BuildContext context){
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 35,
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.book,
                  size: 45,
                ),
              )
            ],
          ),
          SizedBox(height: 15,),
          Form(
            key: keyBook,
            child: Column(
              children: [
                TextFormField(
                  controller: dateController,
                  style: TextStyle(
                    color: Colors.white
                  ),
                  readOnly: true,
                  decoration: InputDecoration(
                    hintText: "24/5/2024",
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
                    suffixIcon: Icon(
                      Icons.timer_outlined,
                      color: Colors.grey[400],
                    )
                  ),
                ),
                SizedBox(height: 5,),
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxHeight: 300,
                    minHeight: 300
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        child: TextFormField(
                          style: TextStyle(
                            color: Colors.white
                          ),
                          expands: true,
                          keyboardType: TextInputType.multiline,
                          textAlignVertical: TextAlignVertical.top,
                          maxLines: null,
                          decoration: InputDecoration(
                            hintText: "Week Description....",
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
                              Icons.description,
                              color: Colors.grey[400],
                            )
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 5,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Photo/Diagram",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                    ),
                  ],
                ),                
                GestureDetector(
                  onTap: () {
                    // Handle your upload logic here
                    print("Thanks God");
                  },
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: 300,
                      minHeight: 300,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xFF1A3A6F),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.photo,
                              color: Colors.grey[400],
                              size: 60,
                            ),
                            SizedBox(height: 10),
                            Text(
                              "Tap to upload picture",
                              style: TextStyle(color: Colors.white70),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                
                SizedBox(height: 5,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Verification",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: (){
                    print("Industrial spuervisor");
                  },
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: 70,
                      minHeight: 70
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          child: TextFormField(
                            expands: true,
                            keyboardType: TextInputType.multiline,
                            textAlignVertical: TextAlignVertical.top,
                            maxLines: null,
                            readOnly: true,
                            decoration: InputDecoration(
                              hintText: "Industrial Supervisor Signature",
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
                              suffixIcon: Icon(
                                Icons.draw,
                                color: Colors.grey[400],
                              )
                            ),
                          )
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 5,),
                GestureDetector(
                  onTap: (){
                    print("Thank God");
                  },
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: 70,
                      minHeight: 70
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          child: TextFormField(
                            expands: true,
                            keyboardType: TextInputType.multiline,
                            textAlignVertical: TextAlignVertical.top,
                            maxLines: null,
                            readOnly: true,
                            decoration: InputDecoration(
                              hintText: "COllege Supervisor Signature",
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
                              suffixIcon: Icon(
                                Icons.draw,
                                color: Colors.grey[400],
                              )
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 5,),
                Row(
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: MaterialButton(
                          onPressed: (){},
                          height: 50,
                          color: Color(0xFF5DADE2),
                          textColor: Colors.white,
                          child: Text("Submit"),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

