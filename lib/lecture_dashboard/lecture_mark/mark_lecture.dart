import 'package:flutter/material.dart';
import "package:dio/dio.dart";
import 'package:path_provider/path_provider.dart';
import "dart:io";
import 'package:permission_handler/permission_handler.dart';


// void main(){
//   runApp(
//     markLecture1_1()
//   );
// }


// class markLecture1_1 extends StatelessWidget{
//   @override  
//   Widget build(BuildContext context ){
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: markLecture1_2(),
//     );
//   }
// }

class markLecture1_2 extends StatefulWidget{
  final String IpAddress;
  final String candidate_num;
  markLecture1_2({ required this.IpAddress, required this.candidate_num });
  @override  
  markLecture1_3 createState()=> markLecture1_3();
}


class markLecture1_3 extends State<markLecture1_2>{
  @override  
  Widget build(BuildContext context ){
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Color(0xFF002147),
        appBar: markLectureAppBar(context),
        body: TabBarView(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    technicalReportTextField1_1(IpAddress: widget.IpAddress, candidate_num: widget.candidate_num)
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    collegeSupervisorTextField1_1(IpAddress: widget.IpAddress, candidate_num: widget.candidate_num)
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    industrySupervisorTextField1_1(IpAddress: widget.IpAddress, candidate_num: widget.candidate_num)
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    markerSupervisorTextField1_1(IpAddress: widget.IpAddress, candidate_num: widget.candidate_num)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

PreferredSizeWidget markLectureAppBar(BuildContext context){
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
    bottom: TabBar(
      dividerColor: Color(0xFF002147),
      indicatorSize: TabBarIndicatorSize.label,
      labelStyle: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.white,
        fontFamily: "PlayfairDisplay"
      ),
      unselectedLabelStyle: TextStyle(
        fontFamily: "PlayfairDisplay",
        fontSize: 16,
        fontWeight: FontWeight.normal,
        color: Colors.white70
      ),
      indicatorColor: Colors.white,
      labelColor: Colors.white,
      tabs: [
        Tab(text: "Report",),
        Tab(text: "College",),
        Tab(text: "Industry",),
        Tab(text: "Marker",),
      ],
    ),
  );
}

class technicalReportTextField1_1 extends StatefulWidget{
  final String IpAddress;
  final String candidate_num;
  technicalReportTextField1_1({ required this.IpAddress, required this.candidate_num });  
  @override  
  technicalReportTextField1_2 createState()=> technicalReportTextField1_2();
}

class technicalReportTextField1_2 extends State<technicalReportTextField1_1>{
  List<dynamic> technical_report = [];
  List<dynamic> technical_path= [];
  List<dynamic> technical_id= [];    
  String errorNote = "";
  bool isLoading = false;

  // Add these variables for download tracking
  Map<int, bool> isDownloading = {};
  Map<int, double> downloadProgress = {};

  //start of void initState function
  @override
  void initState(){
    super.initState();
    selectNotes();
  }
  //end of void initState function



  // Download function
  Future<void> downloadFile(String url, String fileName, int index) async {
    try {
      // Request storage permission
      var status = await Permission.storage.request();
      if (status != PermissionStatus.granted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Storage permission denied')),
        );
        return;
      }

      setState(() {
        isDownloading[index] = true;
        downloadProgress[index] = 0.0;
      });

      Dio dio = Dio();
      
      // Get the Downloads directory
      Directory? downloadsDirectory;
      if (Platform.isAndroid) {
        downloadsDirectory = Directory('/storage/emulated/0/Download');
        if (!await downloadsDirectory.exists()) {
          downloadsDirectory = await getExternalStorageDirectory();
        }
      } else {
        downloadsDirectory = await getApplicationDocumentsDirectory();
      }

      String filePath = '${downloadsDirectory!.path}/$fileName';

      await dio.download(
        url,
        filePath,
        onReceiveProgress: (received, total) {
          if (total != -1) {
            setState(() {
              downloadProgress[index] = received / total;
            });
          }
        },
      );

      setState(() {
        isDownloading[index] = false;
        downloadProgress[index] = 0.0;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Downloaded: $fileName'),
          backgroundColor: Colors.green,
        ),
      );

    } catch (e) {
      setState(() {
        isDownloading[index] = false;
        downloadProgress[index] = 0.0;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Download failed: $e'),
          backgroundColor: Colors.red,
        ),
      );
      print('Download error: $e');
    }
  }



  //start selectNotes function
  Future<void> selectNotes() async {
    setState(() {
      isLoading = true;
    });
    String Table_name = widget.candidate_num+"_report";
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

      var UrlSend = "http://${IpAddress}/project_app/retrieveTechnical_report.php";

      Response response = await dio.post(
        UrlSend,
        data:  dataSend
      );

      if(response.statusCode == 200){
        // print(response.data);
        var dataReceived = response.data;
        if(dataReceived['message'] == "report empty"){
          setState(() {
            errorNote = "report empty";
          });
        }else{
          var technicalFile = dataReceived['note'];
          setState(() {
            errorNote = "";
            for (var technicalFile2 in technicalFile){
              technical_report.add(technicalFile2['technical_report']);
              technical_path.add(technicalFile2['technical_path']);
              technical_id.add(technicalFile2['technical_id']);
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
  //end selectNotes function

  @override  
  Widget build(BuildContext context){
    return RefreshIndicator(
      onRefresh: () async {
        technical_report.clear();
        technical_path.clear();
        technical_id.clear();
        await selectNotes();
      },
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: AlwaysScrollableScrollPhysics(),
        child: Column(
          children: [
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
                itemCount: technical_report.length,
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
                                    technical_report[index],
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
                              onPressed: isDownloading[index] == true 
                                ? null 
                                : () {
                                    downloadFile(
                                      technical_path[index], 
                                      technical_report[index], 
                                      index
                                    );
                                  },
                              icon: Icon(
                                isDownloading[index] == true 
                                  ? Icons.downloading 
                                  : Icons.download,
                                color: isDownloading[index] == true 
                                  ? Colors.white54 
                                  : Colors.white,
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

class collegeSupervisorTextField1_1 extends StatefulWidget{
  final String IpAddress;
  final String candidate_num;
  collegeSupervisorTextField1_1({ required this.IpAddress, required this.candidate_num });  
  @override  
  collegeSupervisorTextField1_2 createState()=> collegeSupervisorTextField1_2();
}

class collegeSupervisorTextField1_2 extends State<collegeSupervisorTextField1_1>{

  GlobalKey keyCollege = GlobalKey<FormState>();
  TextEditingController dailyWeeklyController = TextEditingController();
  TextEditingController collegeSupervisorController = TextEditingController();
  String emptyMessage = "";
  String? collegeSupervisorSignatureUrl = null;


  //start of void initState function
  @override 
  void initState(){
    super.initState();
    retrievingData();
    pictureSupervisorCollegeFunction();
  }
  //end of void initState function


  // start of college supervisor function picture
  Future<void> pictureSupervisorCollegeFunction() async {
    String candidate_table = widget.candidate_num+"_college";
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
        "candidate_table": candidate_table
      };

      var Urlsend = "http://${IpAddress}/project_app/lectureSupervisor_open.php";

      Response response = await dio.post(
        Urlsend,
        data: FormData.fromMap(dataSend)
      );

      if(response.statusCode == 200){
        print("Raw response: ${response.data}");
        if(response.data['message'] == "Empty Photo"){
          setState(() {
            collegeSupervisorSignatureUrl = null;
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
                collegeSupervisorSignatureUrl = extractedUrl;
              });
              print("URL set to state: $collegeSupervisorSignatureUrl");
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
  // start of college supervisor function picture

  //start of retrievingData function
  Future<void> retrievingData() async {
    setState(() {
      emptyMessage = "";
    });
    String Table_name = widget.candidate_num+"_college";
    try{
      Dio dio = Dio(
        BaseOptions(
          connectTimeout: Duration(seconds: 15),
          receiveTimeout: Duration(seconds: 15),
        )
      );

      var IpAddress = widget.IpAddress;

      var dataSend = {
        "Table_name": Table_name
      };

      var UrlSend = "http://${IpAddress}/project_app/collegSupervisor_marks.php";

      Response response = await dio.post(
        UrlSend,
        data: FormData.fromMap(dataSend)
      );

      if(response.statusCode == 200){
        // print("Thank God");
        // print(response.data);
        var dataReceived = response.data;
        if(dataReceived['message'] == "Empty records"){
          setState(() {
            emptyMessage = "Empty records";
          });
        }else{
          setState(() {
            dailyWeeklyController.text = dataReceived['log_score'];
            collegeSupervisorController.text = double.parse(dataReceived['collegeSupervisorMarks'].toString()).toStringAsFixed(1);
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
  //end of retrievingData function

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
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          if(emptyMessage.isNotEmpty)
            Center(
              child: Text(emptyMessage,
              style: TextStyle(
                color: Colors.white,
                fontFamily: "PlayfairDisplay"
              ),
              ),
            )
          else  
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 35,
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.engineering,
                  size: 45,
                ),
              )
            ],
          ),
          SizedBox(height: 15,),
          Form(
            key: keyCollege,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Daily and Weekly score",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: "PlayfairDisplay",
                  fontSize: 15
                ),
                ),
                TextFormField(
                  controller: dailyWeeklyController,
                  style: TextStyle(
                    color: Colors.white
                  ),
                  readOnly: true,
                  decoration: InputDecoration(
                    hintText: "Daily and weekly score",
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
                      Icons.grading,
                      color: Colors.grey[400],
                    )
                  ),
                ),  
                SizedBox(height: 10,),
                Text("College supervisor score",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: "PlayfairDisplay",
                  fontSize: 15
                ),
                ),
                TextFormField(
                  controller: collegeSupervisorController,
                  style: TextStyle(
                    color: Colors.white
                  ),
                  readOnly: true,
                  decoration: InputDecoration(
                    hintText: "college supervisor score",
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
                      Icons.grading,
                      color: Colors.grey[400],
                    )
                  ),
                ),
                SizedBox(height: 20,),
                Text("College supervisor signature",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: "PlayfairDisplay",
                  fontSize: 15
                ),
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
                    // print("Thank God");
                  },
                  child: Container(
                    height: 110,
                    width: double.infinity, // Increased height to accommodate signature
                    child: collegeSupervisorSignatureUrl != null 
                      ? Container(
                          decoration: BoxDecoration(
                            color: Color(0xFF1A3A6F),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: EdgeInsets.all(4),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              collegeSupervisorSignatureUrl!,
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
                                print("Failed URL: $collegeSupervisorSignatureUrl");
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


class industrySupervisorTextField1_1 extends StatefulWidget{
  final String IpAddress;
  final String candidate_num;
  industrySupervisorTextField1_1({ required this.IpAddress, required this.candidate_num });  
  @override  
  industrySupervisorTextField1_2 createState()=> industrySupervisorTextField1_2();
}

class industrySupervisorTextField1_2 extends State<industrySupervisorTextField1_1>{
  String emptyMessage = "";
  GlobalKey keyIndustry = GlobalKey<FormState>();
  TextEditingController industrySupervisorController = TextEditingController();
  String? industrySupervisorSignatureUrl = null;

  //start of void initState function
  @override 
  void initState(){
    super.initState();
    retrievingData();
    pictureSupervisorCollegeFunction();
  }
  //end of void initState function

  // start of college supervisor function picture
  Future<void> pictureSupervisorCollegeFunction() async {
    String candidate_table = widget.candidate_num+"_industry";
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
        "candidate_table": candidate_table
      };

      var Urlsend = "http://${IpAddress}/project_app/industrySupervisor_open.php";

      Response response = await dio.post(
        Urlsend,
        data: FormData.fromMap(dataSend)
      );

      if(response.statusCode == 200){
        print("Raw response: ${response.data}");
        if(response.data['message'] == "Empty Photo"){
          setState(() {
            industrySupervisorSignatureUrl = null;
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
                industrySupervisorSignatureUrl = extractedUrl;
              });
              print("URL set to state: $industrySupervisorSignatureUrl");
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
  // start of college supervisor function picture


  //start of retrievingData function
  Future<void> retrievingData() async {
    setState(() {
      emptyMessage = "";
    });
    String Table_name = widget.candidate_num+"_industry";
    try{
      Dio dio = Dio(
        BaseOptions(
          connectTimeout: Duration(seconds: 15),
          receiveTimeout: Duration(seconds: 15),
        )
      );

      var IpAddress = widget.IpAddress;

      var dataSend = {
        "Table_name": Table_name
      };

      var UrlSend = "http://${IpAddress}/project_app/industrySupervisor_marks.php";

      Response response = await dio.post(
        UrlSend,
        data: FormData.fromMap(dataSend)
      );

      if(response.statusCode == 200){
        // print("Thank God");
        // print(response.data);
        var dataReceived = response.data;
        if(dataReceived['message'] == "Empty records"){
          setState(() {
            emptyMessage = "Empty records";
          });
        }else{
          setState(() {
            industrySupervisorController.text = double.parse(dataReceived['industrySupervisorMarks'].toString()).toStringAsFixed(1);
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
  //end of retrievingData function


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
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          if(emptyMessage.isNotEmpty)
            Center(
              child: Text(emptyMessage,
              style: TextStyle(
                color: Colors.white,
                fontFamily: "PlayfairDisplay"
              ),
              ),
            )
          else  
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 35,
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.engineering,
                  size: 45,
                ),
              )
            ],
          ),
          SizedBox(height: 15,),
          Form(
            key: keyIndustry,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Industry supervisor score",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: "PlayfairDisplay",
                  fontSize: 15
                ),
                ),
                TextFormField(
                  controller: industrySupervisorController,
                  style: TextStyle(
                    color: Colors.white
                  ),
                  readOnly: true,
                  decoration: InputDecoration(
                    hintText: "industry supervisor score",
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
                      Icons.grading,
                      color: Colors.grey[400],
                    )
                  ),
                ),
                SizedBox(height: 20,),
                Text("industry supervisor signature",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: "PlayfairDisplay",
                  fontSize: 15
                ),
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
                    // print("Thank God");
                  },
                  child: Container(
                    height: 110,
                    width: double.infinity, // Increased height to accommodate signature
                    child: industrySupervisorSignatureUrl != null 
                      ? Container(
                          decoration: BoxDecoration(
                            color: Color(0xFF1A3A6F),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: EdgeInsets.all(4),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              industrySupervisorSignatureUrl!,
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
                                print("Failed URL: $industrySupervisorSignatureUrl");
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
                                    "Industry Supervisor Signature",
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



class markerSupervisorTextField1_1 extends StatefulWidget{
  final String IpAddress;
  final String candidate_num;
  markerSupervisorTextField1_1({ required this.IpAddress, required this.candidate_num });   
  @override  
  markerSupervisorTextField1_2 createState()=> markerSupervisorTextField1_2();
}

class markerSupervisorTextField1_2 extends State<markerSupervisorTextField1_1>{
  GlobalKey keyMarker = GlobalKey<FormState>();
  TextEditingController summaryDailyController = TextEditingController();
  TextEditingController collegeSupervisorController = TextEditingController();
  TextEditingController industrySupervisorController = TextEditingController();
  TextEditingController technicalReportController = TextEditingController();
  TextEditingController totalController = TextEditingController();
  String technicalReportText = "";

  //start void initState function
  @override
  void initState(){
    super.initState();
    retrievingDataCollege();
    retrievingDataIndustry();
    retrievingMarkerData();

    technicalReportController.addListener((){
      final technicalReportInput = double.tryParse(technicalReportController.text);
      if( technicalReportInput == null || technicalReportInput < 0 || technicalReportInput > 60){
        setState(() {
          technicalReportText = "Invalid number";
        });
      }else{
        setState(() {
          technicalReportText = "";
        });
      }
    });

    summaryDailyController.addListener(_calculateTotal);
    collegeSupervisorController.addListener(_calculateTotal);
    industrySupervisorController.addListener(_calculateTotal);
    technicalReportController.addListener(_calculateTotal);
    
    totalController.text = "0";

  }
  //end void initState function


 //start of calculation function one
  void _calculateTotal() {
    double summaryDaily = double.tryParse(summaryDailyController.text) ?? 0.0;
    double collegeSupervisor = double.tryParse(collegeSupervisorController.text) ?? 0.0;
    double industrySupervisor = double.tryParse(industrySupervisorController.text) ?? 0.0;
    double technicalReport = double.tryParse(technicalReportController.text) ?? 0.0;
    
    double total = summaryDaily + collegeSupervisor + industrySupervisor + technicalReport  ;
    
    // Format the total to remove unnecessary decimal places
    totalController.text = total % 1 == 0 ? total.toInt().toString() : total.toString();
  }
  //end of calculation function one

  //start of retrievingData function
  Future<void> retrievingDataCollege() async {
    setState(() {
      
    });
    String Table_name = widget.candidate_num+"_college";
    try{
      Dio dio = Dio(
        BaseOptions(
          connectTimeout: Duration(seconds: 15),
          receiveTimeout: Duration(seconds: 15),
        )
      );

      var IpAddress = widget.IpAddress;

      var dataSend = {
        "Table_name": Table_name
      };

      var UrlSend = "http://${IpAddress}/project_app/collegSupervisor_marks.php";

      Response response = await dio.post(
        UrlSend,
        data: FormData.fromMap(dataSend)
      );

      if(response.statusCode == 200){
        // print("Thank God");
        // print(response.data);
        var dataReceived = response.data;
        if(dataReceived['message'] == "Empty records"){
          setState(() {
            
          });
        }else{
          setState(() {
            summaryDailyController.text = dataReceived['log_score'];
            collegeSupervisorController.text = double.parse(dataReceived['collegeSupervisorMarks'].toString()).toStringAsFixed(1);
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
  //end of retrievingData function




  //start of retrievingData function
  Future<void> retrievingDataIndustry() async {
    setState(() {
      
    });
    String Table_name = widget.candidate_num+"_industry";
    try{
      Dio dio = Dio(
        BaseOptions(
          connectTimeout: Duration(seconds: 15),
          receiveTimeout: Duration(seconds: 15),
        )
      );

      var IpAddress = widget.IpAddress;

      var dataSend = {
        "Table_name": Table_name
      };

      var UrlSend = "http://${IpAddress}/project_app/industrySupervisor_marks.php";

      Response response = await dio.post(
        UrlSend,
        data: FormData.fromMap(dataSend)
      );

      if(response.statusCode == 200){
        // print("Thank God");
        // print(response.data);
        var dataReceived = response.data;
        if(dataReceived['message'] == "Empty records"){
          setState(() {
            
          });
        }else{
          setState(() {
            industrySupervisorController.text = double.parse(dataReceived['industrySupervisorMarks'].toString()).toStringAsFixed(1);
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


  //start of validating function
  Future<void> validatingFunction() async {
    if( summaryDailyController.text.isEmpty || collegeSupervisorController.text.isEmpty || industrySupervisorController.text.isEmpty || technicalReportController.text.isEmpty || totalController.text.isEmpty || technicalReportText.isNotEmpty ){
      customNotification.notificationCustom(context, message: "There is empty field or invalid");
    }else{
      // customNotification.notificationCustom(context, message: "Thank God");
      submitFunction();
    }
  }
  //end of validating function


  //start of submitfunction
  Future<void> submitFunction () async {
    String Table_name = widget.candidate_num+"_marker";
    try{
      Dio dio = Dio(
        BaseOptions(
          connectTimeout: Duration(seconds: 15),
          receiveTimeout: Duration(seconds: 15),
        )
      );
      var IpAddress = widget.IpAddress;
      var dataSend = {
        "Table_name": Table_name,
        "technical_report": technicalReportController.text,
        "total":totalController.text,
      };
      var UrlSend = "http://${IpAddress}/project_app/mark_data.php";
      Response  response = await dio.post(
        UrlSend,
        data: FormData.fromMap(dataSend)
      );

      if(response.statusCode == 200){
        print("Thank You God");
        print(response.data);
        var dataRecieved = response.data;
        if(dataRecieved['message'] == "You can`t upload twice"){
          setState(() {
            summaryDailyController.clear();
            collegeSupervisorController.clear();
            industrySupervisorController.clear();
            technicalReportController.clear();
            totalController.clear();
            customNotification.notificationCustom(context, message: "You can`t upload twice");
            technicalReportText = "";
            retrievingDataCollege();
            retrievingDataIndustry();
            retrievingMarkerData();            
          });
          
          
        }else{
          setState(() {
            summaryDailyController.clear();
            collegeSupervisorController.clear();
            industrySupervisorController.clear();
            technicalReportController.clear();
            customNotification.notificationCustom(context, message: "Scores Submitted");
            technicalReportText = "";
            totalController.clear();
            retrievingDataCollege();
            retrievingDataIndustry();
            retrievingMarkerData();            
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
  //end of submitfunction


  //start of retrievingMarkerData function
  Future<void> retrievingMarkerData() async{
    String Table_name = widget.candidate_num+"_marker";
    try{
      Dio dio = Dio(
        BaseOptions(
          connectTimeout: Duration(seconds: 15),
          receiveTimeout: Duration(seconds: 15),
        )
      );
      var IpAddress = widget.IpAddress;
      var dataSend = {
        "Table_name": Table_name,
      };
      var UrlSend = "http://${IpAddress}/project_app/marker_retrieve.php";
      Response response = await dio.post(
        UrlSend,
        data: FormData.fromMap(dataSend)
      );
      if(response.statusCode == 200){
        // print("Thank God alot");
        // print(response.data);
        var dataReceived = response.data;
        if(dataReceived['message'] == "Empty recorded"){
          setState(() {
            
          });
        }else{
          setState(() {
            technicalReportController.text = dataReceived['technical_report'];
            totalController.text = dataReceived['total'];            
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
  //end of retrievingMarkerData function

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
            height: MediaQuery.of(context).size.height * 0.05,
          ),  
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 35,
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.engineering,
                  size: 45,
                ),
              )
            ],
          ),
          SizedBox(height: 15,),
          Form(
            key: keyMarker,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Daily and summary score",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: "PlayfairDisplay",
                  fontSize: 15
                ),
                ),
                TextFormField(
                  controller: summaryDailyController,
                  style: TextStyle(
                    color: Colors.white
                  ),
                  readOnly: true,
                  decoration: InputDecoration(
                    hintText: "Daily and summary score",
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
                      Icons.grading,
                      color: Colors.grey[400],
                    )
                  ),
                ),
                SizedBox(height: 10,),
                Text("College supervisor score",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: "PlayfairDisplay",
                  fontSize: 15
                ),
                ),
                TextFormField(
                  controller: collegeSupervisorController,
                  style: TextStyle(
                    color: Colors.white
                  ),
                  readOnly: true,
                  decoration: InputDecoration(
                    hintText: "College supervisor score",
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
                      Icons.grading,
                      color: Colors.grey[400],
                    )
                  ),
                ),
                SizedBox(height: 10,),
                Text("Industry supervisor score",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: "PlayfairDisplay",
                  fontSize: 15
                ),
                ),
                TextFormField(
                  controller: industrySupervisorController,
                  style: TextStyle(
                    color: Colors.white
                  ),
                  readOnly: true,
                  decoration: InputDecoration(
                    hintText: "Industry supervisor score",
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
                      Icons.grading,
                      color: Colors.grey[400],
                    )
                  ),
                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          // color: Colors.red
                        ),
                        height: 30,
                        child: Text("Technical report marks",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: "PlayfairDisplay"
                        ),
                        ),
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Max Score",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                    ),
                    Text("Actual Score",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        readOnly: true,
                        decoration: InputDecoration(
                          fillColor: Color(0xFF1A3A6F),
                          filled: true,                          
                          hintText: "60",
                          hintStyle: TextStyle(
                            color: Colors.white,
                            fontFamily: "PlayfairDisplay"
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none
                          )
                        ),
                      ),
                    ),
                    SizedBox(width: 8,),
                    Expanded(
                      child: TextFormField(
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        controller: technicalReportController,
                        // readOnly: true,
                        keyboardType: TextInputType.numberWithOptions(decimal: true),
                        decoration: InputDecoration(
                          fillColor: Color(0xFF1A3A6F),
                          filled: true, 
                          hintText: "<60",
                          hintStyle: TextStyle(
                            color: Colors.white,
                            fontFamily: "PlayfairDisplay"
                          ),                                                   
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none
                          )
                        ),
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(technicalReportText,
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 13,
                    ),
                    )
                  ],
                ),                
                SizedBox(height: 10,),
                Text("Total score",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: "PlayfairDisplay",
                  fontSize: 15
                ),
                ),
                TextFormField(
                  controller: totalController,
                  style: TextStyle(
                    color: Colors.white
                  ),
                  readOnly: true,
                  decoration: InputDecoration(
                    hintText: "Total score",
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
                      Icons.grading,
                      color: Colors.grey[400],
                    )
                  ),
                ),
                SizedBox(height: 25,),
                Row(
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: MaterialButton(
                          onPressed: (){
                            validatingFunction();
                          },
                          textColor: Colors.white,
                          color: Color(0xFF5DADE2),
                          height: 50,
                          child: Text("Sumbit"),
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
        top: 20,
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




