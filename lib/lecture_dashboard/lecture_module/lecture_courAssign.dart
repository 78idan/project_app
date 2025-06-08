import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:project_app/lecture_dashboard/lecture_module/lecture_AssignList.dart';
import 'package:project_app/lecture_dashboard/lecture_module/lecture_addAssign.dart';
import 'package:project_app/lecture_dashboard/lecture_module/lecture_addCourse.dart';
import 'package:project_app/lecture_dashboard/lecture_module/lecture_addNote.dart';
import 'package:video_player/video_player.dart';


// void main(){
//   runApp(
//     lecture_courAssign1_1()
//   );
// }

// class lecture_courAssign1_1 extends StatelessWidget{
//   @override  
//   Widget build(BuildContext context ){
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: lecture_courAssign1_2(),
//     );
//   }
// }



class lecture_courAssign1_2 extends StatefulWidget{
  final String module_name;
  final String IpAddress;
  lecture_courAssign1_2({ required this.module_name, required this.IpAddress });  
  @override  
  lecture_courAssign1_3 createState()=> lecture_courAssign1_3();
}


class lecture_courAssign1_3 extends State<lecture_courAssign1_2>{

  
  @override  
  Widget build(BuildContext context ){
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Color(0xFF002147),
        appBar: lecture_courAssignAppBar(context),
        body: TabBarView(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
              child: course_video1_1(module_name: widget.module_name, IpAddress: widget.IpAddress),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
              child: course_assignment1_1(module_name: widget.module_name, IpAddress: widget.IpAddress),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
              child: notesContainer1_1(module_name: widget.module_name, IpAddress: widget.IpAddress),
            ),            
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
        Tab(text: "Assignment",),
        Tab(text: "Notes",)
      ],
    ),
  );
}



class course_video1_1 extends StatefulWidget{
  final String module_name;
  final String IpAddress;
  course_video1_1({  required this.module_name, required this.IpAddress  });
  @override  
  course_video1_2 createState()=> course_video1_2();
}

class course_video1_2 extends State<course_video1_1>{
  List<VideoPlayerController> videoControl = [];
  // late Future<void> videoInitialize;
  bool isLoading =  false; 
  String emptyText = "";
  String module_name2 = "";

  List<dynamic> video_content = [];
  List<dynamic> video_course = [];
  List<dynamic> video_id = [];

  // function of retrieving the video from database 
  Future<void> retrieveLectureVideo() async {
  String module_name = widget.module_name+"_video";
  setState(() {
    module_name2 = module_name;
  });
  String IpAddress = widget.IpAddress;
    setState(() {
      isLoading = true;
      emptyText = "";
    });

    try{
      print(module_name);
      Dio dio = Dio(
        BaseOptions(
          connectTimeout: Duration(seconds: 20),
          receiveTimeout: Duration(seconds: 20),
          headers: {
            "Accept": "*/*"
          }
        )
      );
      var url = "http://${IpAddress}/project_app/lecture_courVideo.php";
      var dataSend = {
        "Table_name": module_name,
        "IpAddress": IpAddress,
      };

      Response response = await dio.post(
        url,
        data: FormData.fromMap(dataSend)
      );

      if(response.statusCode == 200){
        print(response.data);
        setState(() {
          isLoading = false;
          emptyText = "";
        });        
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
            // isLoading = false;
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
  // end function of retrieving the video from database

  @override  
  void initState(){
    super.initState();
    retrieveLectureVideo();
  }

  @override  
  void  dispose(){
    for (var videoDisposeControl in videoControl){
      videoDisposeControl.dispose();
    }
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

                            var urlDelete = "http://${widget.IpAddress}/project_app/delete_courVideo.php";
                            var dataToDelete = {
                              "delete_id": delete_id_Actual,
                              "table_name": module_name2
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
    return RefreshIndicator(
      onRefresh: () async {
      videoControl.forEach((controller) => controller.dispose());
      videoControl.clear();
      video_content.clear();
      video_course.clear();
      video_id.clear();
      await retrieveLectureVideo();
      },
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: AlwaysScrollableScrollPhysics(),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () async {
                    final result  = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context)=>lecture_addCourse1_2(DataBase_ManagementVideo: module_name2,IpAdress: widget.IpAddress,)
                          )
                        );
                    if(result == true){
                      setState(() {
                        // retrieveLectureVideo();
                      });
                    }    
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
                height: 580,
                decoration: BoxDecoration(
                  // color: Colors.red
                ),
                child: ListView.builder(
                  itemCount: videoControl.length,
                  itemBuilder: (context,index) {
                    final controllerVideo2 = videoControl[index];
                    // print(videoControl.length);
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
      ),
    );
  }



}

class course_assignment1_1 extends StatefulWidget{
  final String module_name;
  final String IpAddress;
  course_assignment1_1({ required this.module_name, required this.IpAddress  });
  @override  
  course_assignment1_2 createState()=> course_assignment1_2();
}

class course_assignment1_2 extends State<course_assignment1_1>{

  // String IpAddress = "192.168.33.102";
  // String moduleName = "DataBase Management";

  List<dynamic> nameOfTable = [];
  List<dynamic> question_note = [];
  List<dynamic> count = [];
  String emptyText = "";
  bool isProgressing = false;

  @override  
  void initState(){
    super.initState();
    requestingData();
  }

  //start function of requesting data

  Future<void> requestingData() async {
    setState(() {
      isProgressing = true;
      emptyText = "";
    });
    String table_name = widget.module_name+"_qu";
    // print(table_name);
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
      
      var urlRequestData = "http://${widget.IpAddress}/project_app/lecture_courAssign.php";

      var dataPosted = {
        "table_name": table_name
      };

      Response response = await dio.post(
        urlRequestData,
        data: FormData.fromMap(dataPosted)
      );

      if(response.statusCode == 200){
        setState(() {
          isProgressing = false;
          emptyText = "";
        });
        // print(response.data);
        var receivedItems = response.data;
        if(receivedItems['message'] == "No question uploaded" ){
          setState(() {
            emptyText = "No question uploaded  ";
          });
        }else{
          var ItemsReceived = receivedItems['message'];
          setState(() {
          for (var ItemsReceived2 in ItemsReceived){
            nameOfTable.add(ItemsReceived2['table_name']);
            question_note.add(ItemsReceived2['question_note']);
            count.add(ItemsReceived2['count']);
          }          
          });
        }

        // print(question_note.length);
      }


    }catch(e){
      if(e is DioException){
        switch(e.type){
          case DioExceptionType.connectionTimeout:
               print("connection TimeOut: ${e.message}  ");
               break;
          case DioExceptionType.connectionError:
               print("connection Error: ${e.message} ");
               break;
          case DioExceptionType.receiveTimeout:
               print("receieve TimeOut: ${e.message}  ");
               break;
          case DioExceptionType.sendTimeout:
               print("sendTime out: ${e.message} ");
               break;
          case DioExceptionType.cancel:
               print("cancel error: ${e.message} ");
               break;
          case DioExceptionType.unknown:
               print("Unknown error: ${e.message} ");
               break;
          default: 
               print("default error: ${e.message} ");
               break;                              
        }
      }else{
        print(" else error: $e ");
      }
    }
  }

  //end function of requesting data



  void showAssignmentDelet( BuildContext context, var tableOfName ){
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
                        onPressed: () async {
                          // print("goods");
                          // print(tableOfName);
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
                            var urlDelete = "http://${widget.IpAddress}/project_app/delete_courAssign.php";
                            var tableDeleted = {
                              "tableOfName": tableOfName
                            };
                            
                            Response response = await dio.post(
                              urlDelete,
                              data: FormData.fromMap(tableDeleted)
                            );

                            if(response.statusCode == 200){
                              // print(response.data);
                              var deletedData = response.data;
                              if(deletedData['message'] == "Table deleted"){
                                int indexFound = nameOfTable.indexOf(tableOfName);
                                if(indexFound != -1){
                                  nameOfTable.removeAt(indexFound);
                                  question_note.removeAt(indexFound);
                                  count.removeAt(indexFound);
                                  setState(() {
                                    
                                  });
                                  Navigator.of(context).pop();
                                }
                              }
                            }


                          }catch(e){
                            if(e is DioException){
                              switch(e.type){
                                case DioExceptionType.connectionTimeout:
                                    print("connection TimeOut: ${e.message}  ");
                                    break;
                                case DioExceptionType.connectionError:
                                    print("connection Error: ${e.message} ");
                                    break;
                                case DioExceptionType.receiveTimeout:
                                    print("receieve TimeOut: ${e.message}  ");
                                    break;
                                case DioExceptionType.sendTimeout:
                                    print("sendTime out: ${e.message} ");
                                    break;
                                case DioExceptionType.cancel:
                                    print("cancel error: ${e.message} ");
                                    break;
                                case DioExceptionType.unknown:
                                    print("Unknown error: ${e.message} ");
                                    break;
                                default: 
                                    print("default error: ${e.message} ");
                                    break;                              
                              }
                            }else{
                              print(" else error: $e ");
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
  Widget build(BuildContext context){
    return RefreshIndicator(
      onRefresh: () async {
        // print("refresh");
        nameOfTable.clear();
        question_note.clear();
        count.clear();
        await requestingData();
      },
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: AlwaysScrollableScrollPhysics(),
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
                        builder: (context)=>lecture_addAssign1_2(OriginalIpAdrress: widget.IpAddress, module_name: widget.module_name,)
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
            if(isProgressing)
               Center(
                child: CircularProgressIndicator(
                  strokeWidth: 1,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
               )
            else if(emptyText.isNotEmpty)
               Center(
                child: Text(emptyText,
                style: TextStyle(
                  color: Colors.white,
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
                  itemCount: question_note.length,
                  itemBuilder: (BuildContext context, int index) {
                    
                    return Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(question_note[index],
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
                                      // Text("Question 1",
                                      // style: TextStyle(
                                      //   color: Colors.white,
                                      //   fontFamily: "PlayfairDisplay",
                                      //   fontSize: 12,
                                      // ),
                                      // ),
                                      // SizedBox(
                                      //   width: MediaQuery.of(context).size.width * 0.05,
                                      // ),
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
                                      Text("${count[index]}",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontFamily: "PlayfairDisplay" 
                                      ),
                                      ),
                                      SizedBox(
                                        width: MediaQuery.of(context).size.width * 0.52 ,
                                      ),
                                      IconButton(
                                        onPressed: (){
                                          // print("View answer");
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => lecture_AssignList1_2(nameOfTable: nameOfTable[index], IpAddress: widget.IpAddress),
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
                                showAssignmentDelet(context,nameOfTable[index]);
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
                    );
                  }
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
        ),
      ),
    );
  }
}




class notesContainer1_1 extends StatefulWidget{
  final String module_name;
  final String IpAddress;
  notesContainer1_1({ required this.module_name, required this.IpAddress  });
  @override
  notesContainer1_2 createState()=> notesContainer1_2();
}

class notesContainer1_2 extends State<notesContainer1_1>{
  List<dynamic> note_name = [];
  List<dynamic> note_path = [];
  List<dynamic> note_id = [];
  String errorNote = "";
  bool isLoading = false;
  
  // Add these variables for download tracking
  Map<int, bool> isDownloading = {};
  Map<int, double> downloadProgress = {};

  @override  
  void initState(){
    super.initState();
    selectNotes();
  }

  //start of selectNotes function
  Future<void> selectNotes() async {
    setState(() {
      isLoading = true;
    });
    String Table_name = widget.module_name+"_notes";
    try{
      Dio dio = Dio(
        BaseOptions(
          connectTimeout: Duration(seconds: 15),
          receiveTimeout: Duration(seconds: 15),
        )
      );

      var IpAddress = widget.IpAddress;

      FormData dataSend = FormData.fromMap({
        "Table_name": Table_name,
        "IpAddress": IpAddress
      });

      var UrlSend = "http://${IpAddress}/project_app/retrieve_note.php";

      Response response = await dio.post(
        UrlSend,
        data:  dataSend
      );

      if(response.statusCode == 200){
        // print(response.data);
        var dataReceived = response.data;
        if(dataReceived['message'] == "notes empty"){
          setState(() {
            errorNote = "notes empty";
          });
        }else{
          var notesFile = dataReceived['note'];
          setState(() {
            errorNote = "";
            for (var notesFile2 in notesFile){
              note_name.add(notesFile2['note_name']);
              note_path.add(notesFile2['note_path']);
              note_id.add(notesFile2['note_id']);
            }
          });
        }
      }
      setState(() {
        isLoading = false;
      });

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
  //end of selectNotes function

  //start of deleteFunction
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
                  Text("Delete these document ?",
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
                          String Table_name = widget.module_name+"_notes";
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
                            var IpAddress = widget.IpAddress;

                            var urlDelete = "http://${IpAddress}/project_app/delete_note.php";
                            var dataToDelete = {
                              "delete_id": delete_id_Actual,
                              "Table_name": Table_name
                            };

                            Response response = await dio.post(
                              urlDelete,
                              data: FormData.fromMap(dataToDelete)
                            );

                            if(response.statusCode == 200){
                              // print(response.data);
                              var receivedData = response.data;
                              if(receivedData['message'] == "deleted notes"){
                                int indexToDelete = note_id.indexOf(delete_id_Actual);
                                if(indexToDelete != -1 ){
                                  // note_path[indexToDelete].dispose();

                                  note_path.removeAt(indexToDelete);
                                  note_name.removeAt(indexToDelete);
                                  note_id.removeAt(indexToDelete);

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
  //end of deleteFunction


  @override 
  Widget build(BuildContext context){
    return RefreshIndicator(
      onRefresh: () async {
        note_name.clear();
        note_path.clear();
        note_id.clear();
        await selectNotes();
      },
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: AlwaysScrollableScrollPhysics(),
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
                        builder: (context)=> lecture_addNote1_2(module_name: widget.module_name, IpAddress: widget.IpAddress)
                      )
                    );
                  },
                  child: CircleAvatar(
                    radius: 16,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.add,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 10),
            if(isLoading)
              Center(
                child: CircularProgressIndicator(
                  strokeWidth: 1,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              )
            else if(errorNote.isNotEmpty)
              Center(
                child: Text(errorNote,
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: "PlayfairDisplay"
                ),
                ),
              )
            else    
            Container(
              height: 580,
              decoration: BoxDecoration(),
              child: ListView.builder(
                itemCount: note_name.length,
                itemBuilder: (BuildContext context, int index ){
                  return Column(
                    children: [
                      Container(
                        height: 70,
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Color(0xFF1A3A6F),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.description,
                              size: 25,
                              color: Colors.white,
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    note_name[index],
                                    style: TextStyle(color: Colors.white),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                  ),
                                  if (isDownloading[index] == true)
                                    Padding(
                                      padding: EdgeInsets.only(top: 4),
                                      child: LinearProgressIndicator(
                                        value: downloadProgress[index],
                                        backgroundColor: Colors.white24,
                                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                            IconButton(
                              onPressed: (){
                                showBottomPopUp(context, note_id[index]);
                              },
                              icon: Icon(
                                Icons.delete,
                                color: Colors.white,
                                
                              ),
                            )                            
                          ],
                        ),
                      ),
                      SizedBox(height: 8),
                    ],
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}



