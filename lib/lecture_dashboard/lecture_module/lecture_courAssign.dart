import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:project_app/lecture_dashboard/lecture_module/lecture_AssignList.dart';
import 'package:project_app/lecture_dashboard/lecture_module/lecture_addAssign.dart';
import 'package:project_app/lecture_dashboard/lecture_module/lecture_addCourse.dart';
import 'package:video_player/video_player.dart';

void main(){
  runApp(
    lecture_courAssign1_1()
  );
}

class lecture_courAssign1_1 extends StatelessWidget{
  @override  
  Widget build(BuildContext context ){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: lecture_courAssign1_2(),
    );
  }
}



class lecture_courAssign1_2 extends StatefulWidget{
  @override  
  lecture_courAssign1_3 createState()=> lecture_courAssign1_3();
}


class lecture_courAssign1_3 extends State<lecture_courAssign1_2>{
  @override  
  Widget build(BuildContext context ){
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Color(0xFF002147),
        appBar: lecture_courAssignAppBar(context),
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

PreferredSizeWidget lecture_courAssignAppBar( BuildContext context ){
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
  List<VideoPlayerController> videoControl = [];
  // late Future<void> videoInitialize;
  bool isLoading =  false; 
  String emptyText = "";
  String DataBase_ManagementVideo = "Database Management_video";
  List<dynamic> video_content = [];
  List<dynamic> video_course = [];
  List<dynamic> video_id = [];

  Future<void> retrieveLectureVideo() async {
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
      var url = "http://192.168.249.102/project_app/lecture_courVideo.php";
      var dataSend = {
        "Table_name": DataBase_ManagementVideo
      };

      Response response = await dio.post(
        url,
        data: FormData.fromMap(dataSend)
      );

      if(response.statusCode == 200){
        print(response.data);
        var dataReceived = response.data;
        if(dataReceived['text'] == "NotVideoEmpty"){
          setState(() {
            emptyText = "";
          });
          var detailsReceived = response.data;
          List<dynamic> OriginalDataReceived = detailsReceived['message'];
          List<String> dataReceivedUsed = [];
          for(var detailReceived1 in OriginalDataReceived){
            dataReceivedUsed.add(detailReceived1['video_name']);
            video_content.add(detailReceived1['video_content']);
            video_course.add(detailReceived1['video_course']);
            video_id.add(detailReceived1['video_id']);
          }
          // print(dataReceivedUsed);
          // print(video_content);
          // print(video_course);
          // print(video_id);
          if(dataReceivedUsed.isNotEmpty){
            for (String dataReceivedUsed1 in dataReceivedUsed){
              try{
                final Uri uriDataReceived = await Uri.parse(dataReceivedUsed1);

                if(!uriDataReceived.hasScheme || uriDataReceived.host.isEmpty){
                  throw Exception("Invalid Url has no host");
                }

                final controllerVideo = await VideoPlayerController.networkUrl(
                  uriDataReceived
                );
                controllerVideo.addListener((){
                  if(controllerVideo.value.hasError){
                    print("there is an error controller: ${controllerVideo.value.errorDescription} ");
                  }
                });

                await controllerVideo.initialize();

                videoControl.add(controllerVideo);
                print("Video Initialized");

                if(mounted){
                  setState(() {
                    controllerVideo.setLooping(true);
                  });
                }


              }catch(e){
                print(e);
              }
            }
          }else{
            print("Empty video found list");
          }
        }else{
          setState(() {
            isLoading = false;
            emptyText = "No Video Uploaded";
          });
        }
      }

    }catch(e){
      if(e is DioException){
        switch(e.type){
          case DioExceptionType.connectionTimeout:
               print("connect timeOut: ${e.message} ");
               break;
          case DioExceptionType.connectionError:
               print("connectionError: ${e.message} ");
               break;
          case DioExceptionType.receiveTimeout:
               print("receive timeOut: ${e.message} ");
               break;
          case DioExceptionType.sendTimeout:
               print("send Error: ${e.message} ");
               break;
          case DioExceptionType.cancel:
               print("cancel error ${e.message} ");
               break;
          case DioExceptionType.unknown:
               print("unknown error: ${e.message} ");
               break;
          case DioExceptionType.badCertificate:
               print("bad certificate: ${e.message} ");
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

  @override  
  void initState(){
    super.initState();
    retrieveLectureVideo();
  }

  @override  
  void  dispose(){
    super.dispose();
  }





  void showBottomPopUp(BuildContext context, int delete_id ){
    // print(delete_id);
    int delete_id_Actual = delete_id;
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
                        onPressed: () async {
                          // Navigator.of(context).pop();
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

                            var urlDelete = "http://192.168.249.102/project_app/delete_courVideo.php";
                            var dataToDelete = {
                              "delete_id": delete_id_Actual,
                              "table_name": DataBase_ManagementVideo
                            };

                            Response response = await dio.post(
                              urlDelete,
                              data: FormData.fromMap(dataToDelete)
                            );

                            if(response.statusCode == 200){
                              print(response.data);
                              var receivedData = response.data;
                              if(receivedData['message'] == "deleted Video"){
                                int indexToDelete = video_id.indexOf(delete_id_Actual);
                                if(indexToDelete != -1 ){
                                  videoControl[indexToDelete].dispose();

                                  videoControl.removeAt(indexToDelete);
                                  video_course.removeAt(indexToDelete);
                                  video_content.removeAt(indexToDelete);
                                  video_id.removeAt(indexToDelete);

                                  setState(() {
                                    
                                  });
                                  Navigator.of(context).pop();

                                }
                              }else{
                                print(receivedData['message']);
                              }
                            }

                          }catch(e){
                            if(e is DioException){
                              switch(e.type){
                                case DioExceptionType.connectionTimeout:
                                     print("connectionTime OUt error: ${e.message}");
                                     break;
                                case DioExceptionType.connectionError:
                                     print("connection error: ${e.message}");
                                     break;
                                case DioExceptionType.sendTimeout:
                                     print("sendtimeout error: ${e.message} ");
                                     break;
                                case DioExceptionType.receiveTimeout:
                                     print("receieve timeout: ${e.message} ");
                                     break;
                                case DioExceptionType.cancel:
                                     print("cancel error: ${e.message} ");
                                     break;
                                case DioExceptionType.unknown:
                                     print("unknown error: ${e.message} ");
                                     break;
                                default: 
                                     print("default error: ${e.message}");
                                     break;                              
                              }
                            }else{
                              print("else error $e");
                            }
                          }
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
              GestureDetector(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context)=>lecture_addCourse1_2()
                    )
                  );
                },
                child: CircleAvatar(
                  radius: 16,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.add,
                    size: 15,
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: 10,),
          if(isLoading)
            Center(
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            )
          else if(emptyText.isNotEmpty)
            Center(
              child: Text(emptyText,
              style: TextStyle(
                color: Colors.white,
                fontFamily: "PlayfairDisplay",
                fontSize: 16
              ),
              ),
            )
          else     
            Container(
              // width: double.infinity,
              height: 480,
              decoration: BoxDecoration(
                // color: Colors.red
              ),
              child: ListView.builder(
                itemCount: videoControl.length,
                itemBuilder: (context,index) {
                  final controllerVideo2 = videoControl[index];
                  return Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 60,
                            width: 70,
                            child: AspectRatio(
                              aspectRatio: controllerVideo2.value.aspectRatio,
                              child: VideoPlayer(controllerVideo2),
                            ),
                          ),
                          SizedBox(
                          width: 5, 
                          ),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("${video_content[index]}",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "PlayfairDisplay",
                                  fontSize: 14
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                ),
                                Text("${video_course[index]}",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 11,
                                  fontFamily: "PlayfairDisplay"
                                ),
                                )
                              ],
                            ),
                          ),
                          IconButton(
                            onPressed: (){
                              showBottomPopUp(context,video_id[index]);
                            },
                            icon: Icon(
                              Icons.delete,
                              color: Colors.white,
                              size: 20,
                            ),
                          )
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
                  );
                }
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
              GestureDetector(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context)=>lecture_addAssign1_2()
                    )
                  );
                },
                child: CircleAvatar(
                  radius: 16,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.add,
                    size: 15,
                  ),
                ),
              )
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
                        Text("Question 1",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: "PlayfairDisplay",
                          fontSize: 12,
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
                        Text("123",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontFamily: "PlayfairDisplay" 
                        ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.31 ,
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
              IconButton(
                onPressed: (){
                  // print("Thank You God");
                  showAssignmentDelet(context);
                },
                icon: Icon(
                  Icons.delete,
                  size: 20,
                  color: Colors.white,
                ),
              )
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
                        Text("Question 1",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: "PlayfairDisplay",
                          fontSize: 12,
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
                        Text("123",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontFamily: "PlayfairDisplay" 
                        ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.31 ,
                        ),
                        IconButton(
                          onPressed: (){
                            // print("View answer");
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => lecture_AssignList1_2(),
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
              IconButton(
                onPressed: (){
                  // print("Thank You God");
                  showAssignmentDelet(context);
                },
                icon: Icon(
                  Icons.delete,
                  size: 20,
                  color: Colors.white,
                ),
              )
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



