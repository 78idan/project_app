import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:project_app/home/verify_code.dart';
// import 'package:project_app/home/verify_code.dart';


// void main(){
//   runApp(
//     forgotPassword1()
//   );
// }


// class forgotPassword1 extends StatelessWidget{
//   @override  
//   Widget build(BuildContext context){
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: forgotPassword1_2(),
//     );
//   }
// }


class forgotPassword1_2 extends StatefulWidget{
  final String IpAddress;
  forgotPassword1_2({required this.IpAddress});
  @override  
  forgotPassword1_3 createState()=> forgotPassword1_3();
}


class forgotPassword1_3 extends State<forgotPassword1_2>{

  bool isLoading = false;

  void setLoading(bool value){
    setState(() {
      isLoading = value;
    });
  }

  @override  
  Widget build(BuildContext context ){
    return Stack(
      children: [
        Scaffold(
          appBar: forgotAppBar(context),
          // extendBodyBehindAppBar: true,
          backgroundColor: Color(0xFF002147),
          body: Padding(
            padding: EdgeInsets.fromLTRB(15, 40, 15, 0),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.07,
                  ),
                  textField1_1(onloading: setLoading, IpAddress: widget.IpAddress,)
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

PreferredSizeWidget forgotAppBar( BuildContext context){
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
    )
  );
}


class textField1_1 extends StatefulWidget{
  final String IpAddress;
  final Function(bool) onloading;
  textField1_1({required this.onloading, required this.IpAddress });
  @override  
  textField1_2 createState()=> textField1_2();
}

class textField1_2 extends State<textField1_1>{

  final keyForgotForm = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  String ErrorTextForgot = "";
  RegExp emailRegExp = RegExp(
    r'^[A-Za-z0-9]+@gmail\.[a-zA-Z]{3}$'
    );  

  //start of function of validating
  Future<void> validateForgot() async {
      setState(() {
        ErrorTextForgot = "";
      });
      if ( emailController.text.isEmpty ){
        setState(() {
          ErrorTextForgot = "Email is empty";
        });
      }else if(!emailRegExp.hasMatch(emailController.text)){
          ErrorTextForgot = "Invalid email pattern";
      }else{
        await sendDataEmail();
      }
  }
  //end of function of validating

  //start of function of sendingEmail
  Future<void> sendDataEmail() async {
    Dio dio = Dio(
      BaseOptions(
        connectTimeout: Duration(seconds: 10),
        receiveTimeout: Duration(seconds: 10)
      )
    );

    try{
      widget.onloading(true);
      var  IpAddress = widget.IpAddress;
      var url = "http://$IpAddress/project_app/forgot_password.php";
      var dataEmail = {
        "email": emailController.text
      };

      Response response = await dio.post(
        url,
        data: FormData.fromMap(dataEmail)
      );

      if(response.statusCode == 200){
        widget.onloading(false);
        // print(response.data);
        var receivedData = response.data;
        if(receivedData['message'] == "otp sent"){
          // print("Thank God");
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context)=> verifyCode1_2(IpAddress: IpAddress, email: emailController.text)
            )
          );
        }else{
          setState(() {
            ErrorTextForgot = receivedData['message'];
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
  //end of function of sendingEmail


  @override  
  Widget build(BuildContext context){
    return Container(
      height: MediaQuery.of(context).size.height * 0.6 ,
      width:  MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        // color: Colors.red
      ),
      child: Column(

        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Forgot Password",
              style: TextStyle(
                color: Colors.white,
                fontFamily: "ArsenalSC",
                fontSize: 24
              ),
              )
            ],
          ),
          SizedBox(height: 8,),
          Form(
            key: keyForgotForm,
            child: Column(
              children: [
                TextFormField(
                  controller: emailController,
                  style: TextStyle(
                    color: Colors.white
                  ),
                  decoration: InputDecoration(
                    hintText: "Email Address",
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
                      Icons.email_outlined,
                      color: Colors.grey[400],
                    ),
                    errorStyle: TextStyle(
                      color: Colors.green,
                      fontSize: 12,
                      fontFamily: "PlayfairDisplay"
                    )
                  ),
                  // validator: (value){
                  //   if (value == null || value.isEmpty){
                  //     return "Email is empty";
                  //   }else if(!emailRegExp.hasMatch(value)){
                  //     return "Invalid Email Pattern";
                  //   }
                  //   return null;
                  // },
                ),
                if(ErrorTextForgot.isNotEmpty)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(ErrorTextForgot,
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 12,
                        fontFamily: "PlayfairDisplay"
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
                            validateForgot();
                            // print(widget.address);
                          },
                          height: 50,
                          textColor: Colors.white,
                          color: Color(0xFF5DADE2),
                          child: Text("Send Code"),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}



