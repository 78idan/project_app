// import 'dart:io';

// import 'package:dio/io.dart';
import 'package:flutter/material.dart';

import 'package:dio/dio.dart';


// void main(){
//   runApp(
//     lecture_module1_1()
//   );
// }

// class lecture_module1_1 extends StatelessWidget{
//   @override  
//   Widget build(BuildContext context ){
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: lecture_module1_2(),
//     );
//   }
// }



class lecture_module1_2 extends StatefulWidget{
  
  @override  
  lecture_module1_3 createState()=> lecture_module1_3();
}


class lecture_module1_3 extends State<lecture_module1_2>{


  @override  
  Widget build(BuildContext context ){
    return Scaffold(
      backgroundColor: Color(0xFF002147),
      appBar: lectureModuleAppBar(context),
      body: Padding(
        padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: lectureModuleContainer1_1()
        ),
      ),
    );
  }
}

PreferredSizeWidget lectureModuleAppBar( BuildContext context ){
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



class lectureModuleContainer1_1 extends StatefulWidget{
  


  @override  
  lectureModuleContainer1_2 createState()=> lectureModuleContainer1_2();
}

class lectureModuleContainer1_2 extends State<lectureModuleContainer1_1>{
   
  String lecture_admissionNumber = "22050513037";
  var modulesReceived = [];
  var countReceived = [];


  @override  
  void initState(){
    super.initState();
    retrieve_Module();
    // print(modulesReceived);
  }

  

  


  Future<void> retrieve_Module() async {
    try{
      Dio dio = Dio(
        BaseOptions(
          connectTimeout: Duration(seconds: 20),
          receiveTimeout: Duration(seconds: 20)
        )
      );
      // (dio.httpClientAdapter as IOHttpClientAdapter ).createHttpClient = (){
      //   HttpClient client = HttpClient();
      //   client.badCertificateCallback = (X509Certificate cert, String host, int port)=>true;
      //   return client;
      // };

      // var ipAddress = "192.168.27.102";
      var url = "http://192.168.93.102/project_app/lecture_module.php";
      var dataSent = {
        "lecture_admissionNumber": lecture_admissionNumber
      };

      Response response = await dio.post(
        url,
        data: FormData.fromMap(dataSent)
      );

      if(response.statusCode == 200){
        print(response.data);
        var moduleData = response.data;
        var moduleData2 = moduleData['message'];

        for(var moduleData3 in moduleData2){
          setState(() {
            modulesReceived.add(moduleData3['modules']);
            countReceived.add(moduleData3['count']);
          });
        }
        print("module receieved: ${modulesReceived} ");
        print("module receieved: ${modulesReceived.length} ");
          

      }else{
        print("error status code");
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

  @override  
  Widget build(BuildContext context ){
    return Column(
      children: [
        // Text("",
        // style: TextStyle(
        //   color: Colors.white
        // ),
        // ),
        Container(
          height: 480,
          decoration: BoxDecoration(
            // color: Colors.red
          ),
          child: ListView.builder(
            itemCount: modulesReceived.length,
            itemBuilder: (context, index){
              return Padding(
                padding: EdgeInsets.only(bottom: 15),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 120,
                        decoration: BoxDecoration(
                          color: Color(0xFF2E7A88).withOpacity(0.8),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black54.withOpacity(0.3),
                              offset: Offset(0, 5),
                              blurRadius: 7,
                              spreadRadius: 2
                            )
                          ],                          
                          borderRadius: BorderRadius.circular(15),
                        ),
                        padding: EdgeInsets.all(10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(modulesReceived[index],
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
                              CircleAvatar(
                                radius: 16,
                                child: Icon(
                                  Icons.person,
                                  size: 16,
                                  // color: Colors.blue,
                                ),
                              ),
                              SizedBox(
                                width: 6,
                              ),
                              Text("${countReceived[index]}",
                              style: TextStyle(
                                fontFamily: "PLayfairDisplay",
                                fontSize: 16,
                                color: Colors.white
                              ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.65,
                              ),
                              GestureDetector(
                                onTap: (){
                                  print("Let us go");
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //     builder: (context)=> lecture_courAssign1_2()
                                  //   )
                                  // );
                                },
                                child: Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.white,
                                  size: 15,
                                ),
                              )                              
                            ],
                          )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        )
      ],
    );
  }
  
  // @override  
  // Widget build(BuildContext context ){
  //   return Column(
  //     children: [
  //       SizedBox(
  //         height: MediaQuery.of(context).size.height * 0.05,
  //       ),
  //       for(var modulesReceived2 in modulesReceived)
  //       Row(
  //         children: [
  //           Expanded(
  //             child: Container(
  //               height: 120,
  //               decoration: BoxDecoration(
  //                 boxShadow: [
  //                   BoxShadow(
  //                     color: Colors.black54.withOpacity(0.3),
  //                     offset: Offset(0, 5),
  //                     blurRadius: 7,
  //                     spreadRadius: 2
  //                   )
  //                 ],
  //                 color: Color(0xFF2E7A88).withOpacity(0.8),
  //                 borderRadius: BorderRadius.circular(15)
  //               ),
  //               padding: EdgeInsets.all(10),
  //               child: Column(
  //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                 children: [
  //                   Row(
  //                     mainAxisAlignment: MainAxisAlignment.start,
  //                     children: [
  //                       Text(modulesReceived2,
  //                       style: TextStyle(
  //                         fontFamily: "PlayfairDisplay",
  //                         fontSize: 16,
  //                         color: Colors.white
  //                       ),
  //                       overflow: TextOverflow.ellipsis,
  //                       maxLines: 1,
  //                       )
  //                     ],
  //                   ),
  //                   Row(
  //                     children: [
  //                       CircleAvatar(
  //                         radius: 16,
  //                         child: Icon(
  //                           Icons.person,
  //                           size: 16,
  //                           // color: Colors.blue,
  //                         ),
  //                       ),
  //                       SizedBox(
  //                         width: 6,
  //                       ),
  //                       Text("125",
  //                       style: TextStyle(
  //                         fontFamily: "PLayfairDisplay",
  //                         fontSize: 16,
  //                         color: Colors.white
  //                       ),
  //                       ),
  //                       SizedBox(
  //                         width: MediaQuery.of(context).size.width * 0.65,
  //                       ),
  //                       GestureDetector(
  //                         onTap: (){
  //                           // print("Let us go");
  //                           Navigator.push(
  //                             context,
  //                             MaterialPageRoute(
  //                               builder: (context)=> lecture_courAssign1_2()
  //                             )
  //                           );
  //                         },
  //                         child: Icon(
  //                           Icons.arrow_forward_ios,
  //                           color: Colors.white,
  //                           size: 15,
  //                         ),
  //                       )
  //                     ],
  //                   ),
  //                 ],
  //               ),
  //             ),
  //           ),
  //         ],
  //       ),
  //       // SizedBox(height: 15,),
  //       // SizedBox(
  //       //   height: 50,
  //       // )
  //     ],
  //   );
  // }
}




