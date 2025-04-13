import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:project_app/home/login.dart';

// void main(){
//   runApp(
//     resetPassword1_1()
//   );
// }


// class resetPassword1_1 extends StatelessWidget{
//   @override  
//   Widget build(BuildContext context ){
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: resetPassword1_2(),
//     );
//   }
// }

class resetPassword1_2 extends StatefulWidget{

  final String email;
  final String IpAddress;

  resetPassword1_2({ required this.IpAddress, required this.email });

  @override  
  resetPassword1_3 createState()=> resetPassword1_3();
}

class resetPassword1_3 extends State<resetPassword1_2>{

  bool isLoading = false;

  void setLoading(bool value ){
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
          appBar: resetPasswordAppBar(context),
          body: Padding(
            padding: EdgeInsets.fromLTRB(15, 40, 15, 0),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.07 ,
                  ),
                  resetPasswordText1_1(IpAddress: widget.IpAddress,email: widget.email, onloading: setLoading,),
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

PreferredSizeWidget resetPasswordAppBar(BuildContext context ){
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


class resetPasswordText1_1  extends StatefulWidget{

  final String email;
  final String IpAddress;
  final Function(bool) onloading;

  resetPasswordText1_1({ required this.IpAddress, required this.email, required this.onloading  });

  @override  
  resetPasswordText1_2 createState()=> resetPasswordText1_2();
}

class resetPasswordText1_2 extends State<resetPasswordText1_1>{
  final keyResetPasswordText = GlobalKey<FormState>();
  TextEditingController passwordController = TextEditingController();
  bool has8characters = false;
  bool hasSpecialCharacters = false;
  bool isobscure = true;

  //starting function of listening to input when some writes 
  void initState(){
    super.initState();

    passwordController.addListener((){
      setState(() {
        

        has8characters = passwordController.text.length >= 8;
        hasSpecialCharacters = passwordController.text.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
      });        
    });

  }
  //ending function of listening to input when some writes 


  //starting function of sending password to database
  Future<void> sendingPassword() async{
    Dio dio = Dio(
      BaseOptions(
        connectTimeout: Duration(seconds: 10),
        receiveTimeout: Duration(seconds: 10),
      )
    );

    try{
      widget.onloading(true);
      var email = widget.email;
      var ipAddress = widget.IpAddress;      
      var url = "http://$ipAddress/project_app/reset_password.php";
      var passwordData = {
        "email": email,
        "password": passwordController.text
      };

      Response response = await dio.post(
        url,
        data: FormData.fromMap(passwordData)
      );

      if(response.statusCode == 200 ){
        widget.onloading(false);
        var receivedData = response.data;

        if(receivedData['message'] == "PLease forgive Jesus Christ" ){
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context)=> login1_2()
            )
          );
        }else{
          print(receivedData['message']);
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
  //ending function of sending password to database

  void dispose(){
    passwordController.dispose();
    super.dispose();
  }

  @override  
  Widget build(BuildContext context ){
    return Container(
      height: MediaQuery.of(context).size.height * 0.6,
      width: MediaQuery.of(context).size.width ,
      decoration: BoxDecoration(
        // color: Colors.red
      ),
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05 ,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Enter Password",
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
            key: keyResetPasswordText,
            child: Column(
              children: [
                TextFormField(
                  controller: passwordController,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  obscureText: isobscure,
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
                          isobscure = !isobscure;
                        });
                      },
                      icon: Icon(
                        isobscure ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                        color: Colors.grey[400],
                      ),
                    )
                  ),

                ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    has8characters ?  Icons.check_circle: Icons.close,
                     color: has8characters ? Colors.white: Colors.green,
                  ),
                  SizedBox(width: 3,),
                  Text("8 characters",
                  style: TextStyle(
                    color: has8characters ?  Colors.white : Colors.green ,
                    fontFamily: "ArsenalSC",
                  ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                   hasSpecialCharacters ?  Icons.check_circle: Icons.close,
                    color: hasSpecialCharacters ? Colors.white: Colors.green ,
                  ),
                  SizedBox(width: 3,),
                  Text("speacial character",
                  style: TextStyle(
                    color: hasSpecialCharacters ? Colors.white : Colors.green,
                    fontFamily: "ArsenalSC"
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
                        onPressed: () async {
                          if(has8characters && hasSpecialCharacters){
                            // print("Thanks God");
                            await sendingPassword();
                          }
                        },
                        textColor: Colors.white,
                        color: (has8characters && hasSpecialCharacters )?  Color(0xFF5DADE2) : Color(0xFF5DADE2).withOpacity(0.5),
                        height: 50,
                        child: Text("Finish"),
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


