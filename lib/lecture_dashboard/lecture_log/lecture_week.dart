import 'package:flutter/material.dart';
// import 'package:weeklist/day.dart';
import 'package:project_app/lecture_dashboard/lecture_log/lecture_day.dart';
import 'package:dio/dio.dart';
import 'package:intl/intl.dart';
import 'package:project_app/lecture_dashboard/lecture_log/supervisorSignatureScreen.dart';
// void main(){
//   runApp(
//     lecture_week1_1()
//   );
// }


// class lecture_week1_1 extends StatelessWidget{
//   @override 
//   Widget build(BuildContext context){
//     return MaterialApp(
//       home: lecture_week1_2(),
//       debugShowCheckedModeBanner: false,
//     );
//   }
// }

class lecture_week1_2 extends StatefulWidget{
  final String IpAddress;
  final String candidate_num;
  final String nameIdentity;
  lecture_week1_2({required this.IpAddress, required this.candidate_num, required this.nameIdentity });
  @override  
  lecture_week1_3 createState()=> lecture_week1_3();
}


class lecture_week1_3 extends State<lecture_week1_2>{
  @override  
  Widget build(BuildContext context){
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Color(0xFF002147),
        appBar: LectureweekAppBar(context),
        body: TabBarView(
          children: [
            Padding(
              padding: EdgeInsets.all(16),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    lecture_example1(IpAddress: widget.IpAddress, candidate_num: widget.candidate_num)
                  ],
                ),
              )
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // Text("Hello")
                    lecture_report1_1(IpAddress: widget.IpAddress, candidate_num: widget.candidate_num)
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: markContainer1_1(IpAddress: widget.IpAddress, candidate_num: widget.candidate_num, nameIdentity: widget.nameIdentity)
                ),
            ),
          ],
        ),
        ),
    );
    
  }
}

PreferredSizeWidget LectureweekAppBar(BuildContext context){
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
      labelStyle: TextStyle(
        color: Colors.white,
        fontSize: 15,
      ),
      unselectedLabelStyle: TextStyle(
        color: Colors.grey,
        fontSize: 15
      ),
      labelColor: Colors.white,
      indicatorColor: Colors.white,
      unselectedLabelColor: Colors.grey,
      tabs: [  

        Tab(text: "LogBook",),
        Tab(text: "Details",),
        Tab(text: "Marks",)
      ],
    ),
  );
}


class markContainer1_1 extends StatefulWidget{
  final String IpAddress;
  final String candidate_num;
  final String nameIdentity;
  markContainer1_1({required this.IpAddress, required this.candidate_num, required this.nameIdentity });  
  @override
  markContainer1_2 createState()=> markContainer1_2();
}

class markContainer1_2 extends State<markContainer1_1>{
  String? collegeSupervisorSignatureUrl = null;

  //start of void initState function
  @override 
  void initState(){
    super.initState();
    retrievingMarks();
    pictureSupervisorCollegeFunction();
    String RecentDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
    dateController.text = RecentDate;
      
    abilityController.addListener((){
      final abilityInput = double.tryParse(abilityController.text);
      if( abilityInput == null || abilityInput < 0 || abilityInput > 10){
        setState(() {
          abilityText = "Invalid number";
        });
      }else{
        setState(() {
          abilityText = "";
        });
      }
    });
    workController.addListener((){
      final workInput = double.tryParse(workController.text);
      if( workInput == null || workInput < 0 || workInput > 10){
        setState(() {
          workText = "Invalid number";
        });
      }else{
        setState(() {
          workText = "";
        });
      }
    }); 
    wellController.addListener((){
      final wellInput = double.tryParse(wellController.text);
      if( wellInput == null || wellInput < 0 || wellInput > 10){
        setState(() {
          wellText = "Invalid number";
        });
      }else{
        setState(() {
          wellText = "";
        });
      }
    });
    attitudeController.addListener((){
      final attitudeInput = double.tryParse(attitudeController.text);
      if( attitudeInput == null || attitudeInput < 0 || attitudeInput > 10){
        setState(() {
          attitudeText = "Invalid number";
        });
      }else{
        setState(() {
          attitudeText = "";
        });
      }
    }); 
    goodController.addListener((){
      final goodInput = double.tryParse(goodController.text);
      if( goodInput == null || goodInput < 0 || goodInput > 10){
        setState(() {
          goodText = "Invalid number";
        });
      }else{
        setState(() {
          goodText = "";
        });
      }
    });   

    neatController.addListener((){
      final neatInput = double.tryParse(neatController.text);
      if( neatInput == null || neatInput < 0 || neatInput > 10){
        setState(() {
          neatText = "Invalid number";
        });
      }else{
        setState(() {
          neatText = "";
        });
      }
    });

    understandController.addListener((){
      final understandInput = double.tryParse(understandController.text);
      if( understandInput == null || understandInput < 0 || understandInput > 10){
        setState(() {
          understandText = "Invalid number";
        });
      }else{
        setState(() {
          understandText = "";
        });
      }
    });

    writtenController.addListener((){
      final writtenInput = double.tryParse(writtenController.text);
      if( writtenInput == null || writtenInput < 0 || writtenInput > 10){
        setState(() {
          writtenText = "Invalid number";
        });
      }else{
        setState(() {
          writtenText = "";
        });
      }
    });

    expressController.addListener((){
      final expressInput = double.tryParse(expressController.text);
      if( expressInput == null || expressInput < 0 || expressInput > 10){
        setState(() {
          expressText = "Invalid number";
        });
      }else{
        setState(() {
          expressText = "";
        });
      }
    });

    interestController.addListener((){
      final interestInput = double.tryParse(interestController.text);
      if( interestInput == null || interestInput < 0 || interestInput > 10){
        setState(() {
          interestText = "Invalid number";
        });
      }else{
        setState(() {
          interestText = "";
        });
      }
    });

    dailyController.addListener((){
      final dailyInput = double.tryParse(dailyController.text);
      if( dailyInput == null || dailyInput < 0 || dailyInput > 10){
        setState(() {
          dailyText = "Invalid number";
        });
      }else{
        setState(() {
          dailyText = "";
        });
      }
    });

    weeklyController.addListener((){
      final weeklyInput = double.tryParse(weeklyController.text);
      if( weeklyInput == null || weeklyInput < 0 || weeklyInput > 10){
        setState(() {
          weeklyText = "Invalid number";
        });
      }else{
        setState(() {
          weeklyText = "";
        });
      }
    });


    // Add calculation listeners ONCE for all controllers that should be summed
    abilityController.addListener(_calculateTotal);
    workController.addListener(_calculateTotal);
    wellController.addListener(_calculateTotal);
    attitudeController.addListener(_calculateTotal);
    goodController.addListener(_calculateTotal);
    neatController.addListener(_calculateTotalStudent);
    understandController.addListener(_calculateTotalStudent);
    writtenController.addListener(_calculateTotalStudent);
    expressController.addListener(_calculateTotalStudent);
    interestController.addListener(_calculateTotalStudent);
    dailyController.addListener(_calculateTotalLog);
    weeklyController.addListener(_calculateTotalLog);

    totalController.text = "0";
    totalStudentController.text = "0";
    totalLogController.text = "0";
                           
  }
  //end of void initState function


  GlobalKey markKey = GlobalKey<FormState>();
  //start of other controllers
  TextEditingController companyController = TextEditingController();
  TextEditingController supervisorController = TextEditingController();
  TextEditingController experienceController = TextEditingController();
  TextEditingController managementController = TextEditingController();
  TextEditingController observationController = TextEditingController();
  TextEditingController viewController = TextEditingController();
  //end of other controllers


  //start of score controllers
  TextEditingController dateController = TextEditingController();
  TextEditingController abilityController = TextEditingController();
  TextEditingController workController = TextEditingController();
  TextEditingController wellController = TextEditingController();
  TextEditingController attitudeController = TextEditingController();
  TextEditingController goodController = TextEditingController();
  TextEditingController neatController= TextEditingController();
  TextEditingController understandController = TextEditingController();
  TextEditingController writtenController = TextEditingController();
  TextEditingController expressController = TextEditingController();
  TextEditingController interestController = TextEditingController();
  TextEditingController dailyController = TextEditingController();
  TextEditingController weeklyController = TextEditingController();
  TextEditingController totalController = TextEditingController();
  TextEditingController totalStudentController = TextEditingController();
  TextEditingController totalLogController = TextEditingController();
  String abilityText = "";
  String workText = "";
  String wellText = "";
  String attitudeText = "";  
  String goodText = "";
  String neatText = "";
  String understandText = "";
  String writtenText = "";
  String expressText = "";
  String interestText = "";
  String dailyText = "";
  String weeklyText = "";
  String totalText= "";
  //end of score controllers

  //start of retrieving data
  Future<void>  retrievingMarks() async {
    // String lectureMark = "lectureMark";
    String candidate_table = widget.candidate_num+"_college";
    try{
      Dio dio = Dio(
        BaseOptions(
          connectTimeout: Duration(seconds: 15),
          receiveTimeout: Duration(seconds: 15),
        ),
      );
      var IpAddress = widget.IpAddress;
      var dataSend = {
        "candidate_table": candidate_table
      };

      var UrlSend = "http://${IpAddress}/project_app/lectureMarks_retrieve.php";

      Response response = await dio.post(
        UrlSend,
        data: FormData.fromMap(dataSend)
      );

      if(response.statusCode == 200){
        // print("Thank God");
        // print(response.data);
        var dataRetrieved = response.data;
        if(dataRetrieved['message'] == "Empty feature" ){
          print("Empty");
        }else{
          setState(() {
            companyController.text = dataRetrieved['company'];
            supervisorController.text = dataRetrieved['supervisor'];
            totalController.text = dataRetrieved['management_score'];
            totalStudentController.text = dataRetrieved['student_score'];
            totalLogController.text = dataRetrieved['log_score'];
            experienceController.text = dataRetrieved['problem_student'];
            managementController.text = dataRetrieved['problem_management'];
            observationController.text = dataRetrieved['observation'];
            viewController.text = dataRetrieved['view'];
            dateController.text = dataRetrieved['calendar'];
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
                 print("unknown error ${e.message} ");
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
  //end of retrieving data  

  //start of submitting function
  Future<void> submitFunction() async {
    String candidate_table = widget.candidate_num+"_college";
    String student_name = widget.nameIdentity;
    String admin_no = widget.candidate_num;
    // String level = "Level 5";
    // String department = "IT";
    // String program = "Computer science";
    try{
      Dio dio = Dio(
        BaseOptions(
          connectTimeout: Duration(seconds: 15),
          receiveTimeout: Duration(seconds: 15),
        )
      );
      var IpAddress = widget.IpAddress;
      var dataSend = {
        "candidate_table": candidate_table,
        "company": companyController.text,
        "supervisor": supervisorController.text,
        "student_name": student_name,
        "admin_no": admin_no,
        // "level": level,
        // "department": department,
        // "program": program,
        "management_score": totalController.text,
        "student_score": totalStudentController.text,
        "log_score": totalLogController.text,
        "problem_student": experienceController.text,
        "problem_management": managementController.text,
        "observation": observationController.text,
        "view": viewController.text,
        "calendar": dateController.text
      };

      var UrlSend = "http://${IpAddress}/project_app/lectureMarks_send.php";

      Response response = await dio.post(
        UrlSend,
        data: FormData.fromMap(dataSend)
      );

      if(response.statusCode == 200){
        // print("THank God");
        // print(response.data);
        var dataReceived = response.data;
        if(dataReceived['message'] == "submitted" ){
          setState(() {
            companyController.clear();
            supervisorController.clear();
            abilityController.clear();
            workController.clear();
            wellController.clear();
            attitudeController.clear();
            goodController.clear();
            neatController.clear();
            understandController.clear();
            writtenController.clear();
            expressController.clear();
            interestController.clear();
            dailyController.clear();
            weeklyController.clear();
            totalController.clear();
            totalStudentController.clear();
            totalLogController.clear();
            experienceController.clear();
            managementController.clear();
            observationController.clear();
            viewController.clear();
            dateController.clear();
            customNotification.notificationCustom(context, message: 'submitted',picIcon: Icon(Icons.check,color: Colors.white,size: 14,));
            retrievingMarks();            
          });

        }else{
          setState(() {
            companyController.clear();
            supervisorController.clear();
            abilityController.clear();
            workController.clear();
            wellController.clear();
            attitudeController.clear();
            goodController.clear();
            neatController.clear();
            understandController.clear();
            writtenController.clear();
            expressController.clear();
            interestController.clear();
            dailyController.clear();
            weeklyController.clear();
            totalController.clear();
            totalStudentController.clear();
            totalLogController.clear();
            experienceController.clear();
            managementController.clear();
            observationController.clear();
            viewController.clear();
            dateController.clear();
            customNotification.notificationCustom(context, message: 'You can`t submit',); 
            retrievingMarks();            
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
                 print("unknown error ${e.message} ");
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
  //end of submitting function

  //start of validating function
  Future<void> validatingFunction() async {
    if(abilityController.text.isEmpty || workController.text.isEmpty || wellController.text.isEmpty || attitudeController.text.isEmpty || goodController.text.isEmpty || neatController.text.isEmpty || understandController.text.isEmpty || writtenController.text.isEmpty || expressController.text.isEmpty || interestController.text.isEmpty || dailyController.text.isEmpty || weeklyController.text.isEmpty || totalController.text.isEmpty || totalLogController.text.isEmpty || totalStudentController.text.isEmpty || companyController.text.isEmpty || supervisorController.text.isEmpty || experienceController.text.isEmpty || managementController.text.isEmpty || observationController.text.isEmpty || viewController.text.isEmpty ){
      customNotification.notificationCustom(context, message: "There is an empty field");
    }else{
      // customNotification.notificationCustom(context, message: "Thank God");
      submitFunction();
    }
  }
  //end of validating function



  //start of calculation function one
  void _calculateTotalStudent() {
    double neat = double.tryParse(neatController.text) ?? 0.0;
    double understand = double.tryParse(understandController.text) ?? 0.0;
    double written = double.tryParse(writtenController.text) ?? 0.0;
    double express = double.tryParse(expressController.text) ?? 0.0;
    double interest= double.tryParse(interestController.text) ?? 0.0;
    
    double total = neat + understand + written + express + interest ;
    
    // Format the total to remove unnecessary decimal places
    totalStudentController.text = total % 1 == 0 ? total.toInt().toString() : total.toString();
  }
  //end of calculation function one

 //start of calculation function two
  void _calculateTotal() {
    double ability = double.tryParse(abilityController.text) ?? 0.0;
    double work = double.tryParse(workController.text) ?? 0.0;
    double well = double.tryParse(wellController.text) ?? 0.0;
    double attitude = double.tryParse(attitudeController.text) ?? 0.0;
    double good = double.tryParse(goodController.text) ?? 0.0;
    
    double total = ability + work + well + attitude + good ;
    
    // Format the total to remove unnecessary decimal places
    totalController.text = total % 1 == 0 ? total.toInt().toString() : total.toString();
  }
  //end of calculation function two  


  //start of calculation function log
  void _calculateTotalLog() {
    double daily = double.tryParse(dailyController.text) ?? 0.0;
    double weekly = double.tryParse(weeklyController.text) ?? 0.0;

    
    double total = daily + weekly  ;
    
    // Format the total to remove unnecessary decimal places
    totalLogController.text = total % 1 == 0 ? total.toInt().toString() : total.toString();
  }
  //end of calculation function log 


  //start of dispose function
  void dispose() {
    abilityController.dispose();
    workController.dispose();
    wellController.dispose();
    attitudeController.dispose();
    goodController.dispose();
    neatController.dispose();
    understandController.dispose();
    writtenController.dispose();
    expressController.dispose();
    interestController.dispose();
    totalController.dispose();
    super.dispose();
  }
  //end of dispose function

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
  // end of college supervisor function picture

  //start of checking signature function
  Future<void> checkingUploading() async {
    String candidate_table = widget.candidate_num+"_college";
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
      };

      var UrlSend = "http://${IpAddress}/project_app/lectureSupervisor_checkUpload.php";

      Response response = await dio.post(
        UrlSend,
        data: FormData.fromMap(dataSend)
      );

      if(response.statusCode == 200){
        // print(response.data);
        // print("Thank God");
        var DataRecieved = response.data;
        if(DataRecieved['message'] == "report not submitted"){
          customNotification.notificationCustom(context, message: "report not submitted");
        }else{
          if(collegeSupervisorSignatureUrl == null){
            // print("Thank God first then Go");
            final result = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context)=>SignatureScreen(IpAddress: IpAddress, candidate_table: candidate_table,)
              )
            );

            if(result == true){
              await pictureSupervisorCollegeFunction();
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


  @override 
  Widget build(BuildContext context){
    return Column(
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(5, 5, 5, 0),
          child: Form(
            child: Column(
              children: [
                Row(
                  children: [
                    Text("NAME OF THE COMPANY/UNDERTAKING",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "PlayfairDisplay"
                    ),
                    )
                  ],
                ),
                TextFormField(
                  controller: companyController,
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: "PlayfairDisplay"
                  ),
                  decoration: InputDecoration(
                    // fillColor: Color(0xFF1A3A6F),
                    // filled: true,
                    // hintText: "Employer/Company",
                    // hintStyle: TextStyle(
                    //   color: Colors.white70
                    // ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                      )
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                        width: 2
                      )
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    Text("NAME OF COLLEGE SUPERVISOR",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "PlayfairDisplay"
                    ),
                    )
                  ],
                ),
                TextFormField(
                  controller: supervisorController,
                  style: TextStyle(
                    color: Colors.white
                  ),
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white
                      )
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                        width: 2
                      )
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
                        child: Text("A: DISCUSSION WITH THE MANAGEMENT",
                        style: TextStyle(
                          color: Colors.green,
                          fontFamily: "PlayfairDisplay"
                        ),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 8,),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          // color: Colors.red
                        ),
                        height: 50,
                        child: Text("1 Ability to execute jobs assigned to him/her intelligently and with intergrity",
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
                          hintText: "10",
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
                          color: Colors.white
                        ),
                        controller: abilityController,
                        keyboardType: TextInputType.numberWithOptions(decimal: true),
                        decoration: InputDecoration(
                          fillColor: Color(0xFF1A3A6F),
                          filled: true,                          
                          hintText: "<10",
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
                    Text(abilityText,
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 13,
                    ),
                    )
                  ],
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
                        child: Text("2 Work habits (punctuality,attendance)",
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
                          hintText: "10",
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
                        controller: workController,
                        keyboardType: TextInputType.numberWithOptions(decimal: true),
                        decoration: InputDecoration(
                          fillColor: Color(0xFF1A3A6F),
                          filled: true,                          
                          hintText: "<10",
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
                    Text(workText,
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 13,
                    ),
                    )
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          // color: Colors.red
                        ),
                        height: 50,
                        child: Text("3 Ability to work well with his co-workers, foreman and management",
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
                          hintText: "10",
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
                        controller: wellController,
                        keyboardType: TextInputType.numberWithOptions(decimal: true),
                        decoration: InputDecoration(
                          fillColor: Color(0xFF1A3A6F),
                          filled: true,                          
                          hintText: "<10",
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
                    Text(wellText,
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 13,
                    ),
                    )
                  ],
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
                        child: Text("4 Attitude towards practical work ",
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
                          hintText: "10",
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
                        controller: attitudeController,
                        keyboardType: TextInputType.numberWithOptions(decimal: true),
                        decoration: InputDecoration(
                          fillColor: Color(0xFF1A3A6F),
                          filled: true,                          
                          hintText: "<10",
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
                    Text(attitudeText,
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 13,
                    ),
                    )
                  ],
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
                        child: Text("5 Good and hardworking ",
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
                          hintText: "10",
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
                        controller: goodController,
                        keyboardType: TextInputType.numberWithOptions(decimal: true),
                        decoration: InputDecoration(
                          fillColor: Color(0xFF1A3A6F),
                          filled: true,                          
                          hintText: "<10",
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
                    Text(goodText,
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 13,
                    ),
                    )
                  ],
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
                        child: Text("Total",
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
                          hintText: "50",
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
                        controller: totalController,
                        readOnly: true,
                        keyboardType: TextInputType.numberWithOptions(decimal: true),
                        decoration: InputDecoration(
                          fillColor: Color(0xFF1A3A6F),
                          filled: true,                          
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
                SizedBox(height: 50,),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          // color: Colors.red
                        ),
                        height: 30,
                        child: Text("B: DISCUSSION WITH THE STUDENT",
                        style: TextStyle(
                          color: Colors.green,
                          fontFamily: "PlayfairDisplay"
                        ),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          // color: Colors.red
                        ),
                        height: 50,
                        child: Text("1 Neatness, cleaness and up to date reporting in the logbook",
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
                          hintText: "10",
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
                        controller: neatController,
                        keyboardType: TextInputType.numberWithOptions(decimal: true),
                        decoration: InputDecoration(
                          fillColor: Color(0xFF1A3A6F),
                          filled: true,
                          hintText: "<10",
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
                    Text(neatText,
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 13,
                    ),
                    )
                  ],
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
                        child: Text("2 Ability to understand what he/she has done",
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
                          hintText: "10",
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
                        controller: understandController,
                        keyboardType: TextInputType.numberWithOptions(decimal: true),
                        decoration: InputDecoration(
                          fillColor: Color(0xFF1A3A6F),
                          filled: true, 
                          hintText: "<10",
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
                    Text(understandText,
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 13,
                    ),
                    )
                  ],
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
                        child: Text("3 Ability to understand what he/she has written",
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
                          hintText: "10",
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
                        controller: writtenController,
                        keyboardType: TextInputType.numberWithOptions(decimal: true),
                        decoration: InputDecoration(
                          fillColor: Color(0xFF1A3A6F),
                          filled: true,
                          hintText: "<10",
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
                    Text(writtenText,
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 13,
                    ),
                    )
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          // color: Colors.red
                        ),
                        height: 50,
                        child: Text("4 Ability to express himself/herself confidentiality and systematically ",
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
                          hintText: "10",
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
                        controller: expressController,
                        keyboardType: TextInputType.numberWithOptions(decimal: true),
                        decoration: InputDecoration(
                          fillColor: Color(0xFF1A3A6F),
                          filled: true, 
                          hintText: "<10",
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
                    Text(expressText,
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 13,
                    ),
                    )
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          // color: Colors.red
                        ),
                        height: 50,
                        child: Text("5 Interest or eagerness to learn new skills and knowledge",
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
                          hintText: "10",
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
                        controller: interestController,
                        keyboardType: TextInputType.numberWithOptions(decimal: true),
                        decoration: InputDecoration(
                          fillColor: Color(0xFF1A3A6F),
                          filled: true, 
                          hintText: "<10",
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
                    Text(interestText,
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 13,
                    ),
                    )
                  ],
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
                        child: Text("Total",
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
                          hintText: "50",
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
                        controller: totalStudentController,
                        readOnly: true,
                        keyboardType: TextInputType.numberWithOptions(decimal: true),
                        decoration: InputDecoration(
                          fillColor: Color(0xFF1A3A6F),
                          filled: true,                          
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
                SizedBox(height: 50,),
                Row(
                  children: [
                    Text("C: LOG BOOK",
                    style: TextStyle(
                      color: Colors.green,
                      fontFamily: "PlayfairDisplay"
                    ),
                    )
                  ],
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
                        child: Text("1 Daily summary",
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
                          hintText: "10",
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
                        controller: dailyController,
                        keyboardType: TextInputType.numberWithOptions(decimal: true),
                        decoration: InputDecoration(
                          fillColor: Color(0xFF1A3A6F),
                          filled: true,
                          hintText: "<10",
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
                    Text(dailyText,
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 13,
                    ),
                    )
                  ],
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
                        child: Text("2 Weekly summary",
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
                          hintText: "10",
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
                        controller: weeklyController,
                        keyboardType: TextInputType.numberWithOptions(decimal: true),
                        decoration: InputDecoration(
                          fillColor: Color(0xFF1A3A6F),
                          filled: true,
                          hintText: "<10",
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
                    Text(weeklyText,
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 13,
                    ),
                    )
                  ],
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
                        child: Text("Total",
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
                          hintText: "20",
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
                        controller: totalLogController,
                        readOnly: true,
                        keyboardType: TextInputType.numberWithOptions(decimal: true),
                        decoration: InputDecoration(
                          fillColor: Color(0xFF1A3A6F),
                          filled: true,                          
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
                SizedBox(height: 50,),
                Row(
                  children: [
                    Text("D: COLLEGE SUPERVISOR`S VIEW",
                    style: TextStyle(
                      color: Colors.green,
                      fontFamily: "PlayfairDisplay"
                    ),
                    )
                  ],
                ),
                SizedBox(height: 8,),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          // color: Colors.red
                        ),
                        height: 24,
                        child: Text("1 What is the student experiencing(other than financlial problems)",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: "PlayfairDisplay"
                        ),
                        ),
                      ),
                    )
                  ],
                ), 
                TextFormField(
                  controller: experienceController,
                  style: TextStyle(
                    color: Colors.white
                  ),
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white
                      )
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                        width: 2
                      )
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
                        height: 24,
                        child: Text("2 What problems is the management getting from the student",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: "PlayfairDisplay"
                        ),
                        ),
                      ),
                    )
                  ],
                ), 
                TextFormField(
                  controller: managementController,
                  style: TextStyle(
                    color: Colors.white
                  ),
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white
                      )
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                        width: 2
                      )
                    )
                  ),
                ),
                SizedBox(height: 15,),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          // color: Colors.red
                        ),
                        height: 170,
                        child: Text("3 From your observations on student`s training,company activities, discussions with the management of students give a brief report,comments or suggestionson areas that need to be added or removed from the three years Ordinary Diploma Course in Engineering(NTA Level 4- NTA Level 6) or Bachelor in Engineering (NTA7-8) syllabus in order to improve or update it  ",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: "PlayfairDisplay"
                        ),
                        ),
                      ),
                    )
                  ],
                ),
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxHeight: 300,
                    minHeight: 300
                  ),
                  child: TextFormField(
                    controller: observationController,
                    style: TextStyle(
                      color: Colors.white
                    ),
                    expands: true,
                    maxLines: null,
                    keyboardType: TextInputType.multiline,
                    textAlignVertical: TextAlignVertical.top,
                    decoration: InputDecoration(
                      hintText: "Comment......",
                      hintStyle: TextStyle(
                        color: Colors.white,
                        fontFamily: "PlayfairDisplay"
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
                      )
                    ),
                  ),
                ),
                SizedBox(height: 15,),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          // color: Colors.red
                        ),
                        height: 70,
                        child: Text("5 Genral views including (a)Suitability of the working place. (b) Recommendation on where the student should be placed for his/her next IPT ",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: "PlayfairDisplay"
                        ),
                        ),
                      ),
                    )
                  ],
                ),
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxHeight: 300,
                    minHeight: 300
                  ),
                  child: TextFormField(
                    controller: viewController,
                    style: TextStyle(
                      color: Colors.white
                    ),
                    expands: true,
                    maxLines: null,
                    keyboardType: TextInputType.multiline,
                    textAlignVertical: TextAlignVertical.top,
                    decoration: InputDecoration(
                      hintText: "Suggestion......",
                      hintStyle: TextStyle(
                        color: Colors.white,
                        fontFamily: "PlayfairDisplay"
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
                      )
                    ),
                  ),
                ), 
                SizedBox(height: 15,),                
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
                SizedBox(height: 20,),
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
          ),
        )
      ],
    );
  }
}








class lecture_example1 extends StatefulWidget{
  final String IpAddress;
  final String candidate_num;
  lecture_example1({required this.IpAddress, required this.candidate_num });  
  @override   
  lecture_example1_1 createState()=> lecture_example1_1();
}

class lecture_example1_1 extends State<lecture_example1>{
  @override  
  Widget build(BuildContext context ){
            return  Container(
                // height: 590,
                // width: double.infinity,
                decoration: BoxDecoration(
                  // color: Colors.red
                ),
                child:  Column(
                      children: [
                        GestureDetector(
                          onTap: (){
                            String week = "week 1";
                            // print("Thank God");
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context)=>lecture_day1_2(IpAddress: widget.IpAddress, candidate_num: widget.candidate_num, week: week)
                              )
                            );
                          },
                          child: Container(
                            height: 80,
                            decoration: BoxDecoration(
                              // color: Colors.blue
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Week 1",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18
                                ),
                                ),
                                Icon(
                                  Icons.calendar_month,
                                  color: Colors.white,
                                  size: 24,
                                )
                              ],
                            ),
                          ),
                        ),
                        Divider(
                          height: 2,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        GestureDetector(
                          onTap: (){
                            String week = "week 2";
                            // print("Thank God");
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context)=>lecture_day1_2(IpAddress: widget.IpAddress, candidate_num: widget.candidate_num, week: week)
                              )
                            );                            
                          },
                          child: Container(
                            height: 80,
                            decoration: BoxDecoration(
                              // color: Colors.blue
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Week 2",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18
                                ),
                                ),
                                Icon(
                                  Icons.calendar_month,
                                  color: Colors.white,
                                  size: 24,
                                )
                              ],
                            ),
                          ),
                        ),
                        Divider(
                          height: 2,
                          color: Colors.grey,
                        ),  
                        SizedBox(
                          height: 5,
                        ), 
                        GestureDetector(
                          onTap: (){
                            String week = "week 3";
                            // print("Thank God");
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context)=>lecture_day1_2(IpAddress: widget.IpAddress, candidate_num: widget.candidate_num, week: week)
                              )
                            );                            
                          },
                          child: Container(
                            height: 80,
                            decoration: BoxDecoration(
                              // color: Colors.blue
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Week 3",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18
                                ),
                                ),
                                Icon(
                                  Icons.calendar_month,
                                  color: Colors.white,
                                  size: 24,
                                )
                              ],
                            ),
                          ),
                        ),
                        Divider(
                          height: 2,
                          color: Colors.grey,
                        ),  
                        SizedBox(
                          height: 5,
                        ),
                        GestureDetector(
                          onTap: (){
                            String week = "week 4";
                            // print("Thank God");
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context)=>lecture_day1_2(IpAddress: widget.IpAddress, candidate_num: widget.candidate_num, week: week)
                              )
                            );                            
                          },
                          child: Container(
                            height: 80,
                            decoration: BoxDecoration(
                              // color: Colors.blue
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Week 4",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18
                                ),
                                ),
                                Icon(
                                  Icons.calendar_month,
                                  color: Colors.white,
                                  size: 24,
                                )
                              ],
                            ),
                          ),
                        ),
                        Divider(
                          height: 2,
                          color: Colors.grey,
                        ),  
                        SizedBox(
                          height: 5,
                        ),
                        GestureDetector(
                          onTap: (){
                            String week = "week 5";
                            // print("Thank God");
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context)=>lecture_day1_2(IpAddress: widget.IpAddress, candidate_num: widget.candidate_num, week: week)
                              )
                            );                            
                          },
                          child: Container(
                            height: 80,
                            decoration: BoxDecoration(
                              // color: Colors.blue
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Week 5",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18
                                ),
                                ),
                                Icon(
                                  Icons.calendar_month,
                                  color: Colors.white,
                                  size: 24,
                                )
                              ],
                            ),
                          ),
                        ),
                        Divider(
                          height: 2,
                          color: Colors.grey,
                        ),  
                        SizedBox(
                          height: 5,
                        ), 
                        GestureDetector(
                          onTap: (){
                            String week = "week 6";
                            // print("Thank God");
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context)=>lecture_day1_2(IpAddress: widget.IpAddress, candidate_num: widget.candidate_num, week: week)
                              )
                            );                            
                          },
                          child: Container(
                            height: 80,
                            decoration: BoxDecoration(
                              // color: Colors.blue
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Week 6",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18
                                ),
                                ),
                                Icon(
                                  Icons.calendar_month,
                                  color: Colors.white,
                                  size: 24,
                                )
                              ],
                            ),
                          ),
                        ),
                        Divider(
                          height: 2,
                          color: Colors.grey,
                        ),  
                        SizedBox(
                          height: 5,
                        ),
                        GestureDetector(
                          onTap: (){
                            String week = "week 7";
                            // print("Thank God");
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context)=>lecture_day1_2(IpAddress: widget.IpAddress, candidate_num: widget.candidate_num, week: week)
                              )
                            );                            
                          },
                          child: Container(
                            height: 80,
                            decoration: BoxDecoration(
                              // color: Colors.blue
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Week 7",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18
                                ),
                                ),
                                Icon(
                                  Icons.calendar_month,
                                  color: Colors.white,
                                  size: 24,
                                )
                              ],
                            ),
                          ),
                        ),
                        Divider(
                          height: 2,
                          color: Colors.grey,
                        ),  
                        SizedBox(
                          height: 5,
                        ),
                        GestureDetector(
                          onTap: (){
                            String week = "week 8";
                            // print("Thank God");
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context)=>lecture_day1_2(IpAddress: widget.IpAddress, candidate_num: widget.candidate_num, week: week)
                              )
                            );                            
                          },
                          child: Container(
                            height: 80,
                            decoration: BoxDecoration(
                              // color: Colors.blue
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Week 8",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18
                                ),
                                ),
                                Icon(
                                  Icons.calendar_month,
                                  color: Colors.white,
                                  size: 24,
                                )
                              ],
                            ),
                          ),
                        ),
                        Divider(
                          height: 2,
                          color: Colors.grey,
                        ),  
                        SizedBox(
                          height: 5,
                        ),
                        GestureDetector(
                          onTap: (){
                            String week = "week 9";
                            // print("Thank God");
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context)=>lecture_day1_2(IpAddress: widget.IpAddress, candidate_num: widget.candidate_num, week: week)
                              )
                            );                            
                          },
                          child: Container(
                            height: 80,
                            decoration: BoxDecoration(
                              // color: Colors.blue
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Week 9",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18
                                ),
                                ),
                                Icon(
                                  Icons.calendar_month,
                                  color: Colors.white,
                                  size: 24,
                                )
                              ],
                            ),
                          ),
                        ),
                        Divider(
                          height: 2,
                          color: Colors.grey,
                        ),  
                        SizedBox(
                          height: 5,
                        ), 
                        GestureDetector(
                          onTap: (){
                            String week = "week 10";
                            // print("Thank God");
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context)=>lecture_day1_2(IpAddress: widget.IpAddress, candidate_num: widget.candidate_num, week: week)
                              )
                            );                            
                          },
                          child: Container(
                            height: 80,
                            decoration: BoxDecoration(
                              // color: Colors.blue
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Week 10",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18
                                ),
                                ),
                                Icon(
                                  Icons.calendar_month,
                                  color: Colors.white,
                                  size: 24,
                                )
                              ],
                            ),
                          ),
                        ),
                        Divider(
                          height: 2,
                          color: Colors.grey,
                        ),  
                        SizedBox(
                          height: 5,
                        ),
                      ],
                    )
              );    
  }
}


class lecture_report1_1 extends StatefulWidget{
  final String IpAddress;
  final String candidate_num;
  lecture_report1_1({required this.IpAddress, required this.candidate_num });  
  @override  
  lecture_report1_2 createState()=> lecture_report1_2();
}

class lecture_report1_2 extends State<lecture_report1_1>{
  TextEditingController streetController = TextEditingController();
  TextEditingController regionController= TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController areaController = TextEditingController();
  TextEditingController candidates_numController = TextEditingController(); 
  
  //start of void function
  @override
  void initState(){
    super.initState();
    retrieveReport();
  }
  //end of void function

  //start of function to retrieve report
  Future<void> retrieveReport() async {
    try{
      Dio dio = Dio(
        BaseOptions(
          connectTimeout: Duration(seconds: 15),
          receiveTimeout: Duration(seconds: 15),
        )
      );

      var IpAddress = widget.IpAddress;
      var dataSend = {
        "candidate_num": widget.candidate_num,
      };

      var UrlSend = "http://${IpAddress}/project_app/lecture_report.php";

      Response response = await dio.post(
        UrlSend,
        data: FormData.fromMap(dataSend)
      );

      if(response.statusCode == 200){
        // print(response.data);
        var dataReceived = response.data;
        if(dataReceived['message'] == "log taken"){
          setState(() {
            candidates_numController.text = dataReceived['candidate_num'];
            phoneController.text = dataReceived['phone'];
            streetController.text = dataReceived['street'];
            areaController.text = dataReceived['area'];
            regionController.text = dataReceived['region'];
          });
        }else{
          print("Query Failed");
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
  //end of function to retrieve report

  List<String> regionList = ["Arusha","Kilimanjaro","Singida","Loliondo","Ruvuma","Songwe","Manyara"];
  String? valueRegion;
  GlobalKey keyReport = GlobalKey<FormState>();
  @override  
  Widget build(BuildContext context ){
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        // color: Colors.red
      ),
      child: Column(
        children: [
          Form(
            key: keyReport,
            child: Column(
              children: [
                TextFormField(
                  style: TextStyle(
                    color: Colors.white
                  ),
                  controller: candidates_numController,
                  decoration: InputDecoration(
                    hintText: "Admission Number......",
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
                      Icons.person,
                      color: Colors.grey[400],
                    )
                  ),
                ),
                SizedBox(height: 10,),
                TextFormField(
                  style: TextStyle(
                    color: Colors.white
                  ),
                  controller: phoneController,
                  decoration: InputDecoration(
                    hintText: "Phone Number",
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
                      Icons.phone_android_outlined,
                      color: Colors.grey[400],
                    )
                  ),
                ),
                SizedBox(height: 10,),
                TextFormField(
                  style: TextStyle(
                    color: Colors.white
                  ),
                  controller: regionController,
                  decoration: InputDecoration(
                    hintText: "Region",
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
                      Icons.home,
                      color: Colors.grey[400],
                    )
                  ),
                ),
                // DropdownButtonFormField<String>(
                //   dropdownColor: Color(0xFF1A3A6F),
                //   icon: Icon(
                //     Icons.arrow_drop_down,
                //     color: Colors.grey[400],
                //   ),
                //   isExpanded: true,
                //   decoration: InputDecoration(
                //     fillColor: Color(0xFF1A3A6F),
                //     filled: true,
                //     enabledBorder: OutlineInputBorder(
                //       borderRadius: BorderRadius.circular(10),
                //       borderSide: BorderSide.none
                //     ),
                //     focusedBorder: OutlineInputBorder(
                //       borderRadius: BorderRadius.circular(10),
                //       borderSide: BorderSide.none
                //     ),
                //     prefixIcon: Icon(
                //       Icons.home,
                //       color: Colors.grey,
                //     )
                //   ),
                //   hint: Text("Choose Region",
                //   style: TextStyle(
                //     color: Colors.white
                //   ),
                //   ),
                //   value: valueRegion,
                //   onChanged: (newValue){
                //     setState(() {
                //       valueRegion = newValue;
                //     });
                //   },
                //   items: regionList.map((regionLists){
                //     return DropdownMenuItem(
                //       value: regionLists,
                //       child: Text(regionLists,
                //       style: TextStyle(
                //         color: Colors.white70
                //       ),
                //       ),
                //     );
                //   }).toList(),
                // ),
                SizedBox(height: 10,),
                TextFormField(
                  style: TextStyle(
                    color: Colors.white
                  ),
                  controller: streetController,
                  decoration: InputDecoration(
                    hintText: "Street",
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
                      Icons.streetview,
                      color: Colors.grey[400],
                    )
                  ),
                ),
                SizedBox(height: 10,),
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxHeight: 150,
                    minHeight: 150
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        child: TextFormField(
                          style: TextStyle(
                            color: Colors.white
                          ),
                          controller: areaController,
                          expands: true,
                          keyboardType: TextInputType.multiline,
                          textAlignVertical: TextAlignVertical.top,
                          maxLines: null,
                          decoration: InputDecoration(
                            hintText: "Describe the area of your industrial practical training",
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
                              Icons.app_registration_outlined,
                              color: Colors.grey[400],
                            )
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10,),
                // Row(
                //   children: [
                //     Expanded(
                //       child: ClipRRect(
                //         borderRadius: BorderRadius.circular(10),
                //         child: MaterialButton(
                //           onPressed: (){
                //             print("Thank God");
                //           },
                //           height: 50,
                //           color: Color(0xFF5DADE2),
                //           textColor: Colors.white,
                //           child: Text("Submit"),
                //         ),
                //       ),
                //     )
                //   ],
                // )
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


