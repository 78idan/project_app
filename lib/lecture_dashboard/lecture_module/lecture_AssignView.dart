import 'package:flutter/material.dart';
import 'package:dio/dio.dart';


// void main(){
//   runApp(
//     lecture_AssignView1_1()
//   );
// }

// class lecture_AssignView1_1 extends StatelessWidget{
//   @override  
//   Widget build(BuildContext context ){
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: lecture_AssignView1_2(),
//     );
//   }
// }

class lecture_AssignView1_2 extends StatefulWidget{
  final String nameOfTable;
  final String admin_num;
  final String level;
  final String IpAddress;

  lecture_AssignView1_2({ required this.nameOfTable, required this.admin_num, required this.level, required this.IpAddress    });

  @override  
  lecture_AssignView1_3 createState()=> lecture_AssignView1_3();
}

class lecture_AssignView1_3 extends State<lecture_AssignView1_2>{
  @override  
  Widget build(BuildContext context ){
    return Scaffold(
      backgroundColor: Color(0xFF002147),
      appBar: lectureAssignViewAppBar(context, widget.admin_num, widget.level),
      body: Padding(
        padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
        child: viewAnswer1_1(table_name: widget.nameOfTable, number_admin: widget.admin_num, IpAddress: widget.IpAddress),
      ),
    );
  }
}

PreferredSizeWidget lectureAssignViewAppBar( BuildContext context, String admission_num, String Level ){
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
    title: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(admission_num,
        style: TextStyle(
          color: Colors.white,
          fontFamily: "PlayfairDisplay",
          fontSize: 16
        ),
        ),
        Text(Level,
        style: TextStyle(
          color: Colors.white,
          fontFamily: "PlayfairDisplay",
          fontSize: 17
        ),
        )
      ],
    ),
  );
}


class viewAnswer1_1 extends StatefulWidget{

  final String table_name;
  final String number_admin;
  final String IpAddress;

  viewAnswer1_1({ required this.table_name, required this.number_admin, required this.IpAddress  });

  @override  
  viewAnswer1_2 createState()=> viewAnswer1_2();
}


class viewAnswer1_2 extends State<viewAnswer1_1>{

  @override  
  void initState(){
    super.initState();
    retrievingAnswer();
  }

  String answerData = "";


  //start of function of retrievingAnswer
  Future<void> retrievingAnswer() async {
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

      var IpAddress = widget.IpAddress;
      var urlRequestAnswer = "http://${IpAddress}/project_app/lecture_AssignView.php";
      var dataSent = {
        "tableOfName": widget.table_name,
        "admission_number": widget.number_admin
      };

      Response response = await dio.post(
        urlRequestAnswer,
        data: FormData.fromMap(dataSent)
      );

      if(response.statusCode == 200){
        // print(response.data);
        var dataReceived = response.data;
        setState(() {
          answerData = dataReceived['message'];
        });
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
  //end of function of retrievingAnswer

  @override  
  Widget build(BuildContext context){
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        child: Text(answerData,
        style: TextStyle(
          color: Colors.white
        ),
        ),
      ),
    );
  }
}





