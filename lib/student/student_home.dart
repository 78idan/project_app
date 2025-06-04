import 'package:flutter/material.dart';
import 'package:project_app/student/student_module/student_module.dart';
import 'package:dio/dio.dart';
import 'package:intl/intl.dart';
import 'package:project_app/student/student_log/student_week.dart';

// void main(){
//   runApp(
//     student_home1_1()
//   );
// }

// class student_home1_1 extends StatelessWidget{
//   @override  
//   Widget build(BuildContext context ){
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: student_home1_2(),
//     );
//   }
// }


class student_home1_2 extends StatefulWidget{
  final String IpAddress;
  final String candidee_num;
  final String nameIdentity;
  student_home1_2({ required this.IpAddress , required this.candidee_num, required this.nameIdentity });  
  @override  
  student_home1_3 createState()=> student_home1_3();

}



class student_home1_3 extends State<student_home1_2>{

  // String candidee_num = "22050513040";
  String candidee_level = "";
  // String IpAddress = "192.168.108.102";
  String first_name = "";
  String last_name = "";
  String role = "";
  //start of initState function
  @override 
  void initState(){
    super.initState();
    retrieveProfile();
  }
  //end of initState function

  //start of function to retrieve name for profile page
  Future<void> retrieveProfile() async {
    try{
      Dio dio = Dio(
        BaseOptions(
          connectTimeout: Duration(seconds: 15),
          receiveTimeout: Duration(seconds: 15)
        ),
      );
      var IpAddress = widget.IpAddress;
      var Url = "http://${IpAddress}/project_app/student_profile.php";
      var dataSent = {
        "candidee_num": widget.candidee_num
      };

      Response response = await dio.post(
        Url,
        data: FormData.fromMap(dataSent)
      );

      if(response.statusCode == 200){
        // print(response.data);
        var dataReceived = response.data;
        if(dataReceived['message'] == "Data received"){
          setState(() {
            first_name = dataReceived['fname'];
            last_name = dataReceived['lname'];
            role = dataReceived['role'];
            candidee_level = dataReceived['level'];
          });
        }else{
          print(dataReceived['message']);
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
  //end of function to retrieve name for profile page  

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
              builder: (context)=>week1_2(candidate_num: widget.candidee_num, IpAddress: widget.IpAddress, candidate_level: candidee_level, nameIdentity: widget.nameIdentity, )
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

  List<Widget> gridWidget (BuildContext context) {
    return [
      GestureDetector(
        onTap: (){
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context)=>student_module1_2(candidee_num: widget.candidee_num, candidee_level: candidee_level, IpAddress: widget.IpAddress)
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
                Icons.book_sharp,
                size: 50,
                color: Colors.white,
              ),
              SizedBox(
                height: 10,
              ),
              Text("Module\nEnrolled",
              style: TextStyle(
                color: Colors.white,
                fontFamily: "PlayfairDisplay"
              ),
              )
            ],
          ),
        ),
      ),
      GestureDetector(
        onTap: (){
          // print("Industrial Practical training");
          check_Ipt();
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Color(0xFFF7DC6F),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.engineering,
                size: 50,
                color: Colors.white,
              ),
              Text("Industrial Training\n Section",
              style: TextStyle(
                color: Colors.white,
                fontFamily: "PlayfairDisplay"
              ),
              )
            ],
          ),
        ),
      )
    ];
  }




  @override  
  Widget build(BuildContext context){

    final widgetGrid = gridWidget(context);

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
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.person,
                    size: 40,
                  ),
                ),
                SizedBox(width: 10,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("$first_name $last_name",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "PlayfairDisplay",
                      fontSize: 14
                    ),
                    ),
                    Text("$role",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "PlayfairDisplay",
                      fontSize: 15
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
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 1,
                ),
                itemCount: widgetGrid.length,
                itemBuilder: (BuildContext context, index){
                  return widgetGrid[index];
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}



