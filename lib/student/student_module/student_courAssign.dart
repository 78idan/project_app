import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:project_app/student/student_module/student_answer.dart';
import 'package:dio/dio.dart';
import 'package:project_app/student/student_module/view/student_view.dart';
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
  List<VideoPlayerController> controlVideo = [];
  List<dynamic> video_content = [];
  List<dynamic> video_id = [];
  List<dynamic> video_name = [];
  List<dynamic> video_course = [];
  List<dynamic> videoName2 = [];
  String errorText = "";
  //start of variable of special cases that have filled the parameterers of student_viewVideo1_2() function
  String table_name2 = "";
  String IpAddress = "192.168.224.102";
  //end of variable of special cases that have filled the parameterers of student_viewVideo1_2() function
  bool isLoading = false;
  late Future<void> videoInitializestudent1;
  late VideoPlayerController videoControlstudent2;
  late Future<void> videoInitializestudent2;  

@override  
void  dispose(){
  for (var disposeControlVideo in controlVideo){
    disposeControlVideo.dispose();
  }    
  super.dispose();
 }

  @override  
  void initState(){
    super.initState();
    retrieveVideo();


  }




    //start of function to retrieve the video according to module name
    Future<void> retrieveVideo() async{
      String module_name = "DataBase Management"+"_video";
      setState(() {
        isLoading = true;
        errorText = "";
        table_name2 = module_name;
      });
      try{
        Dio dio = Dio(
          BaseOptions(
            connectTimeout: Duration(seconds: 20),
            receiveTimeout: Duration(seconds: 20),
            headers: {
              "Accept": "*/*"
            }
          )
        );
        print(module_name);
        var IpAddress = "192.168.126.102";
        var dataSend = {
          "Table_name": module_name
        };
        var urlDataSend = "http://${IpAddress}/project_app/student_courAssign.php";
        Response response = await dio.post(
          urlDataSend,
          data: FormData.fromMap(dataSend)
        );

        if(response.statusCode == 200){
          setState(() {
            isLoading = false;
            errorText = "";
          });
          print(response.data);
          var videoData = response.data;
          if(videoData['message'] == "No video Uploaded"){
            setState(() {
              errorText = "No video Uploaded";
            });
          }else{
            var dataVideo = videoData['main'];
            List<dynamic> videoName = [];
            setState(() {
              for( var dataVideo2 in dataVideo ){
                videoName.add(dataVideo2['video_name']);
                videoName2.add(dataVideo2['video_name']);
                video_content.add(dataVideo2['video_content']);
                video_course.add(dataVideo2['video_course']);
                video_id.add(dataVideo2['video_id']);
              }
            });

            for(var videoName2 in videoName){
              try{
                final UriData = await Uri.parse(videoName2);
                if(!UriData.hasScheme || UriData.host.isEmpty){
                  throw Exception("The host or scheme are not available");
                }

                final videoDataControl = await VideoPlayerController.networkUrl(UriData);
                
                videoDataControl.addListener((){
                  if(videoDataControl.value.hasError){
                    print("THere is an error ${videoDataControl.value.errorDescription} ");
                  }
                });
                await videoDataControl.initialize();

                controlVideo.add(videoDataControl);
                print("The video is initialized");

                if(mounted){
                  setState(() {
                    videoDataControl.setLooping(true);
                  });
                }


              }catch(e){
                print(e);
              }
            }

          }
        }

      }catch(e){
      if(e is DioException){
        switch(e.type){
          case DioExceptionType.connectionTimeout:
               print("Connection TimeOut ${e.message} ");
               break;
          case DioExceptionType.connectionError:
               print("connection Error: ${e.message}");
               break;
          case DioExceptionType.receiveTimeout:
               print("receieve error: ${e.message} ");
               break;
          case DioExceptionType.sendTimeout:
               print("send error: ${e.message} ");
               break;
          case DioExceptionType.badCertificate:
               print("bad certificate ${e.message} ");
               break;
          case DioExceptionType.unknown:
               print("unknow error: ${e.message} ");
               break;
          case DioExceptionType.cancel:
               print("cancel error: ${e.message} ");
               break;
          default:
                print("default error: ${e.message} ");
                break;                    
                         
        }
      }else{
        print("else error: $e");
      }       
      }
    }
    //end of function to retrieve the video according to module name





  @override  
  Widget build(BuildContext context ){

    return RefreshIndicator(
      onRefresh: () async {
        controlVideo.forEach((controller)=>controller.dispose);
        video_content.clear();
        video_course.clear();
        video_id.clear();
        await retrieveVideo();
      },
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
      
              ],
            ),
            SizedBox(height: 10,),
            if(isLoading)
              Center(
                child: CircularProgressIndicator(
                  strokeWidth: 1,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              )
            else if(errorText.isNotEmpty)
              Center(
                child: Text(errorText,
                style: TextStyle(
                  fontFamily: "PlayfairDisplay"
                ),
                ),
              ) 
            else
            Container(
              height: 580,
              decoration: BoxDecoration(
                // color: Colors.red
              ),
              child: ListView.builder(
                itemCount: controlVideo.length,
                itemBuilder: (BuildContext context,int index) {
                  final videoDisplay = controlVideo[index];
                  return Column(
                    children: [
                      GestureDetector(
                      onTap: () {
                        // Use PageRouteBuilder with regular push to allow going back
                      },
                        child: Row(
                          children: [
                            Column(
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Container(
                                      width: 50 ,
                                      // height: 60,
                                      decoration: BoxDecoration(
                                        // color: Colors.red
                                      ),
                                      child: Text("Hint",
                                      style: TextStyle(
                                        color: Colors.green,
                                        fontFamily: "PlayfairDisplay"
                                      ),
                                      ),
                                    ),
                                    SizedBox(
                                    width: 5, 
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width * 0.63,
                                      // constraints: BoxConstraints(minWidth: 0),
                                      decoration: BoxDecoration(
                                        // color: Colors.red
                                      ),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(video_content[index],
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: "PlayfairDisplay",
                                            fontSize: 14
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                          ),
                                          SizedBox(height: 5,),
                                          Text(video_course[index],
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 11,
                                            fontFamily: "PlayfairDisplay"
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                          )
                                        ],
                                      ),
                                    ), 
                                    IconButton(
                                      onPressed: (){
                                        // print("Thank God");
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context)=>student_view1_2(video_content: video_content[index])
                                          )
                                        );
                                      },
                                      icon: Icon(
                                        Icons.arrow_forward_ios_sharp,
                                        color: Colors.white,
                                        
                                      ),
                                    )                                   
                                  ],
                                ),
                                SizedBox(height: 10,),
                                Container(
                                  height: 200,
                                  width: 200,
                                  child: AspectRatio(
                                    aspectRatio: videoDisplay.value.aspectRatio,
                                    child: VideoPlayer(videoDisplay),
                                  ),
                                ),
                                SizedBox(height: 8,),
                                GestureDetector(
                                  onTap: (){
                                    if(videoDisplay.value.isPlaying){
                                      setState(() {
                                        videoDisplay.pause();
                                      });
                                    }else{
                                      setState(() {
                                        videoDisplay.play();
                                      });
                                    }
                                  },
                                  child: Container(
                                    width: 35,
                                    height: 35,
                                    decoration: BoxDecoration(
                                      color: const Color.fromARGB(255, 57, 162, 248),
                                      borderRadius: BorderRadius.circular(15)
                                    ),
                                    child: Icon(
                                      videoDisplay.value.isPlaying ? Icons.pause : Icons.play_arrow,
                                      size: 21,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 3),
                        child: Divider(
                          color: Colors.white,
                          thickness: 0.3,
                        ),
                      ),                       
                    ],
                  );
                }
              ),
            ),         
          ],
        ),
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



