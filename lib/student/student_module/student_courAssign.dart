import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:project_app/student/student_module/student_answer.dart';
import 'package:dio/dio.dart';
import 'package:project_app/student/student_module/view/student_view.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import "dart:io";
import 'package:permission_handler/permission_handler.dart';
// void main(){
//   runApp(
//     student_courAssign1_1()
//   );
// }

// class student_courAssign1_1 extends StatelessWidget{
//   @override  
//   Widget build(BuildContext context ){
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: student_courAssign1_2(),
//     );
//   }
// }



class student_courAssign1_2 extends StatefulWidget{
  final String module_name;
  final String IpAddress;
  final String candidee_num;
  final String candidee_level;
  student_courAssign1_2({required this.module_name, required this.IpAddress, required this.candidee_num, required this.candidee_level});
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
              child: course_video1_1(module_name: widget.module_name, IpAddress: widget.IpAddress),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
              child: course_assignment1_1(module_name: widget.module_name, IpAddress: widget.IpAddress,candidee_num: widget.candidee_num,candidee_level: widget.candidee_level,),
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
  final String module_name;
  final String IpAddress;
  course_video1_1({ required this.module_name,required this.IpAddress });  
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
  Map<String, double> downloadProgress = {};
  Map<String, bool> downloadComplete = {};  
  //start of variable of special cases that have filled the parameterers of student_viewVideo1_2() function
  String table_name2 = "";
  String IpAddress = "192.168.108.102";
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
    _loadDownloadStatus();

  }


Future<void> _downloadVideo(String videoUrl, String videoId) async {
  // Required imports:
  // import 'package:path_provider/path_provider.dart';
  // import 'dart:io';
  // import 'package:permission_handler/permission_handler.dart';
  
  // Request storage permissions first (required for Android)
  if (Platform.isAndroid) {
    var status = await Permission.storage.request();
    if (!status.isGranted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Storage permission required to download videos'))
      );
      return;
    }
  }

  // Get downloads directory path
  Directory? downloadsDir;
  if (Platform.isAndroid) {
    // Use public Downloads folder for Android
    downloadsDir = Directory('/storage/emulated/0/Download');
    // Make sure the directory exists
    if (!await downloadsDir.exists()) {
      // Fallback to app's external storage if Downloads isn't accessible
      downloadsDir = await getExternalStorageDirectory();
    }
  } else if (Platform.isIOS) {
    // iOS doesn't allow access to system downloads folder
    // Use app's documents directory instead
    downloadsDir = await getApplicationDocumentsDirectory();
  }

  if (downloadsDir == null) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Could not access downloads directory'))
    );
    return;
  }

  // Create a more user-friendly filename with timestamp
  String filename = 'course_video_${videoId}_${DateTime.now().millisecondsSinceEpoch}.mp4';
  final savePath = '${downloadsDir.path}/$filename';
  
  // Check if file already exists
  final file = File(savePath);
  if (await file.exists()) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Video already downloaded'))
    );
    return;
  }
  
  try {
    setState(() {
      downloadProgress[videoId] = 0;
      downloadComplete[videoId] = false;
    });
    
    // Show download starting message
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Download starting...'))
    );
    
    // You're already using Dio, so we can use it for downloads
    await Dio().download(
      videoUrl,
      savePath,
      onReceiveProgress: (received, total) {
        if (total != -1) {
          setState(() {
            downloadProgress[videoId] = received / total;
          });
        }
      },
    );
    
    setState(() {
      downloadComplete[videoId] = true;
    });
    
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Video downloaded to Downloads folder'),
        action: SnackBarAction(
          label: 'OK',
          onPressed: () {},
        ),
      )
    );
    
    // Save download status for persistence across app restarts
    _saveDownloadStatus();
  } catch (e) {
    print('Download error: $e');
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Download failed: ${e.toString()}'))
    );
  }
}


Future<void> _saveDownloadStatus() async {
  // Add these imports at the top of your file
  // import 'dart:convert';
  // import 'package:shared_preferences/shared_preferences.dart';
  
  final prefs = await SharedPreferences.getInstance();
  final downloadStatus = Map<String, bool>.from(downloadComplete);
  await prefs.setString('downloadStatus', jsonEncode(downloadStatus));
}


Future<void> _loadDownloadStatus() async {
  final prefs = await SharedPreferences.getInstance();
  final downloadStatusJson = prefs.getString('downloadStatus');
  
  if (downloadStatusJson != null) {
    final Map<String, dynamic> loadedStatus = jsonDecode(downloadStatusJson);
    setState(() {
      downloadComplete = Map<String, bool>.from(loadedStatus);
    });
    
    // Verify files actually exist
    _verifyDownloadedFiles();
  }
}

Future<void> _verifyDownloadedFiles() async {
  final appDir = await getApplicationDocumentsDirectory();
  
  for (final videoId in downloadComplete.keys.toList()) {
    final file = File('${appDir.path}/$videoId.mp4');
    if (!await file.exists()) {
      setState(() {
        downloadComplete[videoId] = false;
      });
    }
  }
  
  _saveDownloadStatus();
}


    //start of function to retrieve the video according to module name
    Future<void> retrieveVideo() async{
      String module_name = widget.module_name+"_video";
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
        var IpAddress = widget.IpAddress ;
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
                                    ),
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
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width * 0.39,
                                    ),
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
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width * 0.3,
                                    ),
                                    GestureDetector(
                                      onTap: (){
                                        // print("Thank God");
                                        _downloadVideo(videoName2[index], video_id[index].toString());
                                      },
                                      child: Container(
                                        height: 35,
                                        width: 35,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          color: Colors.red
                                        ),
                                        child: Icon(
                                          Icons.download,
                                          color: Colors.white,
                                          size: 21,
                                        ),
                                      ),
                                    )
                                  ],
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
  final String module_name;
  final String IpAddress;
  final String candidee_num;
  final String candidee_level;
  course_assignment1_1({ required this.module_name, required this.IpAddress, required this.candidee_num, required this.candidee_level });  
  @override  
  course_assignment1_2 createState()=> course_assignment1_2();
}

class course_assignment1_2 extends State<course_assignment1_1>{
  List<dynamic> database_table = [];
  List<dynamic> question_note = [];
  List<dynamic> lecture_name = [];
  // var IpAddress = "192.168.108.102";
  String errorText = "";
  bool isLoading = false;

  //start of initState
  @override  
  void initState(){
    super.initState();
    retrieveQuestion();
  }
  //end of initState

  //start of function of retrieve question table
  Future<void> retrieveQuestion() async {
    setState(() {
      isLoading = true;
      errorText = "";
    });
    String module_name = widget.module_name+"_qu";
    String actual_module = widget.module_name;
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
      var sendDataUrl = "http://${IpAddress}/project_app/student_Assign.php";
      var dataSend = {
        "table_name": module_name,
        "actual_module": actual_module
      };

      Response response = await dio.post(
        sendDataUrl,
        data: FormData.fromMap(dataSend)
      );

      if(response.statusCode == 200){
        // print(response.data);
        setState(() {
          isLoading = false;
          errorText = "";
        });
        var dataRecieved = response.data;
        if(dataRecieved['message'] == "No Question Uploaded"){
          setState(() {
            errorText = "No Question Uploaded";
          });
        }else{
          var ReceivedData = dataRecieved['message'];
          setState(() {
            for(var ReceivedData2 in ReceivedData ){
              database_table.add(ReceivedData2['database_table']);
              question_note.add(ReceivedData2['question_note']);
              lecture_name.add(ReceivedData2['lecture_name']);
            }
          });
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
  //end of function of retrieve question table 

  @override  
  Widget build(BuildContext context){
    return RefreshIndicator(
      onRefresh: () async {
        database_table.clear();
        question_note.clear();
        lecture_name.clear();

        await retrieveQuestion();
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
            SizedBox(
              height: 10,
            ),
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
                  itemCount: database_table.length,
                  itemBuilder: ( BuildContext context,  int index ) {
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
                                        child: Text(lecture_name[index],
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
                                              builder: (context)=> student_Assign1_2(dataBase_table: database_table[index], question_note: question_note[index], candidee_num: widget.candidee_num, candidee_level: widget.candidee_level,IpAddress: widget.IpAddress,)
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



