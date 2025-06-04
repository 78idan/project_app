import 'package:flutter/material.dart';
import 'package:dio/dio.dart';



// void main(){
//   runApp(
//     adminRegisterLecture1_1()
//   );
// }

// class adminRegisterLecture1_1 extends StatelessWidget{
//   @override  
//   Widget build(BuildContext context ){
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: adminRegisterLecture1_2(),
//     );
//   }
// }



class adminRegisterLecture1_2 extends StatefulWidget{
  final String IpAddress;
  adminRegisterLecture1_2({ required this.IpAddress });
  @override  
  adminRegisterLecture1_3 createState()=> adminRegisterLecture1_3();
}


class adminRegisterLecture1_3 extends State<adminRegisterLecture1_2>{
  @override  
  Widget build(BuildContext context ){
    return Scaffold(
      backgroundColor: Color(0xFF002147),
      appBar: adminRegisterLectureAppBar(context),
      body: Padding(
        padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              adminRegisterLectureTextField1_1(IpAddress: widget.IpAddress,)
            ],
          ),
        ),
      ),
    );
  }
}

PreferredSizeWidget adminRegisterLectureAppBar(BuildContext context){
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

class adminRegisterLectureTextField1_1 extends StatefulWidget{
  final String IpAddress;
  adminRegisterLectureTextField1_1({ required this.IpAddress });  
  @override  
  adminRegisterLectureTextField1_2 createState()=> adminRegisterLectureTextField1_2();
}

class adminRegisterLectureTextField1_2 extends State<adminRegisterLectureTextField1_1>{
  String? departmentValue;
  // String? courseValue;
  // String? levelValue;
  List<String> departmentList = ['IT'];
  // List<String> courseList = ["Computer Science","Information Technology"];
  // List<String> levelList = ["Level 4","Level 5","Level 6","Level 7-1","Level 7-2","Level 8"];
  final keyRegisterLecture = GlobalKey<FormState>();
  String role = "lecture";

  TextEditingController fname = TextEditingController();
  TextEditingController sname = TextEditingController();
  TextEditingController lname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController lectureAdmissionNumber = TextEditingController();

Future<void> validateLectureRegister() async {
  if(fname.text.isEmpty){
     customNotification.notificationCustom(context, message: "First Name empty");
  }else if(sname.text.isEmpty){
     customNotification.notificationCustom(context, message: "Second Name empty");
  }else if(lname.text.isEmpty){
     customNotification.notificationCustom(context, message: "Last Name empty");
  }else if (departmentValue == null || departmentValue!.isEmpty) {
    customNotification.notificationCustom(context, message: "Department empty");
  }else if(email.text.isEmpty){
     customNotification.notificationCustom(context, message: "Email empty");
  }else if(lectureAdmissionNumber.text.isEmpty){
     customNotification.notificationCustom(context, message: "Admission empty");
  } else {
    await registerLecture();
  }
}

//start of registering and sending data function
Future<void> registerLecture() async{
      Dio dio = Dio(
        BaseOptions(
          connectTimeout: Duration(seconds: 10),
          receiveTimeout: Duration(seconds: 10)
        )
      );

      try{
        var ipAddress = widget.IpAddress;
        var url = "http://$ipAddress/project_app/admin_register_lecture.php";
        var data1 = {
          "fname": fname.text,
          "lname": lname.text,
          "sname": sname.text,
          "departmentValue": departmentValue,
          "email": email.text,
          "role": role,
          "lectureAdmissionNumber":lectureAdmissionNumber.text
        };

        Response response = await dio.post(
          url,
          data: FormData.fromMap(data1)
        );

        if(response.statusCode == 200){
          // print(response.data);
          var dataReceived = response.data;
          if (dataReceived['message'] == "Registered"){
            fname.clear();
            lname.clear();
            sname.clear();
            email.clear();
            lectureAdmissionNumber.clear();
            customNotification.notificationCustom(context, message: dataReceived['message'],picIcon: Icon(Icons.check_circle,color: Colors.white,size: 14,));
          }else{
            fname.clear();
            lname.clear();
            sname.clear();
            email.clear();
            lectureAdmissionNumber.clear();            
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
//end of registering and sending data function





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
                  Icons.school,
                  size: 45,
                ),
              )
            ],
          ),
          SizedBox(height: 15,),
          Form(
            key: keyRegisterLecture,
            child: Column(
              children: [
                TextFormField(
                  controller: fname,
                  style: TextStyle(
                    color: Colors.white
                  ),
                  decoration: InputDecoration(
                    hintText: "First Name",
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
                  ),
                ),
                SizedBox(height: 10,),
                TextFormField(
                  controller: sname,
                  style: TextStyle(
                    color: Colors.white
                  ),
                  decoration: InputDecoration(
                    hintText: "Second Name",
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
                  ),
                ), 
                SizedBox(height: 10,), 
                TextFormField(
                  controller: lname,
                  style: TextStyle(
                    color: Colors.white
                  ),
                  decoration: InputDecoration(
                    hintText: "Last Name",
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
                  ),
                ), 
                SizedBox(height: 10,), 
                DropdownButtonFormField<String>(
                  dropdownColor: Color(0xFF1A3A6F),
                  // style: TextStyle(
                  //   color: Colors.white
                  // ),
                  icon: Icon(
                    Icons.arrow_drop_down,
                    color: Colors.white70,
                  ),
                  isExpanded: true,
                  decoration: InputDecoration(
                    fillColor: Color(0xFF1A3A6F),
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10)
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10)
                    )
                  ),
                  hint: Text("Choose Department",
                  style: TextStyle(
                    color: Colors.white70
                  ),
                  ),
                  
                  value: departmentValue,
                  onChanged: (newValue){
                    setState(() {
                      departmentValue = newValue;
                    });
                  },
                  items: departmentList.map((departmentLists){
                    return DropdownMenuItem(
                      value: departmentLists,
                      child: Text(departmentLists,
                      style: TextStyle(
                        color: Colors.white70
                      ),
                      ),
                    );
                  }).toList(),
                ),                                                                                            
                SizedBox(height: 10,),
                TextFormField(
                  controller: email,
                  style: TextStyle(
                    color: Colors.white
                  ),
                  decoration: InputDecoration(
                    hintText: "Email",
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
                      Icons.mail,
                      color: Colors.grey[400],
                    )
                  ),
                ),  
                SizedBox(height: 10,),
                TextFormField(
                  controller: lectureAdmissionNumber,
                  style: TextStyle(
                    color: Colors.white
                  ),
                  decoration: InputDecoration(
                    hintText: "Lecture`s Admission Number",
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
                            validateLectureRegister();
                          },
                          textColor: Colors.white,
                          color: Color(0xFF5DADE2),
                          height: 50,
                          child: Text("Save"),
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
    BuildContext context,{
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
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 11),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  picIcon!,
                  SizedBox(
                    width: 4,
                  ),
                  Text(message,
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: "PlayfairDisplay",
                    fontSize: 14
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



