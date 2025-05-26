import 'package:flutter/material.dart';
// import 'package:weeklist/day.dart';
import 'package:project_app/lecture_dashboard/lecture_log/lecture_day.dart';
// void main(){
//   runApp(
//     lecture_week1_1()
//   );
// }


// class lecture_week1_1 extends StatelessWidget{
//   @override 
//   Widget build(BuildContext context){
//     return MaterialApp(
//       home: lecture_week1_2(),
//       debugShowCheckedModeBanner: false,
//     );
//   }
// }

class lecture_week1_2 extends StatefulWidget{
  @override  
  lecture_week1_3 createState()=> lecture_week1_3();
}


class lecture_week1_3 extends State<lecture_week1_2>{
  @override  
  Widget build(BuildContext context){
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Color(0xFF002147),
        appBar: LectureweekAppBar(context),
        body: TabBarView(
          children: [
            Padding(
              padding: EdgeInsets.all(16),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    lecture_example1()
                  ],
                ),
              )
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // Text("Hello")
                    lecture_report1_1()
                  ],
                ),
              ),
            )
          ],
        ),
        ),
    );
    
  }
}

PreferredSizeWidget LectureweekAppBar(BuildContext context){
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
    bottom: TabBar(
      dividerColor: Color(0xFF002147),
      indicatorSize: TabBarIndicatorSize.label,
      labelStyle: TextStyle(
        color: Colors.white,
        fontSize: 15,
      ),
      unselectedLabelStyle: TextStyle(
        color: Colors.grey,
        fontSize: 15
      ),
      labelColor: Colors.white,
      indicatorColor: Colors.white,
      unselectedLabelColor: Colors.grey,
      tabs: [  

        Tab(text: "LogBook",),
        Tab(text: "Details",)
      ],
    ),
  );
}


class lecture_example1 extends StatefulWidget{
  @override   
  lecture_example1_1 createState()=> lecture_example1_1();
}

class lecture_example1_1 extends State<lecture_example1>{
  @override  
  Widget build(BuildContext context ){
            return  Container(
                // height: 590,
                // width: double.infinity,
                decoration: BoxDecoration(
                  // color: Colors.red
                ),
                child:  Column(
                      children: [
                        GestureDetector(
                          onTap: (){
                            // print("Thank God");
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context)=>lecture_day1_2()
                              )
                            );
                          },
                          child: Container(
                            height: 80,
                            decoration: BoxDecoration(
                              // color: Colors.blue
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Week 1",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18
                                ),
                                ),
                                Icon(
                                  Icons.calendar_month,
                                  color: Colors.white,
                                  size: 24,
                                )
                              ],
                            ),
                          ),
                        ),
                        Divider(
                          height: 2,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        GestureDetector(
                          onTap: (){
                            // print("Thank God");
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context)=>lecture_day1_2()
                              )
                            );                            
                          },
                          child: Container(
                            height: 80,
                            decoration: BoxDecoration(
                              // color: Colors.blue
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Week 2",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18
                                ),
                                ),
                                Icon(
                                  Icons.calendar_month,
                                  color: Colors.white,
                                  size: 24,
                                )
                              ],
                            ),
                          ),
                        ),
                        Divider(
                          height: 2,
                          color: Colors.grey,
                        ),  
                        SizedBox(
                          height: 5,
                        ), 
                        GestureDetector(
                          onTap: (){
                            // print("Thank God");
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context)=>lecture_day1_2()
                              )
                            );                            
                          },
                          child: Container(
                            height: 80,
                            decoration: BoxDecoration(
                              // color: Colors.blue
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Week 3",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18
                                ),
                                ),
                                Icon(
                                  Icons.calendar_month,
                                  color: Colors.white,
                                  size: 24,
                                )
                              ],
                            ),
                          ),
                        ),
                        Divider(
                          height: 2,
                          color: Colors.grey,
                        ),  
                        SizedBox(
                          height: 5,
                        ),
                        GestureDetector(
                          onTap: (){
                            // print("Thank God");
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context)=>lecture_day1_2()
                              )
                            );                            
                          },
                          child: Container(
                            height: 80,
                            decoration: BoxDecoration(
                              // color: Colors.blue
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Week 4",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18
                                ),
                                ),
                                Icon(
                                  Icons.calendar_month,
                                  color: Colors.white,
                                  size: 24,
                                )
                              ],
                            ),
                          ),
                        ),
                        Divider(
                          height: 2,
                          color: Colors.grey,
                        ),  
                        SizedBox(
                          height: 5,
                        ),
                        GestureDetector(
                          onTap: (){
                            // print("Thank God");
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context)=>lecture_day1_2()
                              )
                            );                            
                          },
                          child: Container(
                            height: 80,
                            decoration: BoxDecoration(
                              // color: Colors.blue
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Week 5",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18
                                ),
                                ),
                                Icon(
                                  Icons.calendar_month,
                                  color: Colors.white,
                                  size: 24,
                                )
                              ],
                            ),
                          ),
                        ),
                        Divider(
                          height: 2,
                          color: Colors.grey,
                        ),  
                        SizedBox(
                          height: 5,
                        ), 
                        GestureDetector(
                          onTap: (){
                            // print("Thank God");
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context)=>lecture_day1_2()
                              )
                            );                            
                          },
                          child: Container(
                            height: 80,
                            decoration: BoxDecoration(
                              // color: Colors.blue
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Week 6",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18
                                ),
                                ),
                                Icon(
                                  Icons.calendar_month,
                                  color: Colors.white,
                                  size: 24,
                                )
                              ],
                            ),
                          ),
                        ),
                        Divider(
                          height: 2,
                          color: Colors.grey,
                        ),  
                        SizedBox(
                          height: 5,
                        ),
                        GestureDetector(
                          onTap: (){
                            // print("Thank God");
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context)=>lecture_day1_2()
                              )
                            );                            
                          },
                          child: Container(
                            height: 80,
                            decoration: BoxDecoration(
                              // color: Colors.blue
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Week 7",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18
                                ),
                                ),
                                Icon(
                                  Icons.calendar_month,
                                  color: Colors.white,
                                  size: 24,
                                )
                              ],
                            ),
                          ),
                        ),
                        Divider(
                          height: 2,
                          color: Colors.grey,
                        ),  
                        SizedBox(
                          height: 5,
                        ),
                        GestureDetector(
                          onTap: (){
                            // print("Thank God");
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context)=>lecture_day1_2()
                              )
                            );                            
                          },
                          child: Container(
                            height: 80,
                            decoration: BoxDecoration(
                              // color: Colors.blue
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Week 8",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18
                                ),
                                ),
                                Icon(
                                  Icons.calendar_month,
                                  color: Colors.white,
                                  size: 24,
                                )
                              ],
                            ),
                          ),
                        ),
                        Divider(
                          height: 2,
                          color: Colors.grey,
                        ),  
                        SizedBox(
                          height: 5,
                        ),
                        GestureDetector(
                          onTap: (){
                            // print("Thank God");
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context)=>lecture_day1_2()
                              )
                            );                            
                          },
                          child: Container(
                            height: 80,
                            decoration: BoxDecoration(
                              // color: Colors.blue
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Week 9",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18
                                ),
                                ),
                                Icon(
                                  Icons.calendar_month,
                                  color: Colors.white,
                                  size: 24,
                                )
                              ],
                            ),
                          ),
                        ),
                        Divider(
                          height: 2,
                          color: Colors.grey,
                        ),  
                        SizedBox(
                          height: 5,
                        ), 
                        GestureDetector(
                          onTap: (){
                            // print("Thank God");
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context)=>lecture_day1_2()
                              )
                            );                            
                          },
                          child: Container(
                            height: 80,
                            decoration: BoxDecoration(
                              // color: Colors.blue
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Week 10",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18
                                ),
                                ),
                                Icon(
                                  Icons.calendar_month,
                                  color: Colors.white,
                                  size: 24,
                                )
                              ],
                            ),
                          ),
                        ),
                        Divider(
                          height: 2,
                          color: Colors.grey,
                        ),  
                        SizedBox(
                          height: 5,
                        ),
                      ],
                    )
              );    
  }
}


class lecture_report1_1 extends StatefulWidget{
  @override  
  lecture_report1_2 createState()=> lecture_report1_2();
}

class lecture_report1_2 extends State<lecture_report1_1>{

  List<String> regionList = ["Arusha","Kilimanjaro","Singida","Loliondo","Ruvuma","Songwe","Manyara"];
  String? valueRegion;
  GlobalKey keyReport = GlobalKey<FormState>();
  @override  
  Widget build(BuildContext context ){
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        // color: Colors.red
      ),
      child: Column(
        children: [
          Form(
            key: keyReport,
            child: Column(
              children: [
                TextFormField(
                  style: TextStyle(
                    color: Colors.white
                  ),
                  decoration: InputDecoration(
                    hintText: "Name.......",
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
                      Icons.person,
                      color: Colors.grey[400],
                    )
                  ),
                ),
                SizedBox(height: 10,),
                TextFormField(
                  style: TextStyle(
                    color: Colors.white
                  ),
                  decoration: InputDecoration(
                    hintText: "Phone Number",
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
                      Icons.phone_android_outlined,
                      color: Colors.grey[400],
                    )
                  ),
                ),
                SizedBox(height: 10,),
                TextFormField(
                  style: TextStyle(
                    color: Colors.white
                  ),
                  decoration: InputDecoration(
                    hintText: "Region",
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
                      Icons.home,
                      color: Colors.grey[400],
                    )
                  ),
                ),
                // DropdownButtonFormField<String>(
                //   dropdownColor: Color(0xFF1A3A6F),
                //   icon: Icon(
                //     Icons.arrow_drop_down,
                //     color: Colors.grey[400],
                //   ),
                //   isExpanded: true,
                //   decoration: InputDecoration(
                //     fillColor: Color(0xFF1A3A6F),
                //     filled: true,
                //     enabledBorder: OutlineInputBorder(
                //       borderRadius: BorderRadius.circular(10),
                //       borderSide: BorderSide.none
                //     ),
                //     focusedBorder: OutlineInputBorder(
                //       borderRadius: BorderRadius.circular(10),
                //       borderSide: BorderSide.none
                //     ),
                //     prefixIcon: Icon(
                //       Icons.home,
                //       color: Colors.grey,
                //     )
                //   ),
                //   hint: Text("Choose Region",
                //   style: TextStyle(
                //     color: Colors.white
                //   ),
                //   ),
                //   value: valueRegion,
                //   onChanged: (newValue){
                //     setState(() {
                //       valueRegion = newValue;
                //     });
                //   },
                //   items: regionList.map((regionLists){
                //     return DropdownMenuItem(
                //       value: regionLists,
                //       child: Text(regionLists,
                //       style: TextStyle(
                //         color: Colors.white70
                //       ),
                //       ),
                //     );
                //   }).toList(),
                // ),
                SizedBox(height: 10,),
                TextFormField(
                  style: TextStyle(
                    color: Colors.white
                  ),
                  decoration: InputDecoration(
                    hintText: "Street",
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
                      Icons.streetview,
                      color: Colors.grey[400],
                    )
                  ),
                ),
                SizedBox(height: 10,),
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxHeight: 150,
                    minHeight: 150
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        child: TextFormField(
                          style: TextStyle(
                            color: Colors.white
                          ),
                          expands: true,
                          keyboardType: TextInputType.multiline,
                          textAlignVertical: TextAlignVertical.top,
                          maxLines: null,
                          decoration: InputDecoration(
                            hintText: "Describe the area of your industrial practical training",
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
                              Icons.app_registration_outlined,
                              color: Colors.grey[400],
                            )
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10,),
                // Row(
                //   children: [
                //     Expanded(
                //       child: ClipRRect(
                //         borderRadius: BorderRadius.circular(10),
                //         child: MaterialButton(
                //           onPressed: (){
                //             print("Thank God");
                //           },
                //           height: 50,
                //           color: Color(0xFF5DADE2),
                //           textColor: Colors.white,
                //           child: Text("Submit"),
                //         ),
                //       ),
                //     )
                //   ],
                // )
              ],
            ),
          )
        ],
      ),
    );
  }
}

