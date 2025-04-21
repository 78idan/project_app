import 'package:flutter/material.dart';
import 'package:dio/dio.dart';



// void main(){
//   runApp(
//     changePassword1_1()
//   );
// }

// class changePassword1_1 extends StatelessWidget{
//   @override  
//   Widget build(BuildContext context ){
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: changePassword1_2(),
//     );
//   }
// }



class lecture_changePassword1_2 extends StatefulWidget{
    final String IpAddress;
    final String  admission_number ;
    lecture_changePassword1_2({ required this.IpAddress, required this.admission_number  });
  @override  
  lecture_changePassword1_3 createState()=> lecture_changePassword1_3();
}


class lecture_changePassword1_3 extends State<lecture_changePassword1_2>{
  @override  
  Widget build(BuildContext context ){
    return Scaffold(
      backgroundColor: Color(0xFF002147),
      appBar: lecture_changePasswordAppBar(context),
      body: Padding(
        padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              lecture_changePasswordTextField1_1(IpAddress: widget.IpAddress, admssion_number: widget.admission_number,)
            ],
          ),
        ),
      ),
    );
  }
}

PreferredSizeWidget lecture_changePasswordAppBar(BuildContext context){
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

class lecture_changePasswordTextField1_1 extends StatefulWidget{
      final String IpAddress;
      final String  admssion_number ;
  lecture_changePasswordTextField1_1({ required this.IpAddress, required this.admssion_number });
  @override  
  lecture_changePasswordTextField1_2 createState()=> lecture_changePasswordTextField1_2();
}

class lecture_changePasswordTextField1_2 extends State<lecture_changePasswordTextField1_1>{
   TextEditingController oldPasswordController = TextEditingController();
   TextEditingController newPasswordController = TextEditingController();
  final keychangePassword = GlobalKey<FormState>();
  bool isNewObscure = true;
  bool isOldObscure = true;

  TextEditingController LectureAdmissionNumber = TextEditingController();

//starting of the function of validation
Future<void> validatechangePassword() async {
  if (oldPasswordController.text.isEmpty) {
    customNotification.notificationCustom(context, message: "Old password empty");
  } else if(newPasswordController.text.isEmpty){
    customNotification.notificationCustom(context, message: "New password empty");
  } else if(newPasswordController.text.length < 8){
    customNotification.notificationCustom(context, message: "8 charcters miss in input2");
  } else {
    await changePassword();
  }
} 
//ending of the function of validation

//start of changePassword function
Future<void> changePassword() async{
      Dio dio = Dio(
        BaseOptions(
          connectTimeout: Duration(seconds: 10),
          receiveTimeout: Duration(seconds: 10)
        )
      );

      try{
        var ipAddress = widget.IpAddress;
        var url = "http://$ipAddress/project_app/change_password.php";
        var data1 = {
          "oldPassword": oldPasswordController.text,
          "newPassword": newPasswordController.text,
          "admission_number": widget.admssion_number,
        };
        // print(departmentValue);
        Response response = await dio.post(
          url,
          data: FormData.fromMap(data1)
        );

        if(response.statusCode == 200){
          // print(response.data);
          var dataReceived = response.data;
          if (dataReceived['message'] == "password changed"){
            customNotification.notificationCustom(context, message: dataReceived['message'],picIcon: Icon(Icons.check_circle,color: Colors.white,size: 14,));
            oldPasswordController.clear();
            newPasswordController.clear();
          }else{
            customNotification.notificationCustom(context, message: dataReceived['message']);
          }
        }

      }catch(e){
        if (e is DioException){
          switch(e.type){
            case DioExceptionType.connectionTimeout:
                 print("connection timeout ${e.message} ");
                 break;
            case DioExceptionType.connectionError:
                 print("connection error ${e.message}");
                 break;
            case DioExceptionType.sendTimeout:
                 print("send TimeOut ${e.message} ");
                 break;
            case DioExceptionType.receiveTimeout:
                 print("receive timeOut ${e.message}");
                 break;
            case DioExceptionType.badCertificate:
                 print("bad certificate ${e.message} ");
                 break;
            case DioExceptionType.badResponse:
                 print("bad response ${e.message}  ");
                 break;
            case DioExceptionType.unknown:
                 print("unknown error ${e.toString()} ");
                 break;
            default:
                  print("default error ${e.message} ");
                  break;                                   
          }
        }else{
          print(" Error $e");
        }
      }
}
//ending of changePassword function


  @override  
  Widget build(BuildContext context ){
    return Container(
      // height: MediaQuery.of(context).size.height * 0.9,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        // color: Colors.red
      ),
      child: Column(
        children: [
          SizedBox(
            // height: MediaQuery.of(context).size.height * 0.05,
          ),
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
          SizedBox(height: 15,),
          Form(
            key: keychangePassword,
            child: Column(
              children: [                                                                                           
                SizedBox(height: 10,),
                TextFormField(
                  controller: oldPasswordController,
                  style: TextStyle(
                    color: Colors.white
                  ),
                  obscureText: isOldObscure,
                  decoration: InputDecoration(
                    hintText: "Old password",
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
                          isOldObscure = !isOldObscure;
                        });
                        
                      },
                      icon: Icon(
                        isOldObscure ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                        color: Colors.grey[400],
                      ) ,
                    )
                  ),
                ),  
                SizedBox(height: 10,),
                TextFormField(
                  controller: newPasswordController,
                  style: TextStyle(
                    color: Colors.white
                  ),
                  obscureText: isNewObscure,
                  decoration: InputDecoration(
                    hintText: "New password",
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
                          isNewObscure = !isNewObscure;
                        });
                      },
                      icon: Icon(
                        isNewObscure ? Icons.visibility_off_outlined : Icons.visibility_outlined ,
                        color: Colors.grey[400],
                      ),
                    )
                  ),
                ),                 
                SizedBox(height: 15,),                              
                Row(
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: MaterialButton(
                          onPressed: (){
                            validatechangePassword();
                          },
                          textColor: Colors.white,
                          color: Color(0xFF5DADE2),
                          height: 50,
                          child: Text("Change"),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 140,
                )
              ],
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
        top: 40,
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
                    fontSize: 14,
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




