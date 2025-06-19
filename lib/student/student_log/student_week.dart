import 'package:flutter/material.dart';
// import 'package:weeklist/day.dart';
import 'package:project_app/student/student_log/student_day.dart';
import 'package:intl/intl.dart';
import "package:dio/dio.dart";
import 'package:project_app/student/student_log/industrySignatureScreen.dart';
import 'package:project_app/student/student_log/student_report.dart';
// void main(){
//   runApp(
//     week1_1()
//   );
// }


// class week1_1 extends StatelessWidget{
//   @override 
//   Widget build(BuildContext context){
//     return MaterialApp(
//       home: week1_2(),
//       debugShowCheckedModeBanner: false,
//     );
//   }
// }

class week1_2 extends StatefulWidget{
  final String candidate_num;
  final String IpAddress;
  final String candidate_level;
  final String nameIdentity;
  final String department;
  final String course;  
  week1_2({required this.candidate_num, required this.IpAddress, required this.candidate_level, required this.nameIdentity, required this.department, required this.course });
  @override  
  week1_3 createState()=> week1_3();
}


class week1_3 extends State<week1_2>{
  @override  
  Widget build(BuildContext context){
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Color(0xFF002147),
        appBar: weekAppBar(context),
        body: TabBarView(
          children: [
            Padding(
              padding: EdgeInsets.all(16),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    example1(candidate_num: widget.candidate_num, IpAddress: widget.IpAddress, candidate_level: widget.candidate_level,nameIdentity: widget.nameIdentity,)
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
                    report1_1(candidate_num: widget.candidate_num, IpAddress: widget.IpAddress, candidate_level: widget.candidate_level, nameIdentity: widget.nameIdentity,)
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: markContainer1_1(candidate_num: widget.candidate_num, IpAddress: widget.IpAddress, candidate_level: widget.candidate_level, nameIdentity: widget.nameIdentity, department: widget.department, course: widget.course)
                ),
            ),
          ],
        ),
        ),
    );
    
  }
}

PreferredSizeWidget weekAppBar(BuildContext context){
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
        Tab(text: "Report",),
        Tab(text: "Marks",)
      ],
    ),
  );
}


class example1 extends StatefulWidget{
  final String candidate_num;
  final String IpAddress;
  final String candidate_level;
  final String nameIdentity;
  example1({required this.candidate_num, required this.IpAddress, required this.candidate_level, required this.nameIdentity });  
  @override   
  example1_1 createState()=> example1_1();
}

class example1_1 extends State<example1>{
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
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context)=> studentTechnical_report1_2(candidate_num: widget.candidate_num, IpAddress: widget.IpAddress, candidate_level: widget.candidate_level, nameIdentity: widget.nameIdentity)
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
                                Text("Technical report ",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18
                                ),
                                ),
                                Icon(
                                  Icons.book,
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
                        SizedBox(height: 5,),                                                
                        GestureDetector(
                          onTap: (){
                            String week = "week 1";
                            // print("Thank God");
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context)=>day1_2(candidate_num: widget.candidate_num, IpAddress: widget.IpAddress, candidate_level: widget.candidate_level, week: week)
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
                                builder: (context)=>day1_2(candidate_num: widget.candidate_num, IpAddress: widget.IpAddress, candidate_level: widget.candidate_level, week: week)
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
                                builder: (context)=>day1_2(candidate_num: widget.candidate_num, IpAddress: widget.IpAddress, candidate_level: widget.candidate_level, week: week)
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
                                builder: (context)=>day1_2(candidate_num: widget.candidate_num, IpAddress: widget.IpAddress, candidate_level: widget.candidate_level, week: week)
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
                                builder: (context)=>day1_2(candidate_num: widget.candidate_num, IpAddress: widget.IpAddress, candidate_level: widget.candidate_level, week: week)
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
                                builder: (context)=>day1_2(candidate_num: widget.candidate_num, IpAddress: widget.IpAddress, candidate_level: widget.candidate_level, week: week)
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
                                builder: (context)=>day1_2(candidate_num: widget.candidate_num, IpAddress: widget.IpAddress, candidate_level: widget.candidate_level, week: week)
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
                                builder: (context)=>day1_2(candidate_num: widget.candidate_num, IpAddress: widget.IpAddress, candidate_level: widget.candidate_level, week: week)
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
                                builder: (context)=>day1_2(candidate_num: widget.candidate_num, IpAddress: widget.IpAddress, candidate_level: widget.candidate_level, week: week)
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
                                builder: (context)=>day1_2(candidate_num: widget.candidate_num, IpAddress: widget.IpAddress, candidate_level: widget.candidate_level, week: week)
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


class report1_1 extends StatefulWidget{
  final String candidate_num;
  final String IpAddress;
  final String candidate_level;
  final String nameIdentity;
  report1_1({required this.candidate_num, required this.IpAddress, required this.candidate_level, required this.nameIdentity });  
  @override  
  report1_2 createState()=> report1_2();
}

class report1_2 extends State<report1_1>{

  //start of validating function
  Future<void> validatingController() async {
    if(valueRegion == null || streetController.text.isEmpty || areaController.text.isEmpty || phoneController.text.isEmpty ){
      customNotification.notificationCustom(context, message: "Thre is an empty field");
    }else{
      reportFunction();
    }
  } 
  //end of validating function

  // start of report function
  Future<void> reportFunction() async {
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
        "nameIdentity": widget.nameIdentity,
        "valueRegion": valueRegion,
        "street": streetController.text,
        "phone": phoneController.text,
        "area": areaController.text
      };

      var UrlSend = "http://${IpAddress}/project_app/student_report.php";

      Response response = await dio.post(
        UrlSend,
        data: FormData.fromMap(dataSend)
      );

      if(response.statusCode == 200){
        print(response.data);
        var dataReceived = response.data;

        if(dataReceived['message'] == "Report Submitted"){
          customNotification.notificationCustom(context, message: dataReceived['message']);
          setState(() {
            streetController.clear();
            phoneController.clear();
            areaController.clear();
          });
        }else{
          customNotification.notificationCustom(context, message: dataReceived['message']);
          setState(() {
            streetController.clear();
            phoneController.clear();
            areaController.clear();
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
  // end of report function

  List<String> regionList = ["Arusha","Kilimanjaro","Singida","Loliondo","Ruvuma","Songwe","Manyara"];
  String? valueRegion;
  GlobalKey keyReport = GlobalKey<FormState>();
  // TextEditingController regionController = TextEditingController();
  TextEditingController streetController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController areaController = TextEditingController();

  

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
                DropdownButtonFormField<String>(
                  dropdownColor: Color(0xFF1A3A6F),
                  icon: Icon(
                    Icons.arrow_drop_down,
                    color: Colors.grey[400],
                  ),
                  isExpanded: true,
                  decoration: InputDecoration(
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
                      color: Colors.grey,
                    )
                  ),
                  hint: Text("Choose Region",
                  style: TextStyle(
                    color: Colors.white
                  ),
                  ),
                  value: valueRegion,
                  onChanged: (newValue){
                    setState(() {
                      valueRegion = newValue;
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
                TextFormField(
                  style: TextStyle(
                    color: Colors.white
                  ),
                  controller: phoneController,
                  decoration: InputDecoration(
                    hintText: "Phone Number(eg 255766531122)",
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
                      Icons.phone,
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
                Row(
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: MaterialButton(
                          onPressed: (){
                            // print("Thank God");
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
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}



class markContainer1_1 extends StatefulWidget{
  final String candidate_num;
  final String IpAddress;
  final String candidate_level;
  final String nameIdentity;
  final String department;
  final String course;  
  markContainer1_1({required this.candidate_num, required this.IpAddress, required this.candidate_level, required this.nameIdentity, required this.department, required this.course });  
  @override
  markContainer1_2 createState()=> markContainer1_2();
}

class markContainer1_2 extends State<markContainer1_1>{
  GlobalKey markKey = GlobalKey<FormState>();
  String? industrySupervisorSignatureUrl = null;
  //start of another controller
  TextEditingController companyController = TextEditingController();
  TextEditingController officerController = TextEditingController();
  TextEditingController reportDateController = TextEditingController();
  TextEditingController finishDateController = TextEditingController();
  TextEditingController withPermissionController = TextEditingController();
  TextEditingController withoutPermissionController = TextEditingController();
  TextEditingController opinionSkillController = TextEditingController();
  TextEditingController opinionAdequacyController = TextEditingController();
  //end of another controller
   
  // start of score controller
  TextEditingController dateController = TextEditingController();
  TextEditingController abilityController = TextEditingController();
  TextEditingController selectionController = TextEditingController();
  TextEditingController excecutionController = TextEditingController();
  TextEditingController finishedController = TextEditingController();
  TextEditingController selfController = TextEditingController();
  TextEditingController cooperationController = TextEditingController();
  TextEditingController attendanceController = TextEditingController();
  TextEditingController obedienceController = TextEditingController();
  TextEditingController initiativeController = TextEditingController();
  TextEditingController willingController = TextEditingController();
  TextEditingController totalController = TextEditingController();
  String abilityText = "";
  String selectionText = "";
  String excecutionText = "";
  String finishedText = "";  
  String selfText = "";
  String cooperationText = "";
  String attendanceText = "";
  String obedienceText = "";
  String initiativeText= "";
  String willingText= "";
  String totalText= "";
  // start of score controller


  //start of retrieving data
  Future<void>  retrievingStudentMarks() async {
    // String lectureMark = "lectureMark";
    String candidate_table =  widget.candidate_num+"_industry";
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

      var UrlSend = "http://${IpAddress}/project_app/studentMarks_retrieve.php";

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
            officerController.text = dataRetrieved['supervisor'];
            totalController.text = dataRetrieved['asses_score'];
            reportDateController.text = dataRetrieved['report_date'];
            finishDateController.text = dataRetrieved['finish_date'];
            withPermissionController.text = dataRetrieved['permission_with'];
            withoutPermissionController.text = dataRetrieved['permission_without'];
            opinionSkillController.text = dataRetrieved['opinion_skill'];
            opinionAdequacyController.text = dataRetrieved['opinion_adequacy'];
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
  Future<void> submitStudentMarksFunction() async {
    String candidate_table = widget.candidate_num+"_industry";
    String student_name = widget.nameIdentity;
    String admin_no = widget.candidate_num;
    String level = widget.candidate_level;
    String department = widget.department;
    String program = widget.course;
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
        "supervisor": officerController.text,
        "student_name": student_name,
        "admin_no": admin_no,
        "level": level,
        "department": department,
        "program": program,
        "asses_score": totalController.text,
        "report_date": reportDateController.text,
        "finish_date": finishDateController.text,
        "permission_with": withPermissionController.text,
        "permission_without": withoutPermissionController.text,
        "opinion_skill": opinionSkillController.text,
        "opinion_adequacy": opinionAdequacyController.text,
        "calendar": dateController.text
      };

      var UrlSend = "http://${IpAddress}/project_app/studentMarks_send.php";

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
            officerController.clear();
            abilityController.clear();
            selectionController.clear();
            excecutionController.clear();
            finishedController.clear();
            selfController.clear();
            cooperationController.clear();
            attendanceController.clear();
            obedienceController.clear();
            initiativeController.clear();
            willingController.clear();
            totalController.clear();
            reportDateController.clear();
            finishDateController.clear();
            withPermissionController.clear();
            withoutPermissionController.clear();
            opinionSkillController.clear();
            opinionAdequacyController.clear();
            dateController.clear();
            customNotification.notificationCustom(context, message: 'submitted',picIcon: Icon(Icons.check,color: Colors.white,size: 14,));
            abilityText = "";
            selectionText = "";
            excecutionText = "";
            finishedText = "";  
            selfText = "";
            cooperationText = "";
            attendanceText = "";
            obedienceText = "";
            initiativeText= "";
            willingText= "";
            totalText= "";            
            retrievingStudentMarks();            
          });

        }else{
          setState(() {
            companyController.clear();
            officerController.clear();
            abilityController.clear();
            selectionController.clear();
            excecutionController.clear();
            finishedController.clear();
            selfController.clear();
            cooperationController.clear();
            attendanceController.clear();
            obedienceController.clear();
            initiativeController.clear();
            willingController.clear();
            totalController.clear();
            reportDateController.clear();
            finishDateController.clear();
            withPermissionController.clear();
            withoutPermissionController.clear();
            opinionSkillController.clear();
            opinionAdequacyController.clear();
            dateController.clear();
            customNotification.notificationCustom(context, message: 'You can`t submit',); 
            abilityText = "";
            selectionText = "";
            excecutionText = "";
            finishedText = "";  
            selfText = "";
            cooperationText = "";
            attendanceText = "";
            obedienceText = "";
            initiativeText= "";
            willingText= "";
            totalText= "";            
            retrievingStudentMarks();             
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
  Future<void> validatingFunction() async{
    if(abilityController.text.isEmpty || selectionController.text.isEmpty || excecutionController.text.isEmpty || finishedController.text.isEmpty || selfController.text.isEmpty || cooperationController.text.isEmpty || attendanceController.text.isEmpty || obedienceController.text.isEmpty || initiativeController.text.isEmpty || willingController.text.isEmpty || totalController.text.isEmpty || companyController.text.isEmpty || officerController.text.isEmpty || reportDateController.text.isEmpty  || finishDateController.text.isEmpty || withPermissionController.text.isEmpty || withoutPermissionController.text.isEmpty || opinionSkillController.text.isEmpty || opinionAdequacyController.text.isEmpty   ){
      customNotification.notificationCustom(context, message: "There is an empty input");
    }else{
      // customNotification.notificationCustom(context, message: "Thank God");
      submitStudentMarksFunction();
    }
  }
  //end of validating function
  //start of void initState function
  @override 
  void initState(){
    super.initState();
    retrievingStudentMarks();
    pictureSupervisorIndustryFunction();
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
    selectionController.addListener((){
      final selectionInput = double.tryParse(selectionController.text);
      if( selectionInput == null || selectionInput < 0 || selectionInput > 10){
        setState(() {
          selectionText = "Invalid number";
        });
      }else{
        setState(() {
          selectionText = "";
        });
      }
    }); 
    excecutionController.addListener((){
      final excecutionInput = double.tryParse(excecutionController.text);
      if( excecutionInput == null || excecutionInput < 0 || excecutionInput > 10){
        setState(() {
          excecutionText = "Invalid number";
        });
      }else{
        setState(() {
          excecutionText = "";
        });
      }
    });
    finishedController.addListener((){
      final finishedInput = double.tryParse(finishedController.text);
      if( finishedInput == null || finishedInput < 0 || finishedInput > 10){
        setState(() {
          finishedText = "Invalid number";
        });
      }else{
        setState(() {
          finishedText = "";
        });
      }
    }); 
    selfController.addListener((){
      final selfInput = double.tryParse(selfController.text);
      if( selfInput == null || selfInput < 0 || selfInput > 10){
        setState(() {
          selfText = "Invalid number";
        });
      }else{
        setState(() {
          selfText = "";
        });
      }
    }); 
    cooperationController.addListener((){
      final cooperationInput = double.tryParse(cooperationController.text);
      if( cooperationInput == null || cooperationInput < 0 || cooperationInput > 10){
        setState(() {
          cooperationText = "Invalid number";
        });
      }else{
        setState(() {
          cooperationText = "";
        });
      }
    }); 
    attendanceController.addListener((){
      final attendanceInput = double.tryParse(attendanceController.text);
      if( attendanceInput == null || attendanceInput < 0 || attendanceInput > 10){
        setState(() {
          attendanceText = "Invalid number";
        });
      }else{
        setState(() {
          attendanceText = "";
        });
      }
    }); 
    obedienceController.addListener((){
      final obedienceInput = double.tryParse(obedienceController.text);
      if( obedienceInput == null || obedienceInput < 0 || obedienceInput > 10){
        setState(() {
          obedienceText = "Invalid number";
        });
      }else{
        setState(() {
          obedienceText = "";
        });
      }
    });
    initiativeController.addListener((){
      final initiativeInput = double.tryParse(initiativeController.text);
      if( initiativeInput == null || initiativeInput < 0 || initiativeInput > 10){
        setState(() {
          initiativeText = "Invalid number";
        });
      }else{
        setState(() {
          initiativeText = "";
        });
      }
    }); 
    willingController.addListener((){
      final willingInput = double.tryParse(willingController.text);
      if( willingInput == null || willingInput < 0 || willingInput > 10){
        setState(() {
          willingText = "Invalid number";
        });
      }else{
        setState(() {
          willingText = "";
        });
      }
    });   



  // Add calculation listeners ONCE for all controllers that should be summed
  abilityController.addListener(_calculateTotal);
  selectionController.addListener(_calculateTotal);
  excecutionController.addListener(_calculateTotal);
  finishedController.addListener(_calculateTotal);
  selfController.addListener(_calculateTotal);
  cooperationController.addListener(_calculateTotal);
  attendanceController.addListener(_calculateTotal);
  obedienceController.addListener(_calculateTotal);
  initiativeController.addListener(_calculateTotal);
  willingController.addListener(_calculateTotal);

  totalController.text = "0";

                           
  }
  //end of void initState function

  //start of calculation function
  void _calculateTotal() {
    double ability = double.tryParse(abilityController.text) ?? 0.0;
    double selection = double.tryParse(selectionController.text) ?? 0.0;
    double excecution = double.tryParse(excecutionController.text) ?? 0.0;
    double finished = double.tryParse(finishedController.text) ?? 0.0;
    double self = double.tryParse(selfController.text) ?? 0.0;
    double cooperation = double.tryParse(cooperationController.text) ?? 0.0;
    double attendance = double.tryParse(attendanceController.text) ?? 0.0;
    double obedience = double.tryParse(obedienceController.text) ?? 0.0;
    double initiative = double.tryParse(initiativeController.text) ?? 0.0;
    double willing = double.tryParse(willingController.text) ?? 0.0;
    
    double total = ability + selection + excecution + finished + self + 
                  cooperation + attendance + obedience + initiative + willing;
    
    // Format the total to remove unnecessary decimal places
    totalController.text = total % 1 == 0 ? total.toInt().toString() : total.toString();
  }
  //end of calculation function

  //start of dispose function
  void dispose() {
    abilityController.dispose();
    selectionController.dispose();
    excecutionController.dispose();
    finishedController.dispose();
    selfController.dispose();
    cooperationController.dispose();
    attendanceController.dispose();
    obedienceController.dispose();
    initiativeController.dispose();
    willingController.dispose();
    totalController.dispose();
    super.dispose();
  }
  //end of dispose function


  // start of industry supervisor function picture
  Future<void> pictureSupervisorIndustryFunction() async {
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
  // end of industry supervisor function picture


  //start of checking signature function
  Future<void> checkingUploading() async {
    String candidate_table = widget.candidate_num+"_industry";
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

      var UrlSend = "http://${IpAddress}/project_app/industrySupervisor_checkUpload.php";

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
          if(industrySupervisorSignatureUrl == null){
            // print("Thank God first then Go");
            final result = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context)=>SignatureScreen(IpAddress: IpAddress, candidate_table: candidate_table,)
              )
            );

            if(result == true){
              await pictureSupervisorIndustryFunction();
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
                    Text("To: Employer/Company",
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
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          // color: Colors.red
                        ),
                        height: 50,
                        child: Text("I request you to give us your first hand assesment of our student on the given points below",
                        style: TextStyle(
                          color: Colors.green,
                          fontFamily: "PlayfairDisplay"
                        ),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 5,),
                Row(
                  children: [
                    Text("NAME OF TRAINING OFFICER",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "PlayfairDisplay"
                    ),
                    )
                  ],
                ),
                TextFormField(
                  controller: officerController,
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
                    Text("A: ASSESSMENT",
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
                        height: 30,
                        child: Text("1 Ability on Planning and carrying out assigned job",
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
                        child: Text("2 Selection and handling of proper tools",
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
                        controller: selectionController,
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
                    Text(selectionText,
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
                        child: Text("3 Excecution of assigned job",
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
                        controller: excecutionController,
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
                    Text(excecutionText,
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
                        child: Text("4 Finished job - tidiness and accuracy ",
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
                        controller: finishedController,
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
                    Text(finishedText,
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
                        child: Text("5 Self confidence ",
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
                        controller: selfController,
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
                    Text(selfText,
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
                        child: Text("6 Cooperation with other members of staff ",
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
                        controller: cooperationController,
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
                    Text(cooperationText,
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
                        child: Text("7 Attendance and punctuality",
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
                        controller: attendanceController,
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
                    Text(attendanceText,
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
                        child: Text("8 Obedience",
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
                        controller: obedienceController,
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
                    Text(obedienceText,
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
                        child: Text("9 Initiative(self driving)",
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
                        controller: initiativeController,
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
                    Text(initiativeText,
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
                        child: Text("10 Willingness to learn",
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
                        controller: willingController,
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
                    Text(willingText,
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
                          hintText: "100",
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
                SizedBox(height: 10,),
                Row(
                  children: [
                    Text("B: GENERAL INFORMATION",
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
                        child: Text("1 What date did the trainee report to your company",
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
                  controller: reportDateController,
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
                        child: Text("2 What date did the trainee finish the training program",
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
                  controller: finishDateController,
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
                        height: 40,
                        child: Text("3 How many days did the trainee not attend the training",
                        style: TextStyle(
                          color: Colors.white,
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
                    Text("(a)With your permission",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "PlayfairDisplay"
                    ),
                    )
                  ],
                ),
                TextFormField(
                  controller: withPermissionController,
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
                SizedBox(height: 8,),
                Row(
                  children: [
                    Text("(b)Without your permission",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "PlayfairDisplay"
                    ),
                    )
                  ],
                ),
                TextFormField(
                  controller: withoutPermissionController,
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
                        height: 40,
                        child: Text("4 What is your general opinion about trainee`s skills and attitudes",
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
                  controller: opinionSkillController,
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
                        height: 40,
                        child: Text("5 what is your opinion on the adequacy of our training at the college ",
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
                  controller: opinionAdequacyController,
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
          ),
        )
      ],
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
