import 'package:flutter/material.dart';
import "package:dio/dio.dart";
import "package:file_picker/file_picker.dart";
import 'package:permission_handler/permission_handler.dart';



// void main(){
//   runApp(
//     studentTechnical_report1_1()
//   );
// }

// class lecture_addNote1_1 extends StatelessWidget{
//   @override  
//   Widget build(BuildContext context ){
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: studentTechnical_report(),
//     );
//   }
// }



class studentTechnical_report1_2 extends StatefulWidget{  
  final String candidate_num;
  final String IpAddress;
  final String candidate_level;
  final String nameIdentity;
  studentTechnical_report1_2({ required this.candidate_num,required this.IpAddress, required this.candidate_level, required this.nameIdentity  });
  @override  
  studentTechnical_report1_3 createState()=> studentTechnical_report1_3();
}


class studentTechnical_report1_3 extends State<studentTechnical_report1_2>{
  @override  
  Widget build(BuildContext context ){
    return Scaffold(
      backgroundColor: Color(0xFF002147),
      appBar: studentTechnical_reportAppBar(context),
      body: Padding(
        padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              studentTechnical_reportTextField1_1(candidate_num: widget.candidate_num, IpAddress: widget.IpAddress, candidate_level: widget.candidate_level, nameIdentity: widget.nameIdentity)
            ],
          ),
        ),
      ),
    );
  }
}

PreferredSizeWidget studentTechnical_reportAppBar(BuildContext context){
  return AppBar(
    elevation: 0,
    backgroundColor: Color(0xFF002147),
    leading: IconButton(
      onPressed: (){
        Navigator.of(context).pop(true);
      },
      icon: Icon(
        Icons.arrow_back,
        color: Colors.white,
      ),
    ),
  );
}


class studentTechnical_reportTextField1_1 extends StatefulWidget{   
  final String candidate_num;
  final String IpAddress;
  final String candidate_level;
  final String nameIdentity;
  studentTechnical_reportTextField1_1({ required this.candidate_num,required this.IpAddress, required this.candidate_level, required this.nameIdentity  });   
  @override  
  studentTechnical_reportTextField1_2 createState()=> studentTechnical_reportTextField1_2();
}

class studentTechnical_reportTextField1_2 extends State<studentTechnical_reportTextField1_1>{
  final keyCourse = GlobalKey<FormState>();
  TextEditingController attachNote = TextEditingController();
  String? selectedFilePath;
  String? selectedFileName;  

  //start of validatingController
  Future<void> validatingController()async{
    if(attachNote.text.isEmpty){
      customNotification.notificationCustom(context, message: "Field is empty");
    }else{
      sendNote();
    }
  }
  //end of validatingController

  //start of sendNote function
  Future<void> sendNote() async {
    String Table_name = widget.candidate_num+"_report";
    try{
      Dio dio = Dio(
        BaseOptions(
          connectTimeout: Duration(seconds: 15),
          receiveTimeout: Duration(seconds: 15),
        )
      );
      var IpAddress = widget.IpAddress;
      // var dataSend = {};
      FormData dataSend = FormData.fromMap({
        "note_file": await MultipartFile.fromFile(
          selectedFilePath!,
          filename: selectedFileName,
        ),
        'file_name': selectedFileName,
        "Table_name": Table_name,
        "candidate_num": widget.candidate_num,
        "student_name": widget.nameIdentity
      });

      var UrlSend = "http://${IpAddress}/project_app/studentTechnical_report.php";

      Response response = await dio.post(
        UrlSend,
        data: dataSend
      );

      if(response.statusCode == 200){
        print(response.data);
        attachNote.clear();
        var dataSelected = response.data;
        customNotification.notificationCustom(context, message: dataSelected['message']);
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
  //end of sendNote function


  //start of function of requestiong permission 
  Future<void> requestPermission() async{
    var statusBig = await Permission.storage.request();
    if(statusBig.isPermanentlyDenied ){
      openAppSettings();
    }else if(statusBig.isDenied ){
      customNotification.notificationCustom(context, message: "Storage not allowed");
    }
  } 
  //end of function of requestiong permission 

  //starting of function to fetch notes
  Future<void> fetchNotes() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf', 'doc', 'docx', 'xls', 'xlsx', 'ppt', 'pptx', 'csv'],
        allowMultiple: false,
      );

      if (result != null && result.files.single.path != null) {
        setState(() {
          selectedFilePath = result.files.single.path!;
          selectedFileName = result.files.single.name;
          // Display the file name in the text field
          attachNote.text = selectedFileName!;
        });
        
        // Show success notification
        
        print("Selected file path: $selectedFilePath");
        print("Selected file name: $selectedFileName");
      } else {
        // User canceled the picker or no file selected
        customNotification.notificationCustom(
          context,
          message: "No document selected",
          containerColor: Colors.orange,
          picIcon: Icon(
            Icons.info,
            color: Colors.white,
            size: 14,
          ),
        );
      }
    } catch (e) {
      print("Error picking file: $e");
      customNotification.notificationCustom(
        context,
        message: "Error selecting document",
        containerColor: Colors.red,
        picIcon: Icon(
          Icons.error,
          color: Colors.white,
          size: 14,
        ),
      );
    }
  }
  //ending of function to fetch notes 

  // Function to clear selected file
  void clearSelectedFile() {
    setState(() {
      selectedFilePath = null;
      selectedFileName = null;
      attachNote.clear();
    });
  }


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
                  Icons.add,
                  size: 45,
                ),
              )
            ],
          ),
          SizedBox(height: 15,),
          Form(
            key: keyCourse,
            child: Column(
              children: [                                                                                           
                SizedBox(height: 10,),
                TextFormField(
                  controller: attachNote,
                  readOnly: true,
                  onTap: () async {
                    // print("Thank God twice ");
                    await requestPermission();
                    await fetchNotes();
                  },
                  style: TextStyle(
                    color: Colors.white
                  ),
                  decoration: InputDecoration(
                    hintText: "Attach document",
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
                      Icons.attach_file_outlined,
                      color: Colors.grey[400],
                    ),
                    suffixIcon: selectedFileName != null 
                      ? IconButton(
                          onPressed: clearSelectedFile,
                          icon: Icon(
                            Icons.clear,
                            color: Colors.grey[400],
                          ),
                        )
                      : null,                    
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
                            validatingController();
                          },
                          textColor: Colors.white,
                          color: Color(0xFF5DADE2),
                          height: 50,
                          child: Text("Post"),
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