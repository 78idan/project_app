import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:project_app/lecture_dashboard/lecture_profile/lectureChange_password.dart';
import 'package:project_app/home/login.dart';

// void main(){
//   runApp(
//     lecture_profile1_1()
//   );
// }

// class lecture_profile1_1 extends StatelessWidget{
//   @override  
//   Widget build(BuildContext context ){
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: lecture_profile1_2(),
//     );
//   }
// }

class lecture_profile1_2 extends StatefulWidget{
  final String admission_number;
  final String IpAddress;
  lecture_profile1_2({ required this.admission_number, required this.IpAddress });
  @override 
  lecture_profile1_3 createState()=> lecture_profile1_3();
}

class lecture_profile1_3 extends State<lecture_profile1_2>{
  @override  
  Widget build(BuildContext context){
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Color(0xFF002147),
      body: Padding(
        padding: EdgeInsets.fromLTRB(15, 25, 15, 0),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.17,
            ),
            profileLectureContainer1_1(admission_number: widget.admission_number, IpAddress: widget.IpAddress)
          ],
        ),
      ),
    );
  }

}


class profileLectureContainer1_1 extends StatefulWidget{
  final String admission_number;
  final String IpAddress;
  profileLectureContainer1_1({ required this.admission_number, required this.IpAddress });
  @override  
  profileLectureContainer1_2 createState()=> profileLectureContainer1_2();
}


class profileLectureContainer1_2 extends State<profileLectureContainer1_1>{
  String first_name = "";
  String last_name = "";
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
    return Container(
      height: MediaQuery.of(context).size.height * 0.6,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        // color: Colors.red,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 35,
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.person,
                  size: 45,
                ),
              )
            ],
          ),
          SizedBox(height: 5,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(first_name+" "+last_name,
              style: TextStyle(
                fontFamily: "PlayfairDisplay",
                color: Colors.white70,
                fontSize: 19,
              ),
              )
            ],
          ),
          SizedBox(height: 25,),

          GestureDetector(
            onTap: (){
              print("Password change");
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white
                  ),
                  child: Icon(
                    Icons.edit,
                    size: 17,
                  ),
                ),
                SizedBox(width: 10,),
                GestureDetector(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context)=>lecture_changePassword1_2(IpAddress: widget.IpAddress, admission_number: widget.admission_number)
                      )
                    );
                  },
                  child: Text("Change Password",
                  style: TextStyle(
                    color: Colors.white70,
                    fontFamily: "PlayfairDisplay",
                    fontSize: 18
                  ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 20,),
          GestureDetector(
            onTap: (){
              print("logout");
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white
                  ),
                  child: Icon(
                    Icons.logout,
                    size: 17,
                  ),
                ),
                SizedBox(width: 10,),
                GestureDetector(
                  onTap: (){
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => login1_2(),
                      )
                    );
                  },
                  child: Text("Log Out",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 18,
                    fontFamily: "PlayfairDisplay"
                  ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}







