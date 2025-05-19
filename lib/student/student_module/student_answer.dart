import 'package:flutter/material.dart';
import 'package:dio/dio.dart';


// void main(){
//   runApp(
//     student_Assign1_1()
//   );
// }

// class student_Assign1_1 extends StatelessWidget{
//   @override  
//   Widget build(BuildContext context ){
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: student_Assign1_2(),
//     );
//   }
// }

class student_Assign1_2 extends StatefulWidget{
  final String dataBase_table;
  final String question_note;
  final String candidee_num;
  final String candidee_level;
  final String IpAddress;
  student_Assign1_2({ required this.dataBase_table, required this.question_note, required this.candidee_num, required this.candidee_level, required this.IpAddress });
  @override  
  student_Assign1_3 createState()=> student_Assign1_3();
}


class student_Assign1_3 extends State<student_Assign1_2>{
  @override  
  Widget build(BuildContext context ){
    return Scaffold(
      backgroundColor: Color(0xFF002147),
      appBar: student_AssignAppBar(context),
      body: Padding(
        padding: EdgeInsets.fromLTRB(15, 20, 15, 0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              student_questionAnswer1_2(dataBase_table: widget.dataBase_table, question_note: widget.question_note, candidee_num: widget.candidee_num, candidee_level: widget.candidee_level,IpAddress: widget.IpAddress,)
            ],
          ),
        )
      ),
    );
  }
}


PreferredSizeWidget student_AssignAppBar( BuildContext context ){
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


class student_questionAnswer1_2 extends StatefulWidget{
  final String dataBase_table;
  final String question_note;
  final String candidee_num;
  final String candidee_level;
  final String IpAddress;
  student_questionAnswer1_2({required this.dataBase_table, required this.question_note, required this.candidee_num, required this.candidee_level , required this.IpAddress });  
  @override  
  student_questionAnswer1_3 createState()=> student_questionAnswer1_3();
}

class student_questionAnswer1_3 extends State<student_questionAnswer1_2>{
  TextEditingController answerController = TextEditingController();
  String candidee_answer = "";
  String candidee_time = "";

  void timeCalculation(){
    final now = DateTime.now();
    final hour = now.hour;
    final minute = now.minute.toString().padLeft(2, '0'); // ensures two digits
    final timeString = '$hour:$minute';
    // print(timeString);
    setState(() {
      candidee_time = timeString;
    });    
  }

  Future<void> answerSend() async {
  String table_name = widget.dataBase_table;
  String question_note = widget.question_note;
  String candidee_num = widget.candidee_num; 
  String candidee_level = widget.candidee_level;  
    timeCalculation();
    try{
      Dio dio = Dio(
        BaseOptions(
          connectTimeout: Duration(seconds: 15),
          receiveTimeout: Duration(seconds: 15),
          headers: {
            "Accept": "*/*"
          }
        )
      );
      var IpAddress = widget.IpAddress;
      var UrlAnswer = "http://${IpAddress}/project_app/student_answer.php";
      var dataSent = {
        "table_name": table_name,
        "question_note": question_note,
        "candidee_num": candidee_num,
        "answer_controller": answerController.text,
        "candidee_level": candidee_level,
        "candidee_time": candidee_time
      };

      Response response = await dio.post(
        UrlAnswer,
        data: FormData.fromMap(dataSent)
      );

      if(response.statusCode == 200 ){
        answerController.clear();
        // print(response.data);
        var dataReceived = response.data;
        var dataDisplayed = dataReceived['message'];
        if(dataDisplayed == "You have submitted"){
          customNotification.notificationCustom(context, message: dataDisplayed,picIcon: Icon(Icons.check,size: 24,color: Colors.white,));
        }else{
          customNotification.notificationCustom(context, message: dataDisplayed);
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

  GlobalKey questionKey = GlobalKey<FormState>();
  @override  
  Widget build(BuildContext context){
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      child: Text(widget.question_note,
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: "PlayfairDisplay",
                        fontSize: 15
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Answer Below",
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 13,
                    fontFamily: "PlayfairDisplay"
                  ),
                  )
                ],
              ),
              SizedBox(height: 10,),
              Form(
                key: questionKey,
                child: Column(
                  children: [
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxHeight: 300,
                        minHeight: 300
                      ),
                      child: Column(
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: answerController,
                              expands: true,
                              maxLines: null,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontFamily: "PlayfairDisplay",
                              ),
                              keyboardType: TextInputType.multiline,
                              textAlignVertical: TextAlignVertical.top,
                              decoration: InputDecoration(
                                hintText: "Answer......",
                                hintStyle: TextStyle(
                                  color: Colors.white
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
                                )
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 4,),
                    Row(
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: MaterialButton(
                              onPressed: (){
                                // timeCalculation();
                                // print(answerController.text);
                                answerSend();
                              },
                              height: 50,
                              color: Color(0xFF5DADE2),
                              textColor: Colors.white,
                              child: Text("Submit"),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 40,),
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
        bottom: 20,
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

