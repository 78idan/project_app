import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:intl/intl.dart';



// void main(){
//   runApp(
//     adminIndustrial1_1()
//   );
// }

// class adminIndustrial1_1 extends StatelessWidget{
//   @override  
//   Widget build(BuildContext context ){
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: adminIndustrial1_2(),
//     );
//   }
// }



class adminIndustrial1_2 extends StatefulWidget{
      final String IpAddress;
  adminIndustrial1_2({ required this.IpAddress });
  @override  
  adminIndustrial1_3 createState()=> adminIndustrial1_3();
}


class adminIndustrial1_3 extends State<adminIndustrial1_2>{
  @override  
  Widget build(BuildContext context ){
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Color(0xFF002147),
        appBar: adminIndustrialAppBar(context),
        body: TabBarView(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    adminIndustrialTextField1_1(IpAddress: widget.IpAddress,)
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
                    scheduleTextField1_1(IpAddress: widget.IpAddress,)
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

PreferredSizeWidget adminIndustrialAppBar(BuildContext context){
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
        Tab(text: "Register",),
        Tab(text: "Schedule",)
      ],
    ),
  );
}

class adminIndustrialTextField1_1 extends StatefulWidget{
  final String IpAddress;
  adminIndustrialTextField1_1({ required this.IpAddress });
  @override  
  adminIndustrialTextField1_2 createState()=> adminIndustrialTextField1_2();
}

class adminIndustrialTextField1_2 extends State<adminIndustrialTextField1_1>{
  String? regionValue;
  // String? courseValue;
  // String? levelValue;
  List<String> regionList = ['Arusha',"Manyara","Kigoma","Dar Es Salaam","Singida","Dododma"];
  // List<String> courseList = ["Computer Science","Information Technology"];
  // List<String> levelList = ["Level 4","Level 5","Level 6","Level 7-1","Level 7-2","Level 8"];
  final keyIndustrial = GlobalKey<FormState>();

  TextEditingController LectureAdmissionNumber1 = TextEditingController();
  TextEditingController LectureAdmissionNumber2 = TextEditingController();
  TextEditingController LectureAdmissionNumber3 = TextEditingController();
  TextEditingController markerController = TextEditingController();

//start of validation function
Future<void> validateIndutrialRegister() async {
  if(regionValue == null || regionValue!.isEmpty){
     customNotification.notificationCustom(context, message: "Region empty");
  }else if(LectureAdmissionNumber1.text.isEmpty){
     customNotification.notificationCustom(context, message: "Admission 1 empty");
  }else if(LectureAdmissionNumber2.text.isEmpty){
     customNotification.notificationCustom(context, message: "Admission 2 empty");
  }else if(LectureAdmissionNumber3.text.isEmpty){
     customNotification.notificationCustom(context, message: "Admission 3 empty");
  }else if(markerController.text.isEmpty){
     customNotification.notificationCustom(context, message: "marker is empty");
  }else {
    await  registerIndustrial();
  }
} 
//end of validation function   

//start of registering industrial function
Future<void> registerIndustrial() async{
      Dio dio = Dio(
        BaseOptions(
          connectTimeout: Duration(seconds: 10),
          receiveTimeout: Duration(seconds: 10)
        )
      );

      try{
        var ipAddress = widget.IpAddress;
        var url = "http://$ipAddress/project_app/admin_industrial.php";
        var data1 = {
          "regionValue": regionValue,
          "LectureAdmissionNumber1": LectureAdmissionNumber1.text,
          "LectureAdmissionNumber2": LectureAdmissionNumber2.text,
          "LectureAdmissionNumber3": LectureAdmissionNumber3.text,
          "marker": markerController.text,
        };
        // print(departmentValue);
        Response response = await dio.post(
          url,
          data: FormData.fromMap(data1)
        );

        if(response.statusCode == 200){
          // print(response.data);
          var dataReceived = response.data;
          if (dataReceived['message'] == "supervisors enrolled"){
            LectureAdmissionNumber1.clear();
            LectureAdmissionNumber2.clear();
            LectureAdmissionNumber3.clear(); 
            markerController.clear();          
            customNotification.notificationCustom(context, message: dataReceived['message'],picIcon: Icon(Icons.check_circle,color: Colors.white,size: 14,));
          }else{
            LectureAdmissionNumber1.clear();
            LectureAdmissionNumber2.clear();
            LectureAdmissionNumber3.clear();   
            markerController.clear();          
            customNotification.notificationCustom(context, message: dataReceived['message']);
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
//ending of registering industrial function




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
                  Icons.engineering,
                  size: 45,
                ),
              )
            ],
          ),
          SizedBox(height: 15,),
          Form(
            key: keyIndustrial,
            child: Column(
              children: [
                DropdownButtonFormField<String>(
                  dropdownColor: Color(0xFF1A3A6F),
                  // style: TextStyle(
                  //   color: Colors.white
                  // ),
                  icon: Icon(
                    Icons.arrow_drop_down,
                    color: Colors.white70,
                  ),
                  isExpanded: true,
                  decoration: InputDecoration(
                    fillColor: Color(0xFF1A3A6F),
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10)
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10)
                    )
                  ),
                  hint: Text("Choose Region",
                  style: TextStyle(
                    color: Colors.white70
                  ),
                  ),
                  
                  value: regionValue,
                  onChanged: (newValue){
                    setState(() {
                      regionValue = newValue;
                    });
                  },
                  items: regionList.map((regionLists){
                    return DropdownMenuItem(
                      value: regionLists,
                      child: Text(regionLists,
                      style: TextStyle(
                        color: Colors.white70
                      ),
                      ),
                    );
                  }).toList(),
                ),                                                                                            
                SizedBox(height: 10,),
                TextFormField(
                  controller: LectureAdmissionNumber1,
                  style: TextStyle(
                    color: Colors.white
                  ),
                  decoration: InputDecoration(
                    hintText: "Lecture One Admission Number",
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
                  controller: LectureAdmissionNumber2,
                  style: TextStyle(
                    color: Colors.white
                  ),
                  decoration: InputDecoration(
                    hintText: "Lecture Two Admission Number",
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
                  controller: LectureAdmissionNumber3,
                  style: TextStyle(
                    color: Colors.white
                  ),
                  decoration: InputDecoration(
                    hintText: "Lecture Three Admission Number",
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
                  controller: markerController,
                  style: TextStyle(
                    color: Colors.white
                  ),
                  decoration: InputDecoration(
                    hintText: "Marker",
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
                SizedBox(height: 15,),                              
                Row(
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: MaterialButton(
                          onPressed: (){
                            validateIndutrialRegister();
                          },
                          textColor: Colors.white,
                          color: Color(0xFF5DADE2),
                          height: 50,
                          child: Text("Save"),
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

class scheduleTextField1_1 extends StatefulWidget{
  final String IpAddress;
  scheduleTextField1_1({ required this.IpAddress });  
  @override  
  scheduleTextField1_2 createState()=> scheduleTextField1_2();
}

class scheduleTextField1_2 extends State<scheduleTextField1_1>{
  // String? regionValue;
  // String? courseValue;
  // String? levelValue;
  // List<String> regionList = ['Arusha',"Manyara","Kigoma","Dar Es Salaam","Singida","Dododma"];
  // List<String> courseList = ["Computer Science","Information Technology"];
  // List<String> levelList = ["Level 4","Level 5","Level 6","Level 7-1","Level 7-2","Level 8"];
  final keyScheduleUp = GlobalKey<FormState>();
  TextEditingController startingDate = TextEditingController();
  TextEditingController endingDate = TextEditingController();
  final DateFormat dateFormat = DateFormat('yyyy-MM-dd');

  //start of void function
  @override  
  void initState(){
    super.initState();
    retrieveDate();
  }
  //end of void function

  //start of retrieving date data
  Future<void> retrieveDate() async {
    String dateData = "date retrieved";
    try{
      Dio dio = Dio(
        BaseOptions(
          connectTimeout: Duration(seconds: 15),
          receiveTimeout: Duration(seconds: 15)
        )
      );
      var IpAddress = widget.IpAddress;
      var dataSend = {
        "dateData": dateData
      };

      var UrlSend = "http://${IpAddress}/project_app/date_retrieve.php";

      Response response = await dio.post(
        UrlSend,
        data: FormData.fromMap(dataSend)
      );

      if(response.statusCode == 200){
        print("Thank God");
        print(response.data);
        var dataReceived = response.data;
        if(dataReceived['message'] == "date not empty"){
          setState(() {
            startingDate.text = dataReceived['startingDate'];
            endingDate.text = dataReceived['endingDate'];
          });
        }else{
          print("Data empty");
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
  //end of retrieving date data
//start of validation function
Future<void> validateScheduleRegister() async {
  if(startingDate.text.isEmpty){
     customNotification.notificationCustom(context, message: "Starting date empty");
  }else if(endingDate.text.isEmpty){
     customNotification.notificationCustom(context, message: "Ending Date empty");
  }else {
    await registerSchedule();
  }
} 
//end of validation function
//start of date function 1
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(), // current date
      firstDate: DateTime(2000), // earliest date allowed
      lastDate: DateTime(2101), // latest date allowed
    );

    if (picked != null) {
      setState(() {
        startingDate.text = DateFormat('yyyy-MM-dd').format(picked);
      });
    }
  }
//end of date function 1

//start of date function 2
  Future<void> _selectDate2(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(), // current date
      firstDate: DateTime(2000), // earliest date allowed
      lastDate: DateTime(2101), // latest date allowed
    );

    if (picked != null) {
      setState(() {
        endingDate.text = DateFormat('yyyy-MM-dd').format(picked);
      });
    }
  }
//end of date function 2

//start of registering schedule function
Future<void> registerSchedule() async{
      Dio dio = Dio(
        BaseOptions(
          connectTimeout: Duration(seconds: 10),
          receiveTimeout: Duration(seconds: 10)
        )
      );

      try{
        var ipAddress = widget.IpAddress;
        var url = "http://$ipAddress/project_app/admin_schedule.php";
        var data1 = {
          "startingDate": startingDate.text,
          "endingDate": endingDate.text,
        };
        // print(departmentValue);
        Response response = await dio.post(
          url,
          data: FormData.fromMap(data1)
        );

        if(response.statusCode == 200){
          // print(response.data);
          var dataReceived = response.data;
          if (dataReceived['message'] == "schedule enrolled"){
            startingDate.clear();
            endingDate.clear();
            customNotification.notificationCustom(context, message: dataReceived['message'],picIcon: Icon(Icons.check_circle,color: Colors.white,size: 14,));
            retrieveDate();
          }else{
            startingDate.clear();
            endingDate.clear();            
            customNotification.notificationCustom(context, message: dataReceived['message']);
            retrieveDate();
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
//ending of registering schedule function



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
                  Icons.lock_clock,
                  size: 45,
                ),
              )
            ],
          ),
          SizedBox(height: 15,),
          Form(
            key: keyScheduleUp,
            child: Column(
              children: [                                                                                           
                SizedBox(height: 10,),
                TextFormField(
                  onTap: (){
                    _selectDate(context);
                  },
                  controller: startingDate,
                  readOnly: true,
                  style: TextStyle(
                    color: Colors.white
                  ),
                  decoration: InputDecoration(
                    hintText: "Starting Date",
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
                      Icons.date_range,
                      color: Colors.grey[400],
                    )
                  ),
                ),  
                SizedBox(height: 10,),
                TextFormField(
                  readOnly: true,
                  controller: endingDate,
                  style: TextStyle(
                    color: Colors.white
                  ),
                  onTap: (){
                    _selectDate2(context);
                  },
                  decoration: InputDecoration(
                    hintText: "Ending Date",
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
                      Icons.calendar_month,
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
                            validateScheduleRegister();
                            // DateTime? start = DateTime.tryParse(startingDate.text);
                            // DateTime? end = DateTime.tryParse(endingDate.text);
                            // if(start!.isAfter(end!)){
                            //   print("Thanks God");
                            // }
                            // String formattedDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
                            // print(formattedDate);
                          },
                          textColor: Colors.white,
                          color: Color(0xFF5DADE2),
                          height: 50,
                          child: Text("Save"),
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




