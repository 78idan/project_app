import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:intl/intl.dart';
import "package:permission_handler/permission_handler.dart";
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:project_app/student/student_log/student_weekSignatureScreen.dart';

// void main(){
//   runApp(book_week1_1());
// }


// class book_week1_1 extends StatelessWidget{
//   @override  
//   Widget build(BuildContext context ){
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: book_week1_2(),
//     );
//   }
// }

class book_week1_2 extends StatefulWidget{
  final String IpAddress;
  final String candidate_num;
  final String week;
  final String day;
  book_week1_2({ required this.IpAddress, required this.candidate_num, required this.week, required this.day });
  @override  
  book_week1_3 createState()=> book_week1_3();
}

class book_week1_3 extends State<book_week1_2>{
  @override  
  Widget build(BuildContext context ){
    return Scaffold(
      backgroundColor: Color(0xFF002147),
      appBar: BookWeekAppBar(context, widget.day ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              bookContainer_week1_1(IpAddress: widget.IpAddress, candidate_num: widget.candidate_num, week: widget.week, day: widget.day)
            ],
          ),
        ),
      ),
    );
  }
}


PreferredSizeWidget BookWeekAppBar(BuildContext context, String day ){
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
    title: Text(day,
    style: TextStyle(
      color: Colors.white,
      fontFamily: "PlayfairDisplay",
    ),
    ),
  );
}


class bookContainer_week1_1 extends StatefulWidget{
    final String IpAddress;
  final String candidate_num;
  final String week;
  final String day;
  bookContainer_week1_1({ required this.IpAddress, required this.candidate_num, required this.week, required this.day });  
  @override  
  bookContainer_week1_2 createState()=> bookContainer_week1_2();
}

class bookContainer_week1_2 extends State<bookContainer_week1_1>{
  // String week = "week 2";
  // String day = "weekly";
  // String candidate_num = "22050513090";
  XFile? photoFilePath;
  ImagePicker picturePicker = ImagePicker();
  var  imageUrl = null;
  String? industrialSignatureUrl = null;  
  //start of void function
  void initState(){
    super.initState();
    String RecentDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
    dateController.text = RecentDate;
    retrieveImage();
    fetchingData();
    pictureFunction();
  }
  //end of void function

  //start of fetchingData function
  Future<void> fetchingData()async{
    String candidate_table = widget.candidate_num+"_book";
    try{
      Dio dio = Dio(
        BaseOptions(
          connectTimeout: Duration(seconds: 15),
          receiveTimeout: Duration(seconds: 15)
        )
      );

      var IpAddress = widget.IpAddress;
      var dataSend = {
        "candidate_table":candidate_table,
        "week": widget.week,
        "day": widget.day
      };

      var UrlSend = "http://${IpAddress}/project_app/student_book_retrieve.php";

      Response response = await dio.post(
        UrlSend,
        data: FormData.fromMap(dataSend)
      );

      if(response.statusCode == 200){
        // print("Thank God");
        // print(response.data);
        var dataReceived = response.data;

        if(dataReceived['message'] == "Week found"){
          // print(response.data);
          setState(() {
            activityWeekController.text = dataReceived['activity'];
          });
        }else if(dataReceived['message'] == "week not found" ){
          print("Not found week");
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
  //end of fetchingData function

  //start of function of requestiong permission 
  Future<void> requestPermission() async{
    var status = await Permission.camera.request();
    var statusBig = await Permission.storage.request();
    if(statusBig.isPermanentlyDenied || status.isPermanentlyDenied){
      openAppSettings();
    }else if(statusBig.isDenied || status.isDenied){
      customNotification.notificationCustom(context, message: "Camera or file not allowed");
    }
  } 
  //end of function of requestiong permission 

  //start of function to retrieve image
  Future<void> retrieveImage() async {
    try{
      Dio dio = Dio(
        BaseOptions(
          connectTimeout: Duration(seconds: 15),
          receiveTimeout: Duration(seconds: 15)
        )
      );
      String candidate_table = widget.candidate_num+"_book";
      var IpAdress = widget.IpAddress;
      var sendData = {
        "IpAdress": IpAdress,
        "week": widget.week,
        "day": widget.day,
        "candidate_table": candidate_table
      };

      var UrlSend = "http://${IpAdress}/project_app/student_weekImage.php";

      Response response = await dio.post(
        UrlSend,
        data: FormData.fromMap(sendData)
      );

      if(response.statusCode == 200){
        print("Thank God twice");
        print(response.data);
        var dataReceived = response.data;

        // final Uri dataReceivedUri = await Uri.parse(dataReceived['url']);
        if(dataReceived['message'] == "Photo filled"){
          setState(() {
            imageUrl = dataReceived['url'];
          });
        }else if(dataReceived['message'] == "Photo unfilled"){
          setState(() {
            imageUrl = null;
          });          
        }

      }

    }catch(e){
        if (e is DioException){
          switch(e.type){
            case DioExceptionType.connectionTimeout:
                 print("connection timeout ${e.message} ");
                 break;
            case DioExceptionType.connectionError:
                 print("connection error ${e.message}");
                 break;
            case DioExceptionType.sendTimeout:
                 print("send TimeOut ${e.message} ");
                 break;
            case DioExceptionType.receiveTimeout:
                 print("receive timeOut ${e.message}");
                 break;
            case DioExceptionType.badCertificate:
                 print("bad certificate ${e.message} ");
                 break;
            case DioExceptionType.badResponse:
                 print("bad response ${e.message}  ");
                 break;
            case DioExceptionType.unknown:
                 print("unknown error ${e.toString()} ");
                 break;
            default:
                  print("default error ${e.message} ");
                  break;                                   
          }
        }else{
          print(" Error $e");
        }      
    }
  }
  //end of function to retrieve image



  //start of validating controllers
  Future<void> validatingController() async {
    // print(photoFilePath!.path);
    if(activityWeekController.text.isEmpty){
      customNotification.notificationCustom(context, message: "There is an empty input");
    }else if( photoFilePath?.path == null ){
      customNotification.notificationCustom(context, message: "No media attached");
    }else {
      sendWeeklyData();
    }
  }
  //end of validating controllers  

  //start of sending week data
  Future<void> sendWeeklyData() async {
    try{
      Dio dio = Dio(
        BaseOptions(
          connectTimeout: Duration(seconds: 15),
          receiveTimeout: Duration(seconds: 15)
        )
      );
      String candidate_table = widget.candidate_num+"_book";
      var IpAddress = widget.IpAddress;
      FormData dataSend = FormData.fromMap({
        "image_url": await MultipartFile.fromFile(photoFilePath!.path),
        "week": widget.week,
        "day": widget.day,
        "activityWeek":activityWeekController.text,
        "date_time":dateController.text,
        "candidate_table":candidate_table,        
      });      
      var Urlsend = "http://${IpAddress}/project_app/student_bookWeek.php";
      Response response = await dio.post(
        Urlsend,
        data: dataSend
      );
      if(response.statusCode == 200){
        // print(response.data);

        // print("Thank God");
        // print(photoFilePath!.path);
        // print(response.data);

        var DataReceieved = response.data;

        if(DataReceieved['message'] == "Details Submitted"){
          activityWeekController.clear();
          customNotification.notificationCustom(context, message: "Details Submitted");
          retrieveImage();     
          fetchingData();     
        }else{
          activityWeekController.clear();
          customNotification.notificationCustom(context, message: DataReceieved['message']);
          retrieveImage();
          fetchingData();
        }
      }            
    }catch(e){
    if(e is DioException){
      switch(e.type){
        case DioExceptionType.connectionTimeout:
             print("connection Timeout Error: ${e.message} ");
             break;
        case DioExceptionType.connectionError:
             print("connectionError: ${e.message} ");
             break;
        case DioExceptionType.sendTimeout:
             print("send TimeOut error: ${e.message} ");
             break;
        case DioExceptionType.receiveTimeout:
             print("receieve timeOut: ${e.message} ");
             break;
        case DioExceptionType.cancel:
             print("cancel error: ${e.message} ");
             break;
        case DioExceptionType.unknown:
             print("unknown error: ${e.message} ");
             break;
        default:
             print("default error: ${e.message} ");
             break;                              
      }
    }else{
      print("else eror: $e ");
    }      
    }
  }
  //end of sending week data

  //start of function to pickImageOption
  Future<void> pickImageOption () async{
    try{
      showModalBottomSheet(
        context: context,
        backgroundColor: Color(0xFF1A3A6F),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20))
        ),
        builder: (BuildContext context ){
          return Container(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Image Option",
                style: TextStyle(
                  color: Colors.white
                ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () async {
                        Navigator.of(context).pop();
                        pickImagesource(ImageSource.camera);
                      },
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundColor: Color(0xFF5DADE2),
                            child: Icon(Icons.camera_alt, color: Colors.white70, size: 30),
                          ),
                          SizedBox(height: 8,),
                          Text("Camera", style: TextStyle(color: Colors.white), )
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () async {
                        Navigator.of(context).pop();
                        await pickImagesource(ImageSource.gallery);
                        
                      },
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundColor: Color(0xFF5DADE2),
                            child: Icon(Icons.photo_library,size:  30,color: Colors.white70),
                          ),
                          SizedBox(height: 8,),
                          Text("Gallery",style: TextStyle(color: Colors.white),)
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          );
        }
      );
    }catch(e){
      customNotification.notificationCustom(context, message: "failed to load bottom Sheet");
    }
  }
  //end of function to pickImageOption

  //start of function to pickImageSource
  Future<void> pickImagesource(ImageSource source) async {
    final XFile? imageItself = await picturePicker.pickImage(
      source: source,
      maxHeight: 1800,
      maxWidth: 1800,
      imageQuality: 85
    );

    if(imageItself != null){
      setState(() {
        photoFilePath = imageItself;
      });
    }

    customNotification.notificationCustom(context, message: "Image Selected");

  }
  //end of function to pickImageSource

  //start of removeImage function
  Future<void> removeImage() async {
    setState(() {
      photoFilePath = null;
    });
    customNotification.notificationCustom(context, message: "Image removed");
  }
  //end of removeImage function  

  //signature functions 

  //start of checking signature function
  Future<void> checkingUploading() async {
    String candidate_table = widget.candidate_num+"_book";
    // String sign = "sign";
    try{
      Dio dio = Dio(
        BaseOptions(
          connectTimeout: Duration(seconds: 15),
          receiveTimeout: Duration(seconds: 15)
        )
      );
      var IpAddress = widget.IpAddress;
      var dataSend = {
        "candidate_table": candidate_table,
        "week": widget.week,
        "day": widget.day,
      };

      var UrlSend = "http://${IpAddress}/project_app/student_book_checkUpload.php";

      Response response = await dio.post(
        UrlSend,
        data: FormData.fromMap(dataSend)
      );

      if(response.statusCode == 200){
        // print(response.data);
        // print("Thank God");
        var DataRecieved = response.data;
        if(DataRecieved['message'] == "Please fill Activiy"){
          customNotification.notificationCustom(context, message: "Please fill Activiy");
        }else{
          if(industrialSignatureUrl == null){
            // print("Thank God first then Go");
            final result = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context)=>SignatureScreen(IpAddress: IpAddress, candidate_table: candidate_table, week: widget.week, day: widget.day)
              )
            );

            if(result == true){
              await pictureFunction();
            }            
          }else{
            customNotification.notificationCustom(context, message: "Already Uploaded");
          }
        }
      }


    }catch(e){
    if(e is DioException){
      switch(e.type){
        case DioExceptionType.connectionTimeout:
             print("connection Timeout Error: ${e.message} ");
             break;
        case DioExceptionType.connectionError:
             print("connectionError: ${e.message} ");
             break;
        case DioExceptionType.sendTimeout:
             print("send TimeOut error: ${e.message} ");
             break;
        case DioExceptionType.receiveTimeout:
             print("receieve timeOut: ${e.message} ");
             break;
        case DioExceptionType.cancel:
             print("cancel error: ${e.message} ");
             break;
        case DioExceptionType.unknown:
             print("unknown error: ${e.message} ");
             break;
        default:
             print("default error: ${e.message} ");
             break;                              
      }
    }else{
      print("else eror: $e ");
    }       
    }
  }
  //end of checking signature function


  // start of signature picture
  Future<void> pictureFunction() async {
    String candidate_table = widget.candidate_num+"_book";
    try{
      Dio dio = Dio(
        BaseOptions(
          connectTimeout: Duration(seconds: 15),
          receiveTimeout: Duration(seconds: 15)
        )
      );
      var IpAddress = widget.IpAddress;
      var dataSend = {
        "IpAddress": IpAddress,
        "week": widget.week,
        "day": widget.day,
        "candidate_table": candidate_table
      };

      var Urlsend = "http://${IpAddress}/project_app/student_weekBook_open.php";

      Response response = await dio.post(
        Urlsend,
        data: FormData.fromMap(dataSend)
      );

      if(response.statusCode == 200){
        print("Raw response: ${response.data}");
        if(response.data['message'] == "Empty Photo"){
          setState(() {
            industrialSignatureUrl = null;
          });
        }else{
        // Parse the response to extract the URL
          if(response.data != null) {
            String responseString = response.data.toString();
            print("Response string: $responseString");
            
            // Try different parsing methods
            String? extractedUrl;
            
            // Method 1: Extract from {message: URL} format
            if(responseString.contains('message:')) {
              RegExp urlRegex = RegExp(r'message:\s*(http[^}]+)');
              Match? match = urlRegex.firstMatch(responseString);
              if(match != null) {
                extractedUrl = match.group(1)?.trim();
              }
            }
            
            // Method 2: If it's just a plain URL string
            if(extractedUrl == null && responseString.startsWith('http')) {
              extractedUrl = responseString.trim();
            }
            
            // Method 3: Try to find any http URL in the response
            if(extractedUrl == null) {
              RegExp httpRegex = RegExp(r'(https?://[^\s\}]+)');
              Match? match = httpRegex.firstMatch(responseString);
              if(match != null) {
                extractedUrl = match.group(1)?.trim();
              }
            }
            
            print("Extracted URL: $extractedUrl");
            
            if(extractedUrl != null && extractedUrl.isNotEmpty) {
              setState(() {
                industrialSignatureUrl = extractedUrl;
              });
              print("URL set to state: $industrialSignatureUrl");
            } else {
              print("No valid URL found in response");
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
  // end of function picture


  GlobalKey keyBook = GlobalKey<FormState>();
  TextEditingController dateController = TextEditingController();
  TextEditingController activityWeekController = TextEditingController();
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
                          controller: activityWeekController,
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
                  onTap: () async {
                    // Handle your upload logic here
                    // print("Thanks God");
                    if(imageUrl != null){
                      print("Thank God thrice");
                    }else{
                      if(photoFilePath == null){
                        await requestPermission();
                        await pickImageOption();
                      }else{
                        showModalBottomSheet(
                          context: context,
                          backgroundColor: Color(0xFF1A3A6F),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(top: Radius.circular(20))
                          ),
                          builder: (BuildContext context ){
                            return Container(
                              padding: EdgeInsets.all(20),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text("Options",style: TextStyle(color: Colors.white),),
                                  SizedBox(height: 10,),
                                  ListTile(
                                    leading: Icon(Icons.replay, color: Colors.white,),
                                    title: Text("Replace the picture",style: TextStyle(color: Colors.white),),
                                    onTap: () async {
                                      Navigator.of(context).pop();
                                      await pickImageOption();
                                    },
                                  ),
                                  SizedBox(height: 7,),
                                  ListTile(
                                    leading: Icon(Icons.delete,color: Colors.white,),
                                    title: Text("Remove the image",style: TextStyle(color: Colors.white)),
                                    onTap: () async {
                                      Navigator.of(context).pop();
                                      await  removeImage();
                                    },
                                  ),
                                ],
                              ),
                            );
                          }
                        );
                      }
                    }
                  },
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: 300,
                      minHeight: 300,
                    ),
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Color(0xFF1A3A6F),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child:
                      photoFilePath != null 
                      ? Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.file(
                              File(photoFilePath!.path),
                              height: 300,
                              width: double.infinity,
                              fit: BoxFit.fill,
                            ),
                          )
                        ],
                      )
                      : imageUrl != null  
                       ?Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              imageUrl,
                              height: 300,
                              width: double.infinity,
                              fit: BoxFit.fill
                            ),
                          )
                        ],
                      )
                                            
                      : Center(
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
                ),
                SizedBox(height: 8,),                
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
                  behavior: HitTestBehavior.opaque,
                  onTap: () async {
                    // print("Industrial supervisor");
                    // if(industrialSignatureUrl == null){
                    //   final result = await Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //       builder: (context)=>SignatureScreen()
                    //     )
                    //   );

                    //   if(result == true){
                    //     await pictureFunction();
                    //   }

                    // }else{
                    //   print("Thank God");
                    // }
                    checkingUploading();
                    // print("Thank God");
                  },
                  child: Container(
                    height: 110,
                    width: double.infinity, // Increased height to accommodate signature
                    child: industrialSignatureUrl != null 
                      ? Container(
                          decoration: BoxDecoration(
                            color: Color(0xFF1A3A6F),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: EdgeInsets.all(4),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              industrialSignatureUrl!,
                              fit: BoxFit.fill,
                              // width: 280,
                              // height: 50,
                              headers: {
                                'User-Agent': 'Flutter App',
                              },
                              loadingBuilder: (context, child, loadingProgress) {
                                if (loadingProgress == null) return child;
                                return Container(
                                  color: Color(0xFF1A3A6F),
                                  child: Center(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        CircularProgressIndicator(
                                          color: Colors.white,
                                          strokeWidth: 2,
                                        ),
                                        SizedBox(height: 8),
                                        Text(
                                          'Loading signature...',
                                          style: TextStyle(
                                            color: Colors.white70,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                              errorBuilder: (context, error, stackTrace) {
                                print("Image error: $error");
                                print("Failed URL: $industrialSignatureUrl");
                                return Container(
                                  decoration: BoxDecoration(
                                    color: Color(0xFF1A3A6F),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  alignment: Alignment.center,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.error_outline,
                                        color: Colors.red[300],
                                        size: 20,
                                      ),
                                      SizedBox(height: 4),
                                      Text(
                                        'Image load failed',
                                        style: TextStyle(
                                          color: Colors.red[300],
                                          fontSize: 10,
                                        ),
                                      ),
                                      SizedBox(height: 2),
                                      Text(
                                        'Tap to retry',
                                        style: TextStyle(
                                          color: Colors.white70,
                                          fontSize: 8,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        )
                      : // FIXED: Use Text widget instead of TextFormField for better display
                        Container(
                          decoration: BoxDecoration(
                            color: Color(0xFF1A3A6F),
                            borderRadius: BorderRadius.circular(10)
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(16),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    "Industrial Supervisor Signature",
                                    style: TextStyle(
                                      color: Colors.white70,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                Icon(
                                  Icons.draw,
                                  color: Colors.grey[400],
                                )
                              ],
                            ),
                          ),
                        )
                  ),
                ),
                SizedBox(height: 35,),
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








