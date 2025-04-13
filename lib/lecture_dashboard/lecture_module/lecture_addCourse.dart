import 'dart:io';

import 'package:dio/io.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dio/dio.dart';



void main(){
  runApp(
    lecture_addCourse1_1()
  );
}

class lecture_addCourse1_1 extends StatelessWidget{
  @override  
  Widget build(BuildContext context ){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: lecture_addCourse1_2(),
    );
  }
}



class lecture_addCourse1_2 extends StatefulWidget{
  @override  
  lecture_addCourse1_3 createState()=> lecture_addCourse1_3();
}


class lecture_addCourse1_3 extends State<lecture_addCourse1_2>{
  @override  
  Widget build(BuildContext context ){
    return Scaffold(
      backgroundColor: Color(0xFF002147),
      appBar: lecture_addCourseAppBar(context),
      body: Padding(
        padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              lecture_addCourseTextField1_1()
            ],
          ),
        ),
      ),
    );
  }
}

PreferredSizeWidget lecture_addCourseAppBar(BuildContext context){
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


class lecture_addCourseTextField1_1 extends StatefulWidget{
  lecture_addCourseTextField1_1();  
  @override  
  lecture_addCourseTextField1_2 createState()=> lecture_addCourseTextField1_2();
}

class lecture_addCourseTextField1_2 extends State<lecture_addCourseTextField1_1>{
  // String? regionValue;
  // String? courseValue;
  // String? levelValue;
  // List<String> regionList = ['Arusha',"Manyara","Kigoma","Dar Es Salaam","Singida","Dododma"];
  // List<String> courseList = ["Computer Science","Information Technology"];
  // List<String> levelList = ["Level 4","Level 5","Level 6","Level 7-1","Level 7-2","Level 8"];
  final keyCourse = GlobalKey<FormState>();
  TextEditingController attachVideo = TextEditingController();
  TextEditingController descriptionVideo = TextEditingController();
  TextEditingController tutorialVideoNum = TextEditingController();
  XFile? videoFetchingActual;

  // start of initstate function
  @override  
  void initState(){
    super.initState();
    attachVideo.text = "";
  }
  // end of init state function
  
  ImagePicker videoFilePathActual = ImagePicker();
  String table_name = "Database Management_video";

//start of validation function
Future<void> validatelecture_addCourse() async {
  if(attachVideo.text.isEmpty){
     customNotification.notificationCustom(context, message: "attach video empty");
  }else if(descriptionVideo.text.isEmpty){
     customNotification.notificationCustom(context, message: "Description video empty");
  }else if(tutorialVideoNum.text.isEmpty){
     customNotification.notificationCustom(context, message: "tutorial video empty");
  }else {
    // print("Hello");
    uploadingVideoCredentials();
  }
} 
//end of validation function

//start function of permission Handler
Future<void> requestVideoPermission() async{
  var status = await Permission.storage.request();
  if(status.isPermanentlyDenied){
    openAppSettings();
  }else if(status.isDenied){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Storage permission Denied"))
    );
  }
}
//end function of permission Handler


//start function of retrieveing video from phone

Future<void> retrievingVideoPath() async {
  requestVideoPermission();

  final XFile? videoPath = await videoFilePathActual.pickVideo(
    source: ImageSource.gallery
  );

  if(videoPath != null){
    setState(() {
      videoFetchingActual = videoPath;
      attachVideo.text = videoPath.path;
    });
  }

}

//end function of retrieveing video from phone


//start function of uploading a video plus it other credentials

Future<void> uploadingVideoCredentials() async {
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
    (dio.httpClientAdapter as IOHttpClientAdapter).createHttpClient = (){
      HttpClient client = HttpClient();
      client.badCertificateCallback = (X509Certificate cert, String host,int port)=>true;
      return client;
    };

    var url = "http://192.168.162.102/project_app/lecture_addCourse.php";

    FormData inputData = FormData.fromMap({
      "video_desc": descriptionVideo.text,
      "video_tuto": tutorialVideoNum.text,
      "video_path": await MultipartFile.fromFile(videoFetchingActual!.path),
      "table_name": table_name
    });

    Response response = await dio.post(
      url,
      data: inputData
    );

    if(response.statusCode == 200){
      // print(response.data);
      var dataReceived = response.data;
      if(dataReceived['message']=="Video uploaded successfully!"){
        customNotification.notificationCustom(context, message: "Uploaded",picIcon: Icon(Icons.check,color: Colors.white,size: 14,));
        attachVideo.clear();
        descriptionVideo.clear();
        tutorialVideoNum.clear();
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

//end function of uploading a video plus it other credentials 


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
            key: keyCourse,
            child: Column(
              children: [                                                                                           
                SizedBox(height: 10,),
                TextFormField(
                  controller: attachVideo,
                  readOnly: true,
                  onTap: (){
                    // print("Thank God twice ");
                    retrievingVideoPath();
                  },
                  style: TextStyle(
                    color: Colors.white
                  ),
                  decoration: InputDecoration(
                    hintText: "Attach Video",
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
                      Icons.attach_file_outlined,
                      color: Colors.grey[400],
                    )
                  ),
                ),  
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
                          controller: descriptionVideo,
                          maxLines: null,
                          expands: true,
                          keyboardType: TextInputType.multiline,
                          textAlignVertical: TextAlignVertical.top,
                          style: TextStyle(
                            color: Colors.white
                          ),
                          decoration: InputDecoration(
                            hintText: "Description of video",
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
                  controller: tutorialVideoNum,
                  style: TextStyle(
                    color: Colors.white
                  ),
                  decoration: InputDecoration(
                    hintText: "@ eg tutorial 1 ",
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




