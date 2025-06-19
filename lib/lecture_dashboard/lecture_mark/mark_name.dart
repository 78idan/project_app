import 'package:flutter/material.dart';
// import 'package:project_app/lecture_dashboard/lecture_log/lecture_week.dart';
import "package:dio/dio.dart";
import 'package:project_app/lecture_dashboard/lecture_mark/mark_lecture.dart';

// void main(){
//   runApp(mark_student1_1());
// }

// class mark_student1_1 extends StatelessWidget{
//   @override  
//   Widget build(BuildContext context ){
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: mark_student1_2(),
//     );
//   }
// }

class mark_student1_2 extends StatefulWidget{
  final String IpAddress;
  final String region;
  mark_student1_2({required this.IpAddress, required this.region });
  @override  
  mark_student1_3 createState()=> mark_student1_3();
}

class mark_student1_3 extends State<mark_student1_2>{
  @override  
  Widget build(BuildContext context ){
    return Scaffold(
      backgroundColor: Color(0xFF002147),
      appBar: markStudentAppBar(context),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              mark_studentContainer1_1(IpAddress: widget.IpAddress, region: widget.region,)
            ],
          ),
        ),
      ),
    );
  }
}


PreferredSizeWidget markStudentAppBar(BuildContext context ){
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

class mark_studentContainer1_1 extends StatefulWidget{
  final String IpAddress;
  final String region;
  mark_studentContainer1_1({required this.IpAddress, required this.region });  
  @override  
  mark_studentContainer1_2 createState()=> mark_studentContainer1_2();
}


class mark_studentContainer1_2 extends State<mark_studentContainer1_1>{
  var candidates_no = [];
  var name = [];
  // start of void function
  void initState(){
    super.initState();
    retrievingCandidatesNum();
  }
  // end of void function

  // start of function of retrieveing candidates number
  Future<void> retrievingCandidatesNum() async {
    try{
      Dio dio = Dio(
        BaseOptions(
           connectTimeout: Duration(seconds: 15),
           receiveTimeout: Duration(seconds: 15)
        )
      );
      String region = widget.region;
      var IpAddress = widget.IpAddress;
      var dataSent = {
        "region": region
      };
      var UrlSent = "http://${IpAddress}/project_app/mark_name.php";
      Response response = await dio.post(
        UrlSent,
        data: FormData.fromMap(dataSent)
      );
      if(response.statusCode == 200){
        // print(response.data);
        var dataReceived = response.data;
        var report = dataReceived['message'];
        for(var report2 in report){
          setState(() {
            candidates_no.add(report2['candidates_no']);
            name.add(report2['name']);
          });            
        }
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
  // end of function of retrieveing candidates number 

  @override  
  Widget build(BuildContext context){
    return Container(
      height: 580,
      decoration: BoxDecoration(
        // color: Colors.red
      ),
      child: candidates_no.isEmpty
      ? Center(child: Text("No student details",
      style: TextStyle(
        fontFamily: "PlayfairDisplay",
        color: Colors.white
      ),
      ),)
      :ListView.builder(
        itemCount: candidates_no.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              GestureDetector(
                onTap: (){
                  // print("Monday");
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context)=>markLecture1_2(IpAddress: widget.IpAddress, candidate_num: candidates_no[index])
                    )
                  );
                },
                child: Container(
                  height: 75,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xFF1A3A6F),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(candidates_no[index],
                        style: TextStyle(
                          color: Colors.white
                        ),
                        ),
                        Text(name[index],
                        style: TextStyle(
                          color: Colors.white
                        ),
                        )
                      ],
                    ),
                  )
                ),
              ),
              SizedBox(height: 10,),         
            ],
          );
        }
      ),
    );
  }
}



