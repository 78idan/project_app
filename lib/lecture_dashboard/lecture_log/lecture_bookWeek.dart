import 'package:flutter/material.dart';
import "package:dio/dio.dart";
import 'package:project_app/lecture_dashboard/lecture_log/lecture_weekSignatureScreen.dart';


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
  final String IpAddress;
  final String candidate_num;
  final String week;
  final String day;
  lecture_book_week1_2({ required this.IpAddress, required this.candidate_num, required this.week, required this.day });
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
              lecture_bookContainer_week1_1(IpAddress: widget.IpAddress, candidate_num: widget.candidate_num, week: widget.week, day: widget.day)
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


class lecture_bookContainer_week1_1 extends StatefulWidget{  final String IpAddress;
  final String candidate_num;
  final String week;
  final String day;
  lecture_bookContainer_week1_1({ required this.IpAddress, required this.candidate_num, required this.week, required this.day });

  @override  
  lecture_bookContainer_week1_2 createState()=> lecture_bookContainer_week1_2();
}

class lecture_bookContainer_week1_2 extends State<lecture_bookContainer_week1_1>{
  String? industrialSignatureUrl = null;
  String? collegeSignatureUrl = null;
  var  imageUrl = null;
  // String week = "week 2";
  // String day = "weekly";
  // String candidate_num = "22050513090";  
  GlobalKey keyBook = GlobalKey<FormState>();
  TextEditingController dateController = TextEditingController();
  TextEditingController activityWeekController = TextEditingController();

  //start of void function
  void initState(){
    super.initState();
    retrieveImage();
    retrievingData();
    pictureFunction();
    pictureCollegeFunction();
  }
  //end of void function


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



  //start of the function retrievingdata
  Future<void> retrievingData() async {
    String candidate_table = widget.candidate_num+"_book";
    try{
      Dio dio = Dio(
        BaseOptions(
          connectTimeout: Duration(seconds: 15),
          receiveTimeout: Duration(seconds: 15)
        )
      );

      var IpAddress = widget.IpAddress;
      var SendingData = {
        "week": widget.week,
        "day": widget.day,
        "candidate_table":candidate_table
      };
      var UrlSend = "http://${IpAddress}/project_app/lecture_book.php";

      Response response = await dio.post(
        UrlSend,
        data: FormData.fromMap(SendingData)
      );

      if(response.statusCode == 200){
        // print(response.data);
        var DataReceived = response.data;
        setState(() {
          dateController.text = DataReceived['date_time'];
          activityWeekController.text = DataReceived['activity'];
        });
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
  //end of the function retrievingdata

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

      var UrlSend = "http://${IpAddress}/project_app/lecture_book_checkUpload.php";

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
          if(collegeSignatureUrl == null){
            // print("Thank God first then Go");
            final result = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context)=>SignatureScreen(IpAddress: IpAddress, candidate_table: candidate_table, week: widget.week, day: widget.day)
              )
            );

            if(result == true){
              await pictureCollegeFunction();
            }            
          }else{
            customNotification.notificationCustom(context, message: "Already Uploaded");
          }
          // print("Thank God alot");
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


  // start of college signature picture
  Future<void> pictureCollegeFunction() async {
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

      var Urlsend = "http://${IpAddress}/project_app/lecture_book_open.php";

      Response response = await dio.post(
        Urlsend,
        data: FormData.fromMap(dataSend)
      );

      if(response.statusCode == 200){
        print("Raw response: ${response.data}");
        if(response.data['message'] == "Empty Photo"){
          setState(() {
            collegeSignatureUrl = null;
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
                collegeSignatureUrl = extractedUrl;
              });
              print("URL set to state: $collegeSignatureUrl");
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
  // end of college function picture



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
                SizedBox(height: 10,),
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
                      imageUrl != null  
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
                
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Industrial Supervisor Verification",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
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
                    // checkingUploading();
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
                SizedBox(height: 5,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("College Supervisor Verification",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
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
                    child: collegeSignatureUrl != null 
                      ? Container(
                          decoration: BoxDecoration(
                            color: Color(0xFF1A3A6F),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: EdgeInsets.all(4),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              collegeSignatureUrl!,
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
                                print("Failed URL: $collegeSignatureUrl");
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
                                    "College Supervisor Signature",
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
                SizedBox(height: 45,),
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
