import 'dart:io';

import 'package:dio/io.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:dio/dio.dart';
import 'package:video_player/video_player.dart';


void main(){
  runApp(video5_1());
}

class video5_1 extends StatelessWidget{
  @override  
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: video5_2(),
    );
  }
}


class video5_2 extends StatefulWidget{
  @override  
  video5_3 createState()=> video5_3();
}

class video5_3 extends State<video5_2>{
  @override  
  Widget build(BuildContext context){
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: videoAppBar(),
        body: TabBarView(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(15, 20, 15, 0),
              child: videoUpload1_1(),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(15, 20, 15, 0),
              child: videoView1_1(),
            )
          ],
        ),
      ),
    );
  }
}

PreferredSizeWidget videoAppBar(){
  return AppBar(
    backgroundColor: Colors.blue,
    bottom: TabBar(
      tabs: [
        Tab(text: "Upload",),
        Tab(text: "View",)
      ],
    ),
  );
}


class videoUpload1_1 extends StatefulWidget{
  @override  
  videoUpload1_2 createState()=> videoUpload1_2();
}

class videoUpload1_2 extends State<videoUpload1_1>{

  XFile? videoUploadedStored;
  ImagePicker pickObject = ImagePicker();
 
  Future<void> requestSelect() async {
    var status1 = await Permission.storage.request();

    if(status1.isPermanentlyDenied){
      openAppSettings();
    }else if(status1.isDenied){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Permission Denied"))
      );
    }
  }

  Future<void> filePick() async{
    await requestSelect();

    final XFile? videoOriginal = await pickObject.pickVideo(
      source: ImageSource.gallery
    );

    if(videoOriginal != null){
      setState(() {
        videoUploadedStored = videoOriginal;
      });
    }

  }

  Future<void> videoUpload() async {
    if(videoUploadedStored == null){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("video not fetched"))
      );
      return;
    }

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
      (dio.httpClientAdapter as IOHttpClientAdapter ).createHttpClient = (){
        HttpClient client = HttpClient();
        client.badCertificateCallback = (X509Certificate cert, String host, int port )=>true;
        return client;
      };

      var urlHttp = "http://192.168.27.102/video_picker_revision/uploadVideo.php";

      FormData fromData = FormData.fromMap({
        "video_file": await MultipartFile.fromFile(videoUploadedStored!.path)
      });

      Response response = await dio.post(
        urlHttp,
        data: fromData
      );

      if(response.statusCode == 200 ){
        print(response.data);
        var dataReceived = response.data;
        print("data receieved: ${dataReceived}");
      }else{
        print("response statuscode is not 200");
      }



    }catch(e){
      if(e is DioException){
        switch(e.type){
          case DioExceptionType.connectionTimeout:
               print("Connection Timeout ${e.message} ");
               break;
          case DioExceptionType.connectionError:
               print("connection Error ${e.message} ");
               break;
          case DioExceptionType.receiveTimeout:
               print("receieve timout ${e.message} "); 
               break;
          case DioExceptionType.badCertificate:
               print("bad certificate ${e.message} ");
               break;
          case DioExceptionType.cancel:
               print("cancel error: ${e.message} ");
               break;
          case DioExceptionType.unknown:
               print("unknown error: ${e.message} ");
               break;
          default:
               print("Unknown error: ${e.message} ");
               break;                             
        }
      }else{
        print(e);
      }
    }

  }



  @override  
  Widget build(BuildContext context ){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: ElevatedButton(
            onPressed: (){
              filePick();
            },
            child: Text("Select Video"),
          ),
        ),
        SizedBox(height: 25,),
        Center(
          child: ElevatedButton(
            onPressed: (){
              videoUpload();
            },
            child: Text("Upload Video",
            ),
          ),
        ),
        SizedBox(height: 25,),
        Center(
          child: ElevatedButton(
            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => playVideo1_1(pathVideo: videoUploadedStored!.path),
                )
              );
            },
            child: Text("Play Video"),
          ),
        )
      ],
    );
  }
}

class playVideo1_1 extends StatefulWidget{

  final String pathVideo;

  playVideo1_1({ required this.pathVideo});
  
  @override  
  playVideo1_2 createState()=> playVideo1_2();
}

class playVideo1_2 extends State<playVideo1_1>{

  late VideoPlayerController controllerVideo;
  late Future<void> initializeVideo;
  

  @override  
  void initState(){
    super.initState();
    Uri videoPath = Uri.parse(widget.pathVideo);
    controllerVideo = VideoPlayerController.networkUrl(videoPath);
    initializeVideo = controllerVideo.initialize();
    controllerVideo.setLooping(false);
  }  

  @override  
  Widget build(BuildContext context ){
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(15, 20, 15, 0),
        child: FutureBuilder(
          future: initializeVideo,
          builder: (BuildContext context,snapshot ){
            if(snapshot.connectionState == ConnectionState.done){
              return Container(
                width: 150,
                height: 150,
                child: AspectRatio(
                  aspectRatio: controllerVideo.value.aspectRatio,
                  child: VideoPlayer(controllerVideo),
                ),
              );
            }else{
              return CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}


class videoView1_1 extends StatefulWidget{
  @override  
  videoView1_2 createState()=> videoView1_2();
}


class videoView1_2 extends State<videoView1_1>{

  List<VideoPlayerController> controllerVideoList = [];
  bool isLoading = true;


  Future<void> videoRetrieve() async {
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
      (dio.httpClientAdapter as IOHttpClientAdapter ).createHttpClient = (){
        HttpClient client = HttpClient();
        client.badCertificateCallback = (X509Certificate cert, String host,int port )=> true;
        return client;
      };

      // var urlFetchVideoDatabase = "http://192.168.162.102/video_picker_revision/retrieveVideo.php";

      // Response response = await dio.get(urlFetchVideoDatabase);
      String DataBase_ManagementVideo = "Database Management_video";
      var urlFetchVideoDatabase = "http://192.168.162.102/project_app/lecture_courVideo.php";
      var dataSend = {
        "Table_name": DataBase_ManagementVideo
      };

      Response response = await dio.post(
        urlFetchVideoDatabase,
        data: FormData.fromMap(dataSend)
      );      

      if(response.statusCode == 200){
        print(response.data);
        var dataFetched = response.data;
        if( dataFetched != null && dataFetched['message'] != null ){
          List<dynamic> videoUrl = dataFetched['message'];
          List<String> videoUrl2 = [];

          for (var urlVideo in videoUrl){
            videoUrl2.add(urlVideo['video_name']);
          }

          if(videoUrl2.isNotEmpty){
            for ( String actualUrl in videoUrl2){
              try{

                final Uri fetchedUri = await Uri.parse(actualUrl);
                if(!fetchedUri.hasScheme || fetchedUri.host.isEmpty){
                  throw Exception("Invalid Url");
                }

                final controller1 = VideoPlayerController.networkUrl(fetchedUri);
                controller1.addListener((){
                  if(controller1.value.hasError){
                    print("${controller1.value.errorDescription}");
                  }
                });

                await controller1.initialize();
                controllerVideoList.add(controller1);
                print("video Initialized well");

                if(mounted){
                  setState(() {
                    controller1.setLooping(true);
                  });
                }

              }catch(e){
                print("$e");
              }

              

            }
          }

        }
      }

    }catch(e){
      if(e is DioException){
        switch(e.type){
          case DioExceptionType.connectionTimeout:
               print("Connection Timeout ${e.message} ");
               break;
          case DioExceptionType.connectionError:
               print("connection Error ${e.message} ");
               break;
          case DioExceptionType.receiveTimeout:
               print("receieve timout ${e.message} "); 
               break;
          case DioExceptionType.badCertificate:
               print("bad certificate ${e.message} ");
               break;
          case DioExceptionType.cancel:
               print("cancel error: ${e.message} ");
               break;
          case DioExceptionType.unknown:
               print("unknown error: ${e.message} ");
               break;
          default:
               print("Unknown error: ${e.message} ");
               break;                             
        }
      }else{
        print(e);
      }      
    }
  }

  @override   
  void initState(){
    super.initState();
    videoRetrieve();
  }

  @override  
  void dispose(){
    for (var delete in controllerVideoList){
      delete.dispose();
    }
    super.dispose();
  }

  @override  
  Widget build(BuildContext context  ){
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: controllerVideoList.length,
            itemBuilder: (BuildContext context, index ){
              final controller2 = controllerVideoList[index];
              return Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 200,
                    child: AspectRatio(
                      aspectRatio: controller2.value.aspectRatio,
                      child: VideoPlayer(controller2),
                    ),
                  ),
                  SizedBox(height: 5,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: (){
                          if(controller2.value.isPlaying){
                            controller2.pause();
                          }else{
                            controller2.play();
                          }
                        },
                        icon: Icon(
                          controller2.value.isPlaying ? Icons.pause : Icons.play_arrow,
                          size: 24,
                        ),
                      )
                    ],
                  ),
                  Divider(
                    color: Colors.red,
                    height: 1,
                  )
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}



