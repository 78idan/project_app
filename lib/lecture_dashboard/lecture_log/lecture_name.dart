import 'package:flutter/material.dart';
import 'package:project_app/lecture_dashboard/lecture_log/lecture_week.dart';
import "package:dio/dio.dart";

// void main(){
//   runApp(student_no1_1());
// }

// class student_no1_1 extends StatelessWidget{
//   @override  
//   Widget build(BuildContext context ){
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: student_no1_2(),
//     );
//   }
// }

class student_no1_2 extends StatefulWidget{
  final String IpAddress;
  student_no1_2({required this.IpAddress });
  @override  
  student_no1_3 createState()=> student_no1_3();
}

class student_no1_3 extends State<student_no1_2>{
  @override  
  Widget build(BuildContext context ){
    return Scaffold(
      backgroundColor: Color(0xFF002147),
      appBar: StudentNoAppBar(context),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              student_noContainer1_1(IpAddress: widget.IpAddress)
            ],
          ),
        ),
      ),
    );
  }
}


PreferredSizeWidget StudentNoAppBar(BuildContext context ){
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

class student_noContainer1_1 extends StatefulWidget{
  final String IpAddress;
  student_noContainer1_1({required this.IpAddress });  
  @override  
  student_noContainer1_2 createState()=> student_noContainer1_2();
}


class student_noContainer1_2 extends State<student_noContainer1_1>{
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
      String region = "Arusha";
      var IpAddress = widget.IpAddress;
      var dataSent = {
        "region": region
      };
      var UrlSent = "http://${IpAddress}/project_app/lecture_name.php";
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
      ? Center(child: Text("No student reported",
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
                      builder: (context)=>lecture_week1_2(IpAddress: widget.IpAddress, candidate_num: candidates_no[index], nameIdentity: name[index], )
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



