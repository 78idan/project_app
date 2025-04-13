import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:project_app/student/student_module/student_answer.dart';

void main(){
  runApp(
    student_courAssign1_1()
  );
}

class student_courAssign1_1 extends StatelessWidget{
  @override  
  Widget build(BuildContext context ){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: student_courAssign1_2(),
    );
  }
}



class student_courAssign1_2 extends StatefulWidget{
  @override  
  student_courAssign1_3 createState()=> student_courAssign1_3();
}


class student_courAssign1_3 extends State<student_courAssign1_2>{
  @override  
  Widget build(BuildContext context ){
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Color(0xFF002147),
        appBar: student_courAssignAppBar(context),
        body: TabBarView(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
              child: course_video1_1(),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
              child: course_assignment1_1(),
            )
          ],
        ),
      ),
    );
  }
}

PreferredSizeWidget student_courAssignAppBar( BuildContext context ){
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
    bottom: TabBar(
      dividerColor: Color(0xFF002147),
      indicatorSize: TabBarIndicatorSize.label,
      indicatorColor: Colors.white,
      labelColor: Colors.white,
      labelStyle: TextStyle(
        fontFamily: "PlayfairDisplay",
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.white
      ),
      unselectedLabelStyle: TextStyle(
        fontFamily: "PlayfairDisplay",
        fontSize: 16,
        fontWeight: FontWeight.normal,
        color: Colors.white70
      ),
      tabs: [
        Tab(text: "Courses",),
        Tab(text: "Assignment",)
      ],
    ),
  );
}



class course_video1_1 extends StatefulWidget{
  @override  
  course_video1_2 createState()=> course_video1_2();
}

class course_video1_2 extends State<course_video1_1>{
  late VideoPlayerController videoControlstudent1;
  late Future<void> videoInitializestudent1;
  late VideoPlayerController videoControlstudent2;
  late Future<void> videoInitializestudent2;  

  @override  
  void initState(){
    super.initState();
    videoControlstudent1 = VideoPlayerController.asset("assets/gpt.mp4");
    videoInitializestudent1 = videoControlstudent1.initialize();
    videoControlstudent1.setLooping(false);
    videoControlstudent1.addListener(videoEnd);

    videoControlstudent2 = VideoPlayerController.asset("assets/cleaning.mp4");
    videoInitializestudent2 = videoControlstudent2.initialize();
    videoControlstudent2.setLooping(false);


  }

  @override  
  void  dispose(){
    videoControlstudent1.removeListener(videoEnd);
    videoControlstudent1.dispose();
    super.dispose();
  }


  void videoEnd(){
    if(videoControlstudent1.value.position == videoControlstudent1.value.duration ){
      setState(() {
        videoControlstudent1.seekTo(Duration.zero);
      });
    }
  }


  void showBottomPopUp(BuildContext context ){
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: "",
      transitionDuration: Duration(milliseconds: 300),
      pageBuilder: (context,admin1, admin2 ){
        return Align(
          alignment: Alignment.bottomCenter,
          child: Material(
            color: Colors.transparent,
            child: Container(
              margin: EdgeInsets.all(16),
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Color(0xFF1A3A6F),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Delete these lecture ?",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: "PlayfairDisplay"
                  ),
                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: (){
                          Navigator.of(context).pop();
                        },
                        child: Text("Cancel",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: "PlayfairDisplay"
                        ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: (){
                          Navigator.of(context).pop();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green
                        ),
                        child: Text("Delete",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: "PlayfairDisplay"
                        ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
      transitionBuilder: (context,anim1,anim2,child){
        return SlideTransition(
          position: Tween<Offset>(
            begin: Offset(0, 1),
            end: Offset(0, 0)
          ).animate(anim1),
          child: child,
        );
      }
    );
  }



  @override  
  Widget build(BuildContext context ){
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [

            ],
          ),
          SizedBox(height: 10,),
          Row(
            children: [
              FutureBuilder(
                future: videoInitializestudent1,
                builder: (context, snapshot){
                  if(snapshot.connectionState == ConnectionState.done){
                    return Container(
                      height: 60,
                      width: 70,
                      child: AspectRatio(
                        aspectRatio: videoControlstudent1.value.aspectRatio,
                        child: VideoPlayer(videoControlstudent1),
                      ),
                    );
                  }else{
                    return Center(
                      child: Container(
                        height: 20,
                        width: 30,
                        child: CircularProgressIndicator(
                          strokeWidth: 1,
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                        ),
                      ),
                    );
                  }
                },
              ),
              SizedBox(
               width: 5, 
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("The Introduction of data structure and cryptography in these year",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "PlayfairDisplay",
                      fontSize: 14
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    ),
                    Text("Tutorial 1",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 11,
                      fontFamily: "PlayfairDisplay"
                    ),
                    )
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 3),
            child: Divider(
              color: Colors.white,
              thickness: 0.3,
            ),
          ),
          Row(
            children: [
              FutureBuilder(
                future: videoInitializestudent2,
                builder: (context, snapshot){
                  if(snapshot.connectionState == ConnectionState.done){
                    return Container(
                      height: 60,
                      width: 70,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: AspectRatio(
                        aspectRatio: videoControlstudent2.value.aspectRatio,
                        child: VideoPlayer(videoControlstudent2),
                      ),
                    );
                  }else{
                    return Center(
                      child: Container(
                        height: 20,
                        width: 30,
                        child: CircularProgressIndicator(
                          strokeWidth: 1,
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                        ),
                      ),
                    );
                  }
                },
              ),
              SizedBox(
               width: 5, 
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("The Introduction of data cleaning ",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "PlayfairDisplay",
                      fontSize: 14
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    ),
                    Text("Tutorial 2",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 11,
                      fontFamily: "PlayfairDisplay"
                    ),
                    )
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 3),
            child: Divider(
              color: Colors.white,
              thickness: 0.3,
            ),
          ),          
        ],
      ),
    );
  }



}

class course_assignment1_1 extends StatefulWidget{
  @override  
  course_assignment1_2 createState()=> course_assignment1_2();
}

class course_assignment1_2 extends State<course_assignment1_1>{


  void showAssignmentDelet( BuildContext context ){
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: "",
      transitionDuration: Duration(milliseconds: 300),
      pageBuilder: (context,anim1,anim2){
        return Align(
          alignment: Alignment.bottomCenter,
          child: Material(
            color: Colors.transparent,
            child: Container(
              margin: EdgeInsets.all(16),
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Color(0xFF1A3A6F),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Delete these Question ?",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: "PlayfairDisplay",
                  ),
                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: (){
                          Navigator.of(context).pop();
                        },
                        child: Text("Cancel",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: "PlayfairDisplay"
                        ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: (){
                          Navigator.of(context).pop();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green
                        ),
                        child: Text("Delete",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: "PlayfairDisplay"
                        ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
      transitionBuilder: (context,anim1,anim2,child){
        return SlideTransition(
          position: Tween<Offset>(
            begin: Offset(0, 1),
            end: Offset(0, 0)
          ).animate(anim1),
          child: child,
        );
      }
    );
  }


  @override  
  Widget build(BuildContext context){
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("what skill would you choose to perfect without any effort or time needed for learning? Additionally, how do you think mastering this particular skill would impact your progress, efficiency, and overall success in your academic or professional journey?",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "PlayfairDisplay",
                      fontSize: 14,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    Row(
                      children: [
                        Container(
                          width: 68,
                          child: Text("Question 1",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "PlayfairDisplay",
                            fontSize: 12,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.05,
                        ),
                        CircleAvatar(
                          radius: 11,
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.person,
                            size: 16,
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.01 ,
                        ),
                        Container(
                          width: 80,
                          decoration: BoxDecoration(
                            // color: Colors.red
                          ),
                          child: Text("Mr Mwasaga",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontFamily: "PlayfairDisplay" 
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          ),
                        ),
                        Flexible(
                          child: SizedBox(
                            width: double.infinity,
                          ),
                        ),
                        IconButton(
                          onPressed: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context)=> student_Assign1_2()
                              )
                            );
                          },
                          icon: Icon(
                            Icons.arrow_forward_ios_outlined,
                            size: 17,
                            color: Colors.white,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 3),
            child: Divider(
              color: Colors.white,
              thickness: 0.3,
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("If you had the incredible opportunity to instantly master one specific skill that is directly related to your current projects, studies, or long-term career goals—whether it's in quantum technologies,",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "PlayfairDisplay",
                      fontSize: 14,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    Row(
                      children: [
                        Container(
                          width: 68,
                          decoration: BoxDecoration(
                            // color: Colors.black
                          ),
                          child: Text("Question 1",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "PlayfairDisplay",
                            fontSize: 12,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.05,
                        ),
                        CircleAvatar(
                          radius: 11,
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.person,
                            size: 16,
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.01 ,
                        ),
                        Container(
                          width: 80,
                          child: Text("Lisaa Jane",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontFamily: "PlayfairDisplay" 
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          ),
                        ),
                        Flexible(
                          child: SizedBox(
                            width: double.infinity,
                          ),
                        ),
                        IconButton(
                          onPressed: (){
                            print("View answer");
                          },
                          icon: Icon(
                            Icons.arrow_forward_ios_outlined,
                            size: 17,
                            color: Colors.white,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 3),
            child: Divider(
              color: Colors.white,
              thickness: 0.3,
            ),
          ),          
        ],
      ),
    );
  }
}



