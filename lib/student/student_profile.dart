import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:project_app/student/student_profile/studentChange_password.dart';
import 'package:project_app/home/login.dart';

// void main(){
//   runApp(
//     student_profile1_1()
//   );
// }

// class student_profile1_1 extends StatelessWidget{
//   @override  
//   Widget build(BuildContext context ){
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: student_profile1_2(),
//     );
//   }
// }

class student_profile1_2 extends StatefulWidget{
  final String IpAddress;
  final String candidee_num;
  student_profile1_2({ required this.IpAddress, required this.candidee_num  });  
  @override 
  student_profile1_3 createState()=> student_profile1_3();
}

class student_profile1_3 extends State<student_profile1_2>{
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
            profileStudentContainer1_1(IpAddress: widget.IpAddress, candidee_num: widget.candidee_num)
          ],
        ),
      ),
    );
  }

}


class profileStudentContainer1_1 extends StatefulWidget{
  final String IpAddress;
  final String candidee_num;
  profileStudentContainer1_1({ required this.IpAddress, required this.candidee_num  }); 
  @override  
  profileStudentContainer1_2 createState()=> profileStudentContainer1_2();
}


class profileStudentContainer1_2 extends State<profileStudentContainer1_1>{
  String first_name = "";
  String last_name = "";
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
      final String candidee_num = widget.candidee_num;
      final String IpAddress = widget.IpAddress;      
      var Url = "http://${IpAddress}/project_app/student_profile.php";
      var dataSent = {
        "candidee_num": candidee_num
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
              Text("$first_name $last_name",
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
                        builder: (context)=>student_changePassword1_2(IpAddress: widget.IpAddress, admission_number: widget.candidee_num)
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
              // print("logout");
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context)=>login1_2()
                )
              );
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
                  },
                  child: Text("Log Out                 ",
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







