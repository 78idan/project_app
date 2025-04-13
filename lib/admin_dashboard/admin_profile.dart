import 'package:flutter/material.dart';
import 'package:project_app/admin_dashboard/profile/change_password.dart';
import 'package:dio/dio.dart';
import 'package:project_app/home/login.dart';
// void main(){
//   runApp(
//     admmin_profile1_1()
//   );
// }

// class admmin_profile1_1 extends StatelessWidget{
//   @override  
//   Widget build(BuildContext context ){
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: admmin_profile1_2(),
//     );
//   }
// }


class admin_profile1_2 extends StatefulWidget{
  final String IpAddress;
  final String admission_number;
  admin_profile1_2({required this.IpAddress, required this.admission_number });
  @override  
  admin_profile1_3 createState()=> admin_profile1_3();
}

class admin_profile1_3 extends State<admin_profile1_2>{
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
            profileContainer1_1(IpAddress: widget.IpAddress, admission_number: widget.admission_number,)
          ],
        ),
      ),
    );
  }
}



class profileContainer1_1 extends StatefulWidget{
  final String IpAddress;
  final String admission_number;
  profileContainer1_1({required this.IpAddress, required this.admission_number });  
  @override  
  profileContainer1_2 createState()=> profileContainer1_2();
}


class profileContainer1_2 extends State<profileContainer1_1>{
  String fname = "";
  String lname = "";

  @override  
  void initState(){
    super.initState();
    sendData();
  }

  //starting of function of sendData
  Future<void> sendData() async{
    Dio dio = Dio(
      BaseOptions(
        connectTimeout: Duration(seconds: 10),
        receiveTimeout: Duration(seconds: 10),
      )
    );

    try{
      var url = "http://${widget.IpAddress}/project_app/admin_profile.php";
      var data = {
        "admission_number": widget.admission_number
      };

      Response response = await dio.post(
        url,
        data: FormData.fromMap(data)
      );

      if(response.statusCode == 200){
        // print(response.data);
        var receivedData = response.data;

        if(receivedData['message'] == "Data retreieved"){
          setState(() {
            fname = receivedData['fname'];
            lname = receivedData['lname'];
          });
        }

      }

    }catch(e){
      if (e is DioException){
        switch(e.type){
          case DioExceptionType.connectionTimeout:
               print("connection TimeOut: ${e.message} ");
               break;
          case DioExceptionType.connectionError:
               print("connection Error: ${e.message}");
               break;
          case DioExceptionType.receiveTimeout:
               print("receive TimeOut: ${e.message} ");
               break;
          case DioExceptionType.sendTimeout:
               print("send TimeOut: ${e.message} ");
               break;
          case DioExceptionType.badCertificate:
               print("bad certificate: ${e.message} ");
               break;
          case DioExceptionType.badResponse:
               print("response Bad: ${e.message} ");
               break;
          case DioExceptionType.unknown:
               print("uknown error: ${e.toString()} ");
               break;     
          default:
               print("default error:${e.message} "); 
               break;                             
        }
      }else{
        print("$e");
      }      
    }


  }  

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
              Text("${fname}"+" ${lname}",
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
                        builder: (context) => changePassword1_2(IpAddress: widget.IpAddress, admission_number: widget.admission_number),
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
                        builder: (context)=>login1_2()
                      )
                    );
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


