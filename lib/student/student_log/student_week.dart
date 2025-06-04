import 'package:flutter/material.dart';
// import 'package:weeklist/day.dart';
import 'package:project_app/student/student_log/student_day.dart';
import "package:dio/dio.dart";
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
  week1_2({required this.candidate_num, required this.IpAddress, required this.candidate_level, required this.nameIdentity });
  @override  
  week1_3 createState()=> week1_3();
}


class week1_3 extends State<week1_2>{
  @override  
  Widget build(BuildContext context){
    return DefaultTabController(
      length: 2,
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
                    example1(candidate_num: widget.candidate_num, IpAddress: widget.IpAddress, candidate_level: widget.candidate_level)
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
            )
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
        Tab(text: "Report",)
      ],
    ),
  );
}


class example1 extends StatefulWidget{
  final String candidate_num;
  final String IpAddress;
  final String candidate_level;
  example1({required this.candidate_num, required this.IpAddress, required this.candidate_level });  
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
