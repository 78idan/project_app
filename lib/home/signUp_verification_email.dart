import 'package:flutter/material.dart';
import 'package:project_app/home/signUp_password.dart';
import 'package:dio/dio.dart';

// void main(){
//   runApp(
//     signUp_verifyCode1_1()
//   );
// }

// class signUp_verifyCode1_1 extends StatelessWidget{
//   @override  
//   Widget build(BuildContext context){
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: signUp_verifyCode1_2(),
//     );
//   }
// }

class signUp_verifyCode1_2 extends StatefulWidget{
  final String IpAddress;
  final String email;
  signUp_verifyCode1_2({required this.IpAddress, required this.email });
  @override  
  signUp_verifyCode1_3 createState()=> signUp_verifyCode1_3();
}


class signUp_verifyCode1_3 extends State<signUp_verifyCode1_2>{

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
          appBar: signUp_verifyAppBar(context),
          body: Padding(
            padding: EdgeInsets.fromLTRB(15, 40, 15, 0),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.07,
                  ),              
                  signUp_verifyText1_1(IpAddress: widget.IpAddress, email: widget.email, onloading: setLoading, )
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
          )
      ],
    );
  }
}


PreferredSizeWidget signUp_verifyAppBar(BuildContext context ){
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
  );
}


class signUp_verifyText1_1 extends StatefulWidget{
  final String IpAddress;
  final String email;
  final Function(bool) onloading;
  signUp_verifyText1_1({required this.IpAddress, required this.email, required this.onloading});
  @override  
  signUp_verifyText1_2 createState()=> signUp_verifyText1_2();
}

class signUp_verifyText1_2 extends State<signUp_verifyText1_1>{
  final keySignUpVerifyForm = GlobalKey<FormState>();
  String errorInputText = "";
  TextEditingController input1Controller = TextEditingController();
  TextEditingController input2Controller = TextEditingController();
  TextEditingController input3Controller = TextEditingController();
  TextEditingController input4Controller = TextEditingController();
  //starting of function to validate
  Future<void> validateVerifyInput() async {
    setState(() {
      errorInputText  = "";
    });
    if(input1Controller.text.isEmpty){
      errorInputText = "Input is empty";
    }else if(input2Controller.text.isEmpty){
      errorInputText = "Input is empty";
    }else if(input3Controller.text.isEmpty){
      errorInputText = "Input is empty";
    }else if(input4Controller.text.isEmpty){
      errorInputText = "Input is empty";
    }else{
       await verifyOtp();
    }    
  }
  //ending of function to validate  

  //starting of function to verifyOtp
  Future<void> verifyOtp() async {
    Dio dio = Dio(
      BaseOptions(
        connectTimeout: Duration(seconds: 10),
        receiveTimeout: Duration(seconds: 10)
      )
    ); 

    try{
      widget.onloading(true);
      var email = widget.email;
      var ipAddress = widget.IpAddress;
      var url = "http://$ipAddress/project_app/signUp_verification.php";
      var otp = "${input1Controller.text+input2Controller.text+input3Controller.text+input4Controller.text}";
      var dataOtp = {
        "email": email,
        "reg_otp":otp
      };
      // print("$otp");

      Response response = await dio.post(
        url,
        data: FormData.fromMap(dataOtp)
      );

      if(response.statusCode == 200){
        widget.onloading(false);
        // print(response.data);
        var fetchedData = response.data;
        if (fetchedData['message'] == "otp matches" ){
          // print('Thank You God');
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => signUp_Password1_2(IpAddress: widget.IpAddress, email: email),
            )
          );
          input1Controller.clear();
          input2Controller.clear();
          input3Controller.clear();
          input4Controller.clear();
        }else{
          setState(() {
            errorInputText = fetchedData['message'];
          });
        }
      }

    }catch(e){
      if (e is DioException){
        switch(e.type){
          case DioExceptionType.connectionTimeout:
               print("connectionTimeOut: ${e.message} ");
               break;
          case DioExceptionType.connectionError:
               print("connection Error: ${e.message} ");
               break;
          case DioExceptionType.sendTimeout:
               print("send TimeOut: ${e.message} ");
               break;
          case DioExceptionType.receiveTimeout:
               print("receive TimeOut: ${e.message} ");
               break;
          case DioExceptionType.badCertificate:
               print("badCertificate: ${e.message} ");
               break;
          case DioExceptionType.badResponse:
               print("response bad: ${e.message} ");
               break;
          case DioExceptionType.unknown:
               print("unknown error: ${e.toString()} ");
               break;
          default:
               print("defualt error: ${e.message} ");
               break;                                   
        }
      }else{
        print("$e");
      }
    }
  }
  //ending of function to verifyOtp

  //starting of function to resendOtp
  Future<void> resendOtp() async{
    Dio dio = Dio(
      BaseOptions(
        connectTimeout: Duration(seconds: 10),
        receiveTimeout: Duration(seconds: 10)
      )
    ); 
    try{
      widget.onloading(true);
      var email = widget.email;
      var ipAddress = widget.IpAddress;
      var url = "http://$ipAddress/project_app/signUp_email.php";
      var dataEmailSent = {
        "email": email
      };

      Response response = await dio.post(
        url,
        data: FormData.fromMap(dataEmailSent)
      );

      if(response.statusCode == 200){
        widget.onloading(false);
        var receivedData = response.data;
        if(receivedData['message'] == "otp sent"){
          setState(() {
            errorInputText = "Code resent again";
          });
        }else{
          setState(() {
            errorInputText = receivedData['message'];
          });
        }
      }

    }catch(e){
      if (e is DioException){
        switch(e.type){
          case DioExceptionType.connectionTimeout:
               print("connectionTimeOut: ${e.message} ");
               break;
          case DioExceptionType.connectionError:
               print("connection Error: ${e.message} ");
               break;
          case DioExceptionType.sendTimeout:
               print("send TimeOut: ${e.message} ");
               break;
          case DioExceptionType.receiveTimeout:
               print("receive TimeOut: ${e.message} ");
               break;
          case DioExceptionType.badCertificate:
               print("badCertificate: ${e.message} ");
               break;
          case DioExceptionType.badResponse:
               print("response bad: ${e.message} ");
               break;
          case DioExceptionType.unknown:
               print("unknown error: ${e.toString()} ");
               break;
          default:
               print("defualt error: ${e.message} ");
               break;                                   
        }
      }else{
        print("$e");
      }      
    }    
  }
  //ending of function to resendOtp


  Widget build(BuildContext context){
    return Container(
      height: MediaQuery.of(context).size.height * 0.6,
      width: MediaQuery.of(context).size.width ,
      decoration: BoxDecoration(
        // color: Colors.red
      ),
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Enter Code",
              style: TextStyle(
                color: Colors.white,
                fontFamily: "ArsenalSC",
                fontSize: 24,
              ),
              )
            ],
          ),
          SizedBox(height: 5,),
          Form(
            key: keySignUpVerifyForm,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 55,
                  width: 55,
                  decoration: BoxDecoration(
                    // borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.transparent
                    )
                  ),
                  child: TextFormField(
                    controller: input1Controller,
                    style: TextStyle(
                      color: Colors.white
                    ),
                    textAlign: TextAlign.center,
                    maxLength: 1,
                    decoration: InputDecoration(
                      counterText: "",
                      fillColor: Color(0xFF1A3A6F),
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none
                      )
                    ),
                  ),
                ),
                Container(
                  height: 55,
                  width: 55,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.transparent
                    )
                  ),
                  child: TextFormField(
                    controller: input2Controller,
                    style: TextStyle(
                      color: Colors.white
                    ),
                    textAlign: TextAlign.center,
                    maxLength: 1,
                    decoration: InputDecoration(
                      counterText: "",
                      fillColor: Color(0xFF1A3A6F),
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 55,
                  width: 55,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.transparent
                    )
                  ),
                  child: TextFormField(
                    controller: input3Controller,
                    style: TextStyle(
                      color: Colors.white
                    ),
                    textAlign: TextAlign.center,
                    maxLength: 1,
                    decoration: InputDecoration(
                      counterText: "",
                      fillColor: Color(0xFF1A3A6F),
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none
                      )
                    ),
                  ),
                ),
                Container(
                  height: 55,
                  width: 55,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.transparent
                    )
                  ),
                  child: TextFormField(
                    controller: input4Controller,
                    style: TextStyle(
                      color: Colors.white
                    ),
                    textAlign: TextAlign.center,
                    maxLength: 1,
                    decoration: InputDecoration(
                      counterText: "",
                      fillColor: Color(0xFF1A3A6F),
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none
                      )
                    ),
                  ),
                )
              ],
            ),
            
          ),
          if (errorInputText.isNotEmpty)
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(errorInputText,
                style: TextStyle(
                  color: Colors.green,
                  fontFamily: "PlayfairDisplay",
                  fontSize: 12
                ),
                )
              ],
            ),
          SizedBox(height: 14,),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () async {
                  await resendOtp();
                },
                child: Text("Resend Code",
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: "ArsenalSC",
                  color: const Color.fromARGB(255, 58, 160, 61)
                ),
                ),
              )
            ],
          ),
          SizedBox(height: 15,),
          Row(
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: MaterialButton(
                    onPressed: (){
                      validateVerifyInput();
                    },
                    height: 50,
                    textColor: Colors.white,
                    color: Color(0xFF5DADE2),
                    child: Text("Verify"),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}





