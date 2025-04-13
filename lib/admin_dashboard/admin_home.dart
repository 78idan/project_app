import "package:flutter/material.dart";
import 'package:project_app/admin_dashboard/register/admin_enroll_modules.dart';
import 'package:project_app/admin_dashboard/register/admin_industrial.dart';
import 'package:project_app/admin_dashboard/register/admin_register_lecture.dart';
import 'package:project_app/admin_dashboard/register/admin_register_student.dart';
import 'package:dio/dio.dart';

// void main(){
//   runApp(
//     admmin_home1_1()
//   );
// }

// class admmin_home1_1 extends StatelessWidget{
//   @override  
//   Widget build(BuildContext context ){
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: admmin_home1_2(),
//     );
//   }
// }


class admmin_home1_2 extends StatefulWidget{

  final String IpAddress;
  final String admission_number;

  admmin_home1_2({ required this.IpAddress, required this.admission_number  });  
  
  @override  
  admmin_home1_3 createState()=> admmin_home1_3();
}

class admmin_home1_3 extends State<admmin_home1_2>{

  String fname = "";
  String lname = "";
  String role = "";

   List<Widget> BuildgridContainers(BuildContext context) {
    return  [
        GestureDetector(
          onTap: (){
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context)=> adminRegisterStudent1_2()
              )
            );            
          },
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xFF5DADE2),
              borderRadius: BorderRadius.circular(10),
          
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.person_add,
                  size: 50,
                  color: Colors.white,
                ),
                SizedBox(height: 10,),
                Text("Register\n Students",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: "PlayfairDisplay",
                  fontSize: 16,
                  color: Colors.white
                ),
                )
              ],
            ),
          
          ),
        ),
        GestureDetector(
          onTap: (){
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context)=> adminRegisterLecture1_2(IpAddress: widget.IpAddress,)
              )
            );
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color(0xFF48C9B0),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.school,
                  size: 50,
                  color: Colors.white,
                ),
                SizedBox(height: 10,),
                Text("Lecture\nRegister",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: "PlayfairDisplay",
                  fontSize: 16,
          
                ),
                textAlign: TextAlign.center,
                )
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: (){
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context)=> adminEnrollModules1_2(IpAddress: widget.IpAddress,)
              )
            );            
          },
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xFFAF7AC5),
              borderRadius: BorderRadius.circular(10)
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
                Text("Enrolling\nModules",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: "PlayfairDisplay",
                  fontSize: 16
                ),
                )
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: (){
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context)=> adminIndustrial1_2(IpAddress: widget.IpAddress,)
              )
            );            
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
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
                Text("Industrial\nTraining",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: "PlayfairDisplay",
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
                )
              ],
            ),
          ),
        )
      ];
  }

  @override 
  void initState()  {
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
      var url = "http://${widget.IpAddress}/project_app/admin_home.php";
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
            role = receivedData['role'];
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
  //ending of function of sendData

  @override  
  Widget build(BuildContext  context){
    final gridContainers = BuildgridContainers(context);
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Color(0xFF002147),
      // appBar: admin_homeAppBar(context),
      body: Stack(
        children: [
          Positioned(
            left: 14,
            top: 45,
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
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
                    Text("$fname" +" $lname" ,
                    style: TextStyle(
                      fontFamily: "PlayfairDisplay",
                      color: Colors.white,
                      fontSize: 14
                    ),
                    ),
                    Text("$role",
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
          left: 16,
          right: 16,
          child: Container(
            height: 400,
            child: GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 1,
          
              ),
              itemCount: gridContainers.length,
              itemBuilder: (BuildContext context,index ){
                return gridContainers[index];
              },
            ),
          ),
        )

        ],
      ),
    );
  }
}




