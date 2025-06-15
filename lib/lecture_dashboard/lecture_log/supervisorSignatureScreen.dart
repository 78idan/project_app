


import "package:flutter/material.dart";
import 'package:http_parser/http_parser.dart';

import 'dart:typed_data';
import 'package:signature/signature.dart';
import 'package:dio/dio.dart';

// void main() => runApp(SignatureApp());

// class SignatureApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Signature Upload',
//       home: SignatureScreen(),
//       debugShowCheckedModeBanner: false,
//     );
//   }
// }

class SignatureScreen extends StatefulWidget {
  final String IpAddress;
  final String candidate_table;

  SignatureScreen({required this.IpAddress, required this.candidate_table });
  @override
  _SignatureScreenState createState() => _SignatureScreenState();
}

class _SignatureScreenState extends State<SignatureScreen> {
  //start of void function
  @override 
  void initState(){
    super.initState();
    print(widget.IpAddress);
    print(widget.candidate_table);

    // _uploadSignature();
  }
  //end of void function
  final SignatureController _controller = SignatureController(
    penStrokeWidth: 3,
    penColor: Colors.black,
    exportBackgroundColor: Colors.white,
  );

  bool _isUploading = false;
  String candidate_num = "22050513039";
  Future<void> _uploadSignature() async {
    if (_controller.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Please provide a signature first.'),
      ));
      return;
    }
    setState(() => _isUploading = true);        
    // print("hello ");
    // String module_name = widget.candidate_table;
    try{
      Uint8List? data = await _controller.toPngBytes();
      if (data == null) throw Exception("Could not capture signature");
        Dio dio = Dio(
          BaseOptions(
            connectTimeout: Duration(seconds: 20),
            receiveTimeout: Duration(seconds: 20),
            headers: {
              "Accept": "*/*"
            }
          )
        );
        // print(module_name);
        var IpAddress = widget.IpAddress;
        // var dataSend = {
        //   "Table_name": module_name
        // };
        FormData formData = FormData.fromMap({
          'candidate_table': widget.candidate_table,
          'signature': MultipartFile.fromBytes(
            data,
            filename: 'signature.png',
            contentType: MediaType('image', 'png'),
          ),
        });
        var urlDataSend = "http://${IpAddress}/project_app/lectureSupervisor_media.php";
        Response response = await dio.post(
          urlDataSend,
          data: formData
        );
        if(response.statusCode == 200){
          // print("Thank God");
          // print(response.data);
          var receivedData = response.data;
          _controller.clear();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(receivedData['message']))
          );
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
    }finally {
      setState(() => _isUploading = false);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF002147),
      appBar: sigAppBar(context),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Signature(
              controller: _controller,
              height: 250,
              width: double.infinity,
              backgroundColor: Colors.grey[200]!,
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  icon: Icon(Icons.clear),
                  label: Text('Clear'),
                  onPressed: () => _controller.clear(),
                ),
                ElevatedButton.icon(
                  icon: _isUploading
                      ? CircularProgressIndicator(color: Colors.white, strokeWidth: 2)
                      : Icon(Icons.upload),
                  label: Text('Upload'),
                  onPressed: _isUploading ? null : _uploadSignature,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

PreferredSizeWidget sigAppBar(BuildContext context ){
  return AppBar(
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
    title: Text("Signature",
    style: TextStyle(
      color: Colors.white
    ),
    ),
    centerTitle: true,
  );
}

















