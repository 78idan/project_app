import 'package:flutter/material.dart';
import 'package:project_app/lecture_dashboard/lecture_module/lecture_AssignView.dart';
import 'package:dio/dio.dart';

// void main(){
//   runApp(
//     lecture_AssignList1_1()
//   );
// }

// class lecture_AssignList1_1 extends StatelessWidget{
//   @override  
//   Widget build(BuildContext context ){
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: lecture_AssignList1_2(),
//     );
//   }
// }



class lecture_AssignList1_2 extends StatefulWidget{
  final String nameOfTable;
  final String IpAddress;
  lecture_AssignList1_2({ required this.nameOfTable, required this.IpAddress });
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
          child: lectureAssignListContainer1_1(table_name: widget.nameOfTable, IpAddress: widget.IpAddress)
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
  final String table_name;
  final String IpAddress;
  lectureAssignListContainer1_1({ required this.table_name, required this.IpAddress });
  @override  
  lectureAssignListContainer1_2 createState()=> lectureAssignListContainer1_2();
}

class lectureAssignListContainer1_2 extends State<lectureAssignListContainer1_1>{

  // String tableOfName = "DataBase Management_qualot";
  // var IpAddress2 = "192.168.33.102";
  String emptyText = "";
  bool isLoading = false;
  List<String> candidee_num = [];
  List<String> candidee_level = [];
  List<String> candidee_time = [];
  @override  
  void initState(){
    super.initState();
    requestingData();
  }
  
  //start of function of requesting data
  Future<void> requestingData() async {
  String tableOfName = widget.table_name;
  var IpAddress2 = widget.IpAddress;    
    setState(() {
      isLoading = true;
      emptyText = "";
    });
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
      var IpAddress = IpAddress2;
      var urlRequestingData = "http://${IpAddress}/project_app/lecture_AssignList.php";
      var dataSend = {
        "tableOfName": tableOfName
      };

      Response response = await dio.post(
        urlRequestingData,
        data: FormData.fromMap(dataSend)
      );

      if(response.statusCode == 200){
        setState(() {
          isLoading = false;
          emptyText = "";
        });
        // print(response.data);
        var candideeData = response.data;
        var fetchedDataCandidee = candideeData['message'];
        // print(fetchedDataCandidee);
        if(candideeData['message'] == "No Answer submitted"){
          setState(() {
            emptyText = "No Answer submitted";
          });
        }else{
          setState(() {          
            for (var fetchedDataCandidee2 in fetchedDataCandidee){
              candidee_num.add(fetchedDataCandidee2['candidee_num']);
              candidee_level.add(fetchedDataCandidee2['candidee_level']);
              candidee_time.add(fetchedDataCandidee2['candidee_time']);
            }
          }); 
        }         
        // print(candidee_num.length);
        // print(c        // print(candidee_num.length);
        // print(candidee_level.length);
        // print(candidee_time.length);andidee_level.length);
        // print(candidee_time.length);
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
    return RefreshIndicator(
      onRefresh: () async {
        candidee_num.clear();
        candidee_level.clear();
        candidee_time.clear();
        await requestingData();
      },
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          if(isLoading)
            Center(
              child: CircularProgressIndicator(
                strokeWidth: 1,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            )
          else if(emptyText.isNotEmpty)
            Center(
              child: Text(emptyText,
              style: TextStyle(
                fontFamily: "PlayfairDisplay",
                color: Colors.white
              ),
              ),
            ) 
          else   
            Container(
              height: 580,
              decoration: BoxDecoration(
                // color: Colors.red
              ),
              child: ListView.builder(
                itemCount: candidee_num.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: (){
                                // print("Thank God");
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context)=> lecture_AssignView1_2(nameOfTable: widget.table_name, admin_num: candidee_num[index], level: candidee_level[index], IpAddress: widget.IpAddress)
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
                                        Text(candidee_num[index],
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
                                        Text(candidee_level[index],
                                        style: TextStyle(
                                          fontFamily: "PlayfairDisplay",
                                          fontSize: 16,
                                          color: Colors.white
                                        ),
                                        ),
                                        SizedBox(
                                          width: 6,
                                        ),
                                        Text(candidee_time[index],
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
                    ],
                  );
                }
              ),
            ),
            SizedBox(
              height: 50,
            )
        ],
      ),
    );
  }
}




