import 'package:flutter/material.dart';
import 'package:project_app/lecture_dashboard/lecture_module/lecture_module.dart';
import 'package:dio/dio.dart';
import 'package:intl/intl.dart';
import 'package:project_app/lecture_dashboard/lecture_log/lecture_name.dart';
// void main(){
//   runApp(
//     lecture_home1_1()
//   );
// }

// class lecture_home1_1 extends StatelessWidget{
//   @override  
//   Widget build(BuildContext context ){
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: lecture_home1_2(),
//     );
//   }
// }


class lecture_home1_2 extends StatefulWidget{
  final String admission_number; 
  final String IpAddress;
  final String nameIdentity;  
  final String department;

  lecture_home1_2({ required this.admission_number,  required this.IpAddress, required this.nameIdentity, required this.department , });
  @override  
  lecture_home1_3 createState()=> lecture_home1_3();
}


class lecture_home1_3 extends State<lecture_home1_2>{

  String first_name = "";
  String last_name = "";
  String role = "";

  // String lecture_admissionNumber = "22050513037";
  // start of check Ipt function
  Future<void> check_Ipt() async {
    String check = "hey";
    try{
      Dio dio = Dio(
        BaseOptions(
          connectTimeout: Duration(seconds: 15),
          receiveTimeout: Duration(seconds: 15)
        )
      );
      var IpAddress = widget.IpAddress;
      var UrlIpt = "http://${IpAddress}/project_app/check_ipt.php";
      DateTime RecentDate = DateTime.parse(DateFormat('yyyy-MM-dd').format(DateTime.now()));
      var dataSent = {
        "check": check
      };

      Response response = await dio.post(
        UrlIpt,
        data: FormData.fromMap(dataSent)
      );

      if(response.statusCode == 200){
        // print(response.data);
        var dateRecieved = response.data;
        if (dateRecieved['message'] == "chosen ipt"){
          String startingDate = dateRecieved['start'];
          String endingDate = dateRecieved['end'];
          DateTime? start = DateTime.tryParse(startingDate);
          DateTime? end = DateTime.tryParse(endingDate);
          
          if(RecentDate.isBefore(start!)){
            // print("Thank God");
            customNotification.notificationCustom(context, message: "The session is not yet opened");
          }else if(RecentDate.isAfter(end!)){
            customNotification.notificationCustom(context, message: "The session has been closed");
          }else{
            // print("Thank God twice");
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context)=>student_no1_2(IpAddress: widget.IpAddress)
              )
            );            
          }

        }
      }

    }catch(e){
      if(e is DioException){
        switch(e.type){
          case DioExceptionType.connectionTimeout:
               print("connectionTimeOut : ${e.message}");
               break;
          case DioExceptionType.connectionError:
               print("connectionError: ${e.message} ");
               break;
          case DioExceptionType.sendTimeout:
               print("sendTimeOut: ${e.message}");
               break;
          case DioExceptionType.receiveTimeout:
               print("receive TimeOut: ${e.message} ");
               break;
          case DioExceptionType.badCertificate:
               print("certificate: ${e.message} ");
               break;
          case DioExceptionType.badResponse:
               print("bad response: ${e.message} ");
               break;
          case DioExceptionType.unknown:
               print("Unknown error: ${e.message} ");
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
  // start of check Ipt function


  // start list container function
  List<Widget> gridContainers(BuildContext context){
    return [
      GestureDetector(
        onTap: (){
          // print("Modules enrolled");
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => lecture_module1_2(admission_number: widget.admission_number, IpAddress: widget.IpAddress),
            )
          );
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Color(0xFF48C9B0)
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.book,
                size: 50,
                color: Colors.white,
              ),
              SizedBox(height: 10,),
              Text("Modules \n Enrolled",
              style: TextStyle(
                color: Colors.white,
                fontFamily: "PlayfairDisplay",
                fontSize: 16,
              ),
              )
            ],
          ),
        ),
      ),
      GestureDetector(
        onTap: (){
          // print("Industrial section");
          check_Ipt();
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Color(0xFFF7DC6F)
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.engineering,
                size: 50,
                color: Colors.white,
              ),
              SizedBox(height: 10,),
              Text("Industrial \n Section",
              style: TextStyle(
                color: Colors.white,
                fontFamily: "PlayfairDisplay",
                fontSize: 16,
              ),
              )
            ],
          ),
        ),
      )      
    ];
  }
  // end list container function

  // start initState function
  void initState(){
    super.initState();
    retrieveName();
  }
  // end initState function


  //start of function to retrieve fname and lname
  Future<void> retrieveName() async {
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

      var dataSend = {
        "admission_number": widget.admission_number,
      };

      var UrlDataSend = "http://${widget.IpAddress}/project_app/lecture_home.php";

      Response response = await dio.post(
        UrlDataSend,
        data: FormData.fromMap(dataSend)
      );

      if(response.statusCode == 200){
        // print(response.data);
        var dataRetrived = response.data;
        if(dataRetrived['message'] == "Data retrieved"){
          setState((){
            first_name = dataRetrived['fname'];
            last_name = dataRetrived['lname'];
            role = dataRetrived['role'];
          });
        }
      }

    }catch(e){
      if(e is DioException){
        switch(e.type){
          case DioExceptionType.connectionTimeout:
               print("connectionTimeOut : ${e.message}");
               break;
          case DioExceptionType.connectionError:
               print("connectionError: ${e.message} ");
               break;
          case DioExceptionType.sendTimeout:
               print("sendTimeOut: ${e.message}");
               break;
          case DioExceptionType.receiveTimeout:
               print("receive TimeOut: ${e.message} ");
               break;
          case DioExceptionType.badCertificate:
               print("certificate: ${e.message} ");
               break;
          case DioExceptionType.badResponse:
               print("bad response: ${e.message} ");
               break;
          case DioExceptionType.unknown:
               print("Unknown error: ${e.message} ");
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
  //end of function to retrieve fname and lname
  @override  
  Widget build(BuildContext context){

    final containersGrid = gridContainers(context);

    return Scaffold(
      backgroundColor: Color(0xFF002147),
      body: Stack(
        children: [
          Positioned(
            left: 14,
            top: 45,
            child: Row(
              children: [
                CircleAvatar(
                  radius: 28,
                  child: Icon(
                    Icons.person,
                    size: 40,
                  ),
                ),
                SizedBox(width: 10,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(first_name+" "+ last_name,
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: "PlayfairDisplay",
                      color: Colors.white
                    ),
                    ),
                    Text(role,
                    style: TextStyle(
                      fontFamily: "PlayfairDisplay",
                      fontSize: 15,
                      color: Colors.white
                    ),
                    )
                  ],
                )
              ],
            ),
          ),

          Positioned(
            top: 120,
            right: 16,
            left: 16,
            
            child: Container(
              height: 300,
              child: GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 1
                ),
                itemCount: containersGrid.length,
                itemBuilder: (BuildContext context,index){
                  return containersGrid[index];
                },
              ),
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
        bottom: 100,
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



