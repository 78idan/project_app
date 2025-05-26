import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


void main(){
  runApp(book1_1());
}


class book1_1 extends StatelessWidget{
  @override  
  Widget build(BuildContext context ){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: book1_2(),
    );
  }
}

class book1_2 extends StatefulWidget{
  @override  
  book1_3 createState()=> book1_3();
}

class book1_3 extends State<book1_2>{
  @override  
  Widget build(BuildContext context ){
    return Scaffold(
      backgroundColor: Color(0xFF002147),
      appBar: BookAppBar(context),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              bookContainer1_1()
            ],
          ),
        ),
      ),
    );
  }
}


PreferredSizeWidget BookAppBar(BuildContext context ){
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


class bookContainer1_1 extends StatefulWidget{
  @override  
  bookContainer1_2 createState()=> bookContainer1_2();
}

class bookContainer1_2 extends State<bookContainer1_1>{

  //start of void function
  void initState(){
    super.initState();
    String RecentDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
    dateController.text = RecentDate;
  }
  //end of void function

  GlobalKey keyBook = GlobalKey<FormState>();
  TextEditingController dateController = TextEditingController();
  TextEditingController activityController = TextEditingController();
  //start of validating controllers
  Future<void> validatingController() async {
    if(activityController.text.isEmpty){
      customNotification.notificationCustom(context, message: "There is an empty input");
    }
  }
  //end of validating controllers

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
                          controller: activityController,
                          style: TextStyle(
                            color: Colors.white
                          ),
                          expands: true,
                          keyboardType: TextInputType.multiline,
                          textAlignVertical: TextAlignVertical.top,
                          maxLines: null,
                          decoration: InputDecoration(
                            hintText: "Activity Description....",
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
                          onPressed: (){
                            validatingController();
                          },
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
                    fontSize: 14,
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






