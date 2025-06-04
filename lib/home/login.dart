import "package:flutter/material.dart";
import 'package:project_app/home/forgor_password.dart';
import 'package:project_app/home/sign_up.dart';
import 'package:project_app/admin_dashboard/admin_dashboard2.dart';
import 'package:dio/dio.dart';
import 'package:project_app/lecture_dashboard/lecture_dashboard2.dart';
import 'package:project_app/student/student_dashboard.dart';
// void main(){
//   runApp(
//     login1_1()
//   );
// }

// class login1_1 extends StatelessWidget{
//   @override  
//   Widget build(BuildContext context ){
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: login1_2(),
//     );
//   }
// }

class login1_2 extends StatefulWidget{
  @override  
  login1_3 createState()=> login1_3();
}

class login1_3 extends State<login1_2>{

  bool isLoading = false;

  void setLoading(bool value){
    setState(() {
      isLoading = value;
    });
  }  

  @override  
  Widget build(BuildContext context){
    return Stack(
      children: [
        Scaffold(
          backgroundColor: Color(0xFF002147),
          extendBodyBehindAppBar: true,
          body: Padding(
            padding: EdgeInsets.fromLTRB(15, 80, 15, 0),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.1 ,),
                  form1(onloading: setLoading,)
                ],
              ),
            ),
          ),
        ),
        if(isLoading)
          Container(
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.5)
            ),
            child: Center(
              child: SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 1,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              ),
            ),
          ),        
      ],
    );
  }
}

class form1 extends StatefulWidget{

  final Function(bool) onloading;

  form1({ required this.onloading });

  @override  
  form1_1 createState()=> form1_1();
}

class form1_1 extends State<form1>{

  final keyOfForm = GlobalKey<FormState>();
  String ErrorText="";
  TextEditingController admissionController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var IpAddress = "192.168.201.102";

  bool isbscure = true;
  //starting of function of validation
  Future<void> validate() async {
    setState(() {
      ErrorText = "";
    });
    if (admissionController.text.isEmpty ){
      setState(() {
        ErrorText = "Admission is empty";
      });
    }else if(passwordController.text.isEmpty){
      setState(() {
        ErrorText = "Password is empty";
      });
    }else {
      await sendLoginData();
    }
  }
  //ending of function of validation

  //starting of function of sendLoginData
  Future<void> sendLoginData() async {
    Dio dio = Dio(
      BaseOptions(
        connectTimeout: Duration(seconds: 10),
        receiveTimeout: Duration(seconds: 10)
      )
    );

    try{
      widget.onloading(true);
      var url = "http://$IpAddress/project_app/login.php";
      var loginData = {
        "admission_number": admissionController.text,
        "password": passwordController.text
      };

      Response response = await dio.post(
        url,
        data: FormData.fromMap(loginData)
      );

      if(response.statusCode == 200){
        widget.onloading(false);
        // print(response.data);
        var receiveData = response.data;
        var nameIdentifier = receiveData['name'];
        print(response.data);

        if(receiveData['message'] == "student"){
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context)=>student_dashboard1_2(IpAddress: IpAddress, candidee_num: admissionController.text,nameIdentity: nameIdentifier,)
            )
          );
        }else if(receiveData['message'] == "lecture"){
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context)=>lecture_dashboard2_2(IpAddress: IpAddress , admission_number: admissionController.text, )
            )
          );
        }else if(receiveData['message'] == "admin"){
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context)=>admin_dashboard1_2(IpAddress: IpAddress , admission_number: admissionController.text, )
            )
          );
        }else{
          setState(() {
            ErrorText = receiveData['message'];
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
  //ending of function of sendLoginData

  @override  
  Widget build(BuildContext context){
    return Container(
      width: MediaQuery.of(context).size.width,
      // height: MediaQuery.of(context).size.height * 0.8,
      decoration: BoxDecoration(
        // color: Colors.red
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                "assets/atc_logo.png",
                width: 80,
                height: 80,
              )
            ],
          ),
          SizedBox(height: 5,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Welcome to ATC E-Learning and \n LogBook platform",
              style: TextStyle(
                color: Colors.white,
                fontFamily: "ShadowsIntoLight",
                fontSize: 17
              ),
              )
            ],
          ),
          SizedBox(height: 14,),
          Form(
            key: keyOfForm,
            child: Column(
              children: [
                TextFormField(
                  controller: admissionController,
                  style: TextStyle(
                    color: Colors.white
                  ),
                  decoration: InputDecoration(
                    hintText: "Admission Number",
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
                      Icons.person_2,
                      color: Colors.grey[400],
                    )
                  ),
                ),               
                SizedBox(height: 15,),
                TextFormField(
                  
                  controller: passwordController,
                  style: TextStyle(
                    color: Colors.white
                  ),
                  obscureText: isbscure,
                  decoration: InputDecoration(
                    
                    hintText: "Password",
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
                      Icons.lock,
                      color: Colors.grey[400],
                    ),
                    suffixIcon: IconButton(
                      onPressed: (){
                        setState(() {
                          isbscure = !isbscure;
                        });
                      },
                      icon: Icon(
                        isbscure? Icons.visibility_off_outlined: Icons.visibility_outlined
                      ),
                      color:Colors.grey[400],
                    )
                  ),
                ),
                if(ErrorText.isNotEmpty)
                   Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                     children: [
                       Text(ErrorText,
                       style: TextStyle(
                         color: Colors.green,
                         fontSize: 12,
                         fontFamily: "PlayfairDisplay"
                       ),
                       ),
                     ],
                   ),
                SizedBox(height: 20,),
                Row(
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: MaterialButton(
                          onPressed: (){
                            validate();
                          },
                          height: 50,
                          textColor: Colors.white,
                          color: Color(0xFF5DADE2),
                          child: Text("Sign In"),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 19,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children:  [
                    GestureDetector(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context)=>forgotPassword1_2(IpAddress: IpAddress,)
                          )
                        );
                      },
                      child: Text("Forgot Password",
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 15
                      ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 9,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Dont have an account ",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 15
                    ),
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context)=>signUp1_2(IpAddress: IpAddress,)
                          )
                        );
                      },
                      child: Text("Sign Up Here",
                      style: TextStyle(
                        color: Colors.white
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




