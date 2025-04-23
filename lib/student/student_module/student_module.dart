import 'package:flutter/material.dart';
import 'package:dio/dio.dart';


void main(){
  runApp(
    student_module1_1()
  );
}

class student_module1_1 extends StatelessWidget{
  @override  
  Widget build(BuildContext context ){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: student_module1_2(),
    );
  }
}



class student_module1_2 extends StatefulWidget{
  @override  
  student_module1_3 createState()=> student_module1_3();
}


class student_module1_3 extends State<student_module1_2>{
  @override  
  Widget build(BuildContext context ){
    return Scaffold(
      backgroundColor: Color(0xFF002147),
      appBar: studentModuleAppBar(context),
      body: Padding(
        padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: studentModuleContainer1_1()
        ),
      ),
    );
  }
}

PreferredSizeWidget studentModuleAppBar( BuildContext context ){
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



class studentModuleContainer1_1 extends StatefulWidget{
  @override  
  studentModuleContainer1_2 createState()=> studentModuleContainer1_2();
}

class studentModuleContainer1_2 extends State<studentModuleContainer1_1>{
  List<dynamic> module_name = [];
  List<dynamic> module_lecture = [];
  String emptyText = "";
  //start of initState function
  void initState(){
    super.initState();
    retrieveModule();
  }
  //end of initState function

  //start of function of retrieving  the module namd and teachers name
  Future<void> retrieveModule() async {
    setState(() {
      emptyText = "";
    });
    String level_name = "Level 6";
    try{
      Dio dio = Dio(
        BaseOptions(
          connectTimeout: Duration(seconds: 20),
          receiveTimeout: Duration(seconds: 20),
          headers: {
            "Accept": "*/*"
          }
        )
      );


      var IpAddress = "192.168.102.102";
      var dataSend = {
        "level_name":level_name
      };
      var urlSendData = "http://${IpAddress}/project_app/student_module.php";

      Response response = await dio.post(
        urlSendData,
        data: FormData.fromMap(dataSend)
      );

      if(response.statusCode == 200){
        // print(response.data);
        var dataReceived = response.data;
        if(dataReceived['message'] == "No Modules enrolled"){
          setState(() {
            emptyText = "No modules enrolled";
          });
        }else{
          var ReceivedData = dataReceived['message'];
          setState(() {
            for(var ReceivedData1 in ReceivedData ){
              module_name.add(ReceivedData1['module_name']);
              module_lecture.add(ReceivedData1['fname']);
            }
          });
        }
      }

    }catch(e){
      if(e is DioException){
        switch(e.type){
          case DioExceptionType.connectionTimeout:
               print("Connection TimeOut ${e.message} ");
               break;
          case DioExceptionType.connectionError:
               print("connection Error: ${e.message}");
               break;
          case DioExceptionType.receiveTimeout:
               print("receieve error: ${e.message} ");
               break;
          case DioExceptionType.sendTimeout:
               print("send error: ${e.message} ");
               break;
          case DioExceptionType.badCertificate:
               print("bad certificate ${e.message} ");
               break;
          case DioExceptionType.unknown:
               print("unknow error: ${e.message} ");
               break;
          case DioExceptionType.cancel:
               print("cancel error: ${e.message} ");
               break;
          default:
                print("default error: ${e.message} ");
                break;                    
                         
        }
      }else{
        print("else error: $e");
      }      
    }
  }
  //end of function of retrieving  the module namd and teachers name 

  @override  
  Widget build(BuildContext context ){
    return RefreshIndicator(
      onRefresh: () async {
        module_name.clear();
        module_lecture.clear();
        await retrieveModule();
      },
      child: Column(
        children: [
          // SizedBox(
          //   height: MediaQuery.of(context).size.height * 0.05,
          // ),
          if(emptyText.isNotEmpty)
             Center(
              child: Text(emptyText),
              )
          else    
            Container(
              height: 580,
              decoration: BoxDecoration(
                // color: Colors.red
              ),
              child: ListView.builder(
                itemCount: module_name.length,
                itemBuilder: (BuildContext context,int index) {
                  return Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 15),
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                height: 120,
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black54.withOpacity(0.3),
                                      offset: Offset(0, 5),
                                      blurRadius: 7,
                                      spreadRadius: 2
                                    )
                                  ],
                                  color: Color(0xFF2E7A88).withOpacity(0.8),
                                  borderRadius: BorderRadius.circular(15)
                                ),
                                padding: EdgeInsets.all(10),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text(module_name[index],
                                        style: TextStyle(
                                          fontFamily: "PlayfairDisplay",
                                          fontSize: 16,
                                          color: Colors.white
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          width: 60,
                                          child: Text("Lecture",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: "PlayfairDisplay",
                                            fontSize: 16
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 6,
                                        ),
                                        Container(
                                          width: 120,
                                          child: Text(module_lecture[index],
                                          style: TextStyle(
                                            fontFamily: "PlayfairDisplay",
                                            fontSize: 16,
                                            color: Colors.white
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        Flexible(
                                          child: SizedBox(
                                            width: double.infinity
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: (){
                                            print("Let us go");
                                          },
                                          child: Icon(
                                            Icons.arrow_forward_ios,
                                            color: Colors.white,
                                            size: 15,
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // SizedBox(height: 15,),
                    ],
                  );
                }
              ),
            ),
          // SizedBox(
          //   height: 50,
          // )
        ],
      ),
    );
  }
}




