import 'package:flutter/material.dart';
import 'package:project_app/lecture_dashboard/lecture_module/lecture_AssignView.dart';
import 'package:dio/dio.dart';

void main(){
  runApp(
    lecture_AssignList1_1()
  );
}

class lecture_AssignList1_1 extends StatelessWidget{
  @override  
  Widget build(BuildContext context ){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: lecture_AssignList1_2(),
    );
  }
}



class lecture_AssignList1_2 extends StatefulWidget{
  @override  
  lecture_AssignList1_3 createState()=> lecture_AssignList1_3();
}


class lecture_AssignList1_3 extends State<lecture_AssignList1_2>{
  @override  
  Widget build(BuildContext context ){
    return Scaffold(
      backgroundColor: Color(0xFF002147),
      appBar: lectureAssignListAppBar(context),
      body: Padding(
        padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: lectureAssignListContainer1_1()
        ),
      ),
    );
  }
}

PreferredSizeWidget lectureAssignListAppBar(BuildContext context ){
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



class lectureAssignListContainer1_1 extends StatefulWidget{
  @override  
  lectureAssignListContainer1_2 createState()=> lectureAssignListContainer1_2();
}

class lectureAssignListContainer1_2 extends State<lectureAssignListContainer1_1>{

  String tableOfName = "DataBase Management_qualot";
  //start of function of requesting data
  Future<void> requestingData() async {
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
      var IpAddress = "192.168.33.102";
      var urlRequestingData = "http://${IpAddress}/project_app/lecture_AssignList.php";
      var dataSend = {
        "tableOfName": tableOfName
      };

      Response response = await dio.post(
        urlRequestingData,
        data: FormData.fromMap(dataSend)
      );

      if(response.statusCode == 200){
        print(response.data);
      }

    }catch(e){
      if(e is DioException){
        switch(e.type){
          case DioExceptionType.connectionTimeout:
              print("connection Timeout Error: ${e.message} ");
              break;
          case DioExceptionType.connectionError:
              print("connectionError: ${e.message} ");
              break;
          case DioExceptionType.sendTimeout:
              print("send TimeOut error: ${e.message} ");
              break;
          case DioExceptionType.receiveTimeout:
              print("receieve timeOut: ${e.message} ");
              break;
          case DioExceptionType.cancel:
              print("cancel error: ${e.message} ");
              break;
          case DioExceptionType.unknown:
              print("unknown error: ${e.message} ");
              break;
          default:
              print("default error: ${e.message} ");
              break;                              
        }
      }else{
        print("else eror: $e ");
      }      
    }
  }
  //end of function of requesting data

  @override  
  Widget build(BuildContext context ){
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.05,
        ),
        Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: (){
                  // print("Thank God");
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context)=> lecture_AssignView1_2()
                    )
                  );
                },
                child: Container(
                  height: 90,
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
                          Text("22050513038",
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
                          Text("LEVEL 8",
                          style: TextStyle(
                            fontFamily: "PlayfairDisplay",
                            fontSize: 16,
                            color: Colors.white
                          ),
                          ),
                          SizedBox(
                            width: 6,
                          ),
                          Text("18:06",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "PlayfairDisplay"
                          ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 15,),
        Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: (){
                  print("Thank You God");
                },
                child: Container(
                  height: 90,
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
                          Text("22050513037",
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
                          Text("LEVEL 8",
                          style: TextStyle(
                            fontFamily: "PlayfairDisplay",
                            fontSize: 16,
                            color: Colors.white
                          ),
                          ),
                          SizedBox(
                            width: 6,
                          ),
                          Text("17:08",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "PlayfairDisplay"
                          ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 50,
        )
      ],
    );
  }
}




