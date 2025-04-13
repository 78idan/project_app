import 'package:flutter/material.dart';
import 'package:dio/dio.dart';



// void main(){
//   runApp(
//     adminEnrollModules1_1()
//   );
// }

// class adminEnrollModules1_1 extends StatelessWidget{
//   @override  
//   Widget build(BuildContext context ){
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: adminEnrollModules1_2(),
//     );
//   }
// }



class adminEnrollModules1_2 extends StatefulWidget{
    final String IpAddress;
  adminEnrollModules1_2({ required this.IpAddress });
  @override  
  adminEnrollModules1_3 createState()=> adminEnrollModules1_3();
}


class adminEnrollModules1_3 extends State<adminEnrollModules1_2>{
  @override  
  Widget build(BuildContext context ){
    return Scaffold(
      backgroundColor: Color(0xFF002147),
      appBar: adminEnrollModulesAppBar(context),
      body: Padding(
        padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              adminEnrollModulesTextField1_1(IpAddress: widget.IpAddress,)
            ],
          ),
        ),
      ),
    );
  }
}

PreferredSizeWidget adminEnrollModulesAppBar(BuildContext context){
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

class adminEnrollModulesTextField1_1 extends StatefulWidget{
      final String IpAddress;
  adminEnrollModulesTextField1_1({ required this.IpAddress });
  @override  
  adminEnrollModulesTextField1_2 createState()=> adminEnrollModulesTextField1_2();
}

class adminEnrollModulesTextField1_2 extends State<adminEnrollModulesTextField1_1>{
  String? departmentValue;
  String? courseValue;
  String? levelValue;
  String? moduleValue;
  List<String> departmentList = ['IT'];
  List<String> courseList = ["Computer Science","Information Technology"];
  List<String> levelList = ["Level 4","Level 5","Level 6","Level 7-1","Level 7-2","Level 8"];
  List<String> moduleList = ["DataBase Management","Cryptography","BlockChain","Artificial Intelligence","Calculus","Enterpreneur"];
  final keyEnrollingModules = GlobalKey<FormState>();

  TextEditingController LectureAdmissionNumber = TextEditingController();

//starting of the function of validation
Future<void> validateEnrollingModules() async {
  if (departmentValue == null || departmentValue!.isEmpty) {
    customNotification.notificationCustom(context, message: "Department empty");
  }else if(courseValue == null || courseValue!.isEmpty){
     customNotification.notificationCustom(context, message: "Course empty");
  }else if(levelValue == null || levelValue!.isEmpty){
     customNotification.notificationCustom(context, message: "Level empty");
  }else if(moduleValue == null || moduleValue!.isEmpty){
     customNotification.notificationCustom(context, message: "Module empty");
  }else if(LectureAdmissionNumber.text.isEmpty){
     customNotification.notificationCustom(context, message: "Admission empty");
  } else {
    await registerModules();
  }
} 
//ending of the function of validation

//start of registering modules function
Future<void> registerModules() async{
      Dio dio = Dio(
        BaseOptions(
          connectTimeout: Duration(seconds: 10),
          receiveTimeout: Duration(seconds: 10)
        )
      );

      try{
        var ipAddress = widget.IpAddress;
        var url = "http://$ipAddress/project_app/admin_enroll_modules.php";
        var data1 = {
          "departmentValue": departmentValue,
          "courseValue": courseValue,
          "levelValue": levelValue,
          "moduleValue": moduleValue,
          "LectureAdmissionNumber": LectureAdmissionNumber.text,
        };
        // print(departmentValue);
        Response response = await dio.post(
          url,
          data: FormData.fromMap(data1)
        );

        if(response.statusCode == 200){
          // print(response.data);
          var dataReceived = response.data;
          if (dataReceived['message'] == "module enrolled"){
            customNotification.notificationCustom(context, message: dataReceived['message'],picIcon: Icon(Icons.check_circle,color: Colors.white,size: 14,));
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
//ending of registering modules function


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
                  Icons.book,
                  size: 45,
                ),
              )
            ],
          ),
          SizedBox(height: 15,),
          Form(
            key: keyEnrollingModules,
            child: Column(
              children: [
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
                DropdownButtonFormField<String>(
                  dropdownColor: Color(0xFF1A3A6F),
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
                  hint: Text("Choose Course",
                  style: TextStyle(
                    color: Colors.white70
                  ),
                  ),
                  
                  value: courseValue,
                  onChanged: (newValue){
                    setState(() {
                      courseValue = newValue;
                    });
                  },
                  items: courseList.map((courseLists){
                    return DropdownMenuItem(
                      value: courseLists,
                      child: Text(courseLists,
                      style: TextStyle(
                        color: Colors.white70
                      ),
                      ),
                    );
                  }).toList(),
                ),
                SizedBox(height: 10,),
                DropdownButtonFormField<String>(
                  dropdownColor: Color(0xFF1A3A6F),
                  icon: Icon(
                    Icons.arrow_drop_down,
                    color: Colors.white70,
                  ),
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
                  hint: Text("Choose Level",
                  style: TextStyle(
                    color: Colors.white70
                  ),
                  ),
                  
                  value: levelValue,
                  onChanged: (newValue){
                    setState(() {
                      levelValue = newValue;
                    });
                  },
                  items: levelList.map((levelLists){
                    return DropdownMenuItem(
                      value: levelLists,
                      child: Text(levelLists,
                      style: TextStyle(
                        color: Colors.white70
                      ),
                      ),
                    );
                  }).toList(),
                ), 
                SizedBox(height: 10,),
                DropdownButtonFormField<String>(
                  dropdownColor: Color(0xFF1A3A6F),
                  icon: Icon(
                    Icons.arrow_drop_down,
                    color: Colors.white70,
                  ),
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
                  hint: Text("Choose Module",
                  style: TextStyle(
                    color: Colors.white70
                  ),
                  ),
                  
                  value: moduleValue,
                  onChanged: (newValue){
                    setState(() {
                      moduleValue = newValue;
                    });
                  },
                  items: moduleList.map((moduleLists){
                    return DropdownMenuItem(
                      value: moduleLists,
                      child: Text(moduleLists,
                      style: TextStyle(
                        color: Colors.white70
                      ),
                      ),
                    );
                  }).toList(),
                ),                                                                                                                               
                SizedBox(height: 10,),
                TextFormField(
                  controller: LectureAdmissionNumber,
                  style: TextStyle(
                    color: Colors.white
                  ),
                  decoration: InputDecoration(
                    hintText: "Lecture Admission Number",
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
                      Icons.person,
                      color: Colors.grey[400],
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
                            validateEnrollingModules();
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




