import 'package:flutter/material.dart';
import 'package:project_app/home/signUp_verification_email.dart';
import 'package:dio/dio.dart';
// void main(){
//   runApp(
//     EmailsignUp1_1()
//   );
// }


// class EmailsignUp1_1 extends StatelessWidget{
//   @override  
//   Widget build(BuildContext context ){
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: EmailsignUp1_2(),
//     );
//   }
// }

class EmailsignUp1_2 extends StatefulWidget{
  final String email;
  final String IpAddress;
  EmailsignUp1_2({required this.email,required this.IpAddress});
  @override  
  EmailsignUp1_3 createState()=> EmailsignUp1_3();
}

class EmailsignUp1_3 extends State<EmailsignUp1_2>{

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
          appBar: signUpAppBar(context),
          body: Padding(
            padding: EdgeInsets.fromLTRB(15, 40, 15, 0),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.07,
                  ),
                  signUpEmail1_2(email: widget.email,onloading: setLoading,IpAddress: widget.IpAddress,)
                ],
              ),
            ),
          ),
        ),
        if(isLoading)
          Container(
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.5),
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

PreferredSizeWidget signUpAppBar(BuildContext context){
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


class signUpEmail1_2 extends StatefulWidget{
  final String email;
  final Function(bool) onloading;
  final String IpAddress;
  signUpEmail1_2({required this.email,required this.onloading,required this.IpAddress});
  @override  
 signUpEmail1_3 createState()=> signUpEmail1_3();
}



class signUpEmail1_3 extends State<signUpEmail1_2>{




  //starting of function to sendEmailData
  Future<void> sendEmailData() async {
    Dio dio = Dio(
      BaseOptions(
        connectTimeout: Duration(seconds: 10),
        receiveTimeout: Duration(seconds: 10)
      )
    );
    try{
      widget.onloading(true);
      var ipAddress = widget.IpAddress;
      var url = "http://$ipAddress/project_app/signUp_email.php";
      var data = {
        "email": widget.email
      };

      Response response = await dio.post(
        url,
        data: FormData.fromMap(data)
      );
      
      if(response.statusCode == 200){
        widget.onloading(false);
        // print(response.data);
        var receivedData = response.data;
        if(receivedData['message'] == "otp sent"){
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => signUp_verifyCode1_2(IpAddress: widget.IpAddress, email: widget.email, ),
            )
          );
        }else{}
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
               print("uknown error: ${e.message} ");
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
  //endiing of function to sendEmailData

  
  @override  
  Widget build(BuildContext context){
    return Container(
      height:  MediaQuery.of(context).size.height * 0.6,
      width: MediaQuery.of(context).size.width,
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
              Text("Verify your '${widget.email}'",
              style: TextStyle(
                color: Colors.white,
                fontFamily: "PlayfairDisplay",
                fontSize: 17,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              ),
            ],
          ),
          SizedBox(height: 10,),
          Row(
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: MaterialButton(
                    onPressed: () async {
                      await sendEmailData();
                    },
                    height: 50,
                    textColor: Colors.white,
                    color: Color(0xFF5DADE2),
                    child: Text("Get Code"),
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

