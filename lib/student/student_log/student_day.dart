import 'package:flutter/material.dart';
// import 'package:weeklist/book.dart';
import 'package:project_app/student/student_log/student_book.dart';
// import 'package:weeklist/book_week.dart';
import 'package:project_app/student/student_log/student_bookWeek.dart';

// void main(){
//   runApp(day1_1());
// }

// class day1_1 extends StatelessWidget{
//   @override  
//   Widget build(BuildContext context ){
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: day1_2(),
//     );
//   }
// }

class day1_2 extends StatefulWidget{
  final String candidate_num;
  final String IpAddress;
  final String candidate_level;
  final String week;
  day1_2({required this.candidate_num, required this.IpAddress, required this.candidate_level, required this.week });  
  @override  
  day1_3 createState()=> day1_3();
}

class day1_3 extends State<day1_2>{
  @override  
  Widget build(BuildContext context ){
    return Scaffold(
      backgroundColor: Color(0xFF002147),
      appBar: DayAppBar(context),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              dayContainer1_1(candidate_num: widget.candidate_num, IpAddress: widget.IpAddress, candidate_level: widget.candidate_level, week: widget.week)
            ],
          ),
        ),
      ),
    );
  }
}


PreferredSizeWidget DayAppBar(BuildContext context ){
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

class dayContainer1_1 extends StatefulWidget{
  final String candidate_num;
  final String IpAddress;
  final String candidate_level;
  final String week;
  dayContainer1_1({required this.candidate_num, required this.IpAddress, required this.candidate_level, required this.week });   
  @override  
  dayContainer1_2 createState()=> dayContainer1_2();
}


class dayContainer1_2 extends State<dayContainer1_1>{
  @override  
  Widget build(BuildContext context){
    return Container(
      decoration: BoxDecoration(
        // color: Colors.red
      ),
      child: Column(
        children: [
          GestureDetector(
            onTap: (){
              String day = "monday";
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context)=> book1_2(candidate_num: widget.candidate_num, IpAddress: widget.IpAddress, candidate_level: widget.candidate_level, week: widget.week, day: day)
                )
              );
            },
            child: Container(
              height: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Monday",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18
                  ),
                  ),
                  Icon(
                    Icons.punch_clock_outlined,
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
          SizedBox(height: 5,),
          GestureDetector(
            onTap: (){
              // print("Tuesday");
              String day = "tuesday";
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context)=> book1_2(candidate_num: widget.candidate_num, IpAddress: widget.IpAddress, candidate_level: widget.candidate_level, week: widget.week, day: day)
                )
              );              
            },
            child: Container(
              height: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Tuesday",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18
                  ),
                  ),
                  Icon(
                    Icons.punch_clock_outlined,
                    color: Colors.white,
                    size: 24,
                  )
                ],
              ),
            ),
          ),
          Divider(
            color: Colors.grey,
            height: 2,
          ),
          SizedBox(height: 5,),
          GestureDetector(
            onTap: (){
              // print("Wednesday");
              String day = "wednesday";
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context)=> book1_2(candidate_num: widget.candidate_num, IpAddress: widget.IpAddress, candidate_level: widget.candidate_level, week: widget.week, day: day)
                )
              );              
            },
            child: Container(
              height: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Wednesday",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18
                  ),
                  ),
                  Icon(
                    Icons.punch_clock_outlined,
                    color: Colors.white,
                    size: 24,
                  )
                ],
              ),
            ),
          ),
          Divider(
            color: Colors.grey,
            height: 2,
          ),
          SizedBox(height: 5,),
          GestureDetector(
            onTap: (){
              // print("Thursday");
              String day = "thursday";
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context)=> book1_2(candidate_num: widget.candidate_num, IpAddress: widget.IpAddress, candidate_level: widget.candidate_level, week: widget.week, day: day)
                )
              );              
            },
            child: Container(
              height: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Thursday",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18
                  ),
                  ),
                  Icon(
                    Icons.punch_clock_outlined,
                    color: Colors.white,
                    size: 24,
                  )
                ],
              ),
            ),
          ),
          Divider(
            color: Colors.grey,
            height: 2,
          ),
          SizedBox(height: 5,),
          GestureDetector(
            onTap: (){
              // print("Friday");
              String day = "friday";
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context)=> book1_2(candidate_num: widget.candidate_num, IpAddress: widget.IpAddress, candidate_level: widget.candidate_level, week: widget.week, day: day)
                )
              );              
            },
            child: Container(
              height: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Friday",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18
                  ),
                  ),
                  Icon(
                    Icons.punch_clock_outlined,
                    color: Colors.white,
                    size: 24,
                  )
                ],
              ),
            ),
          ),
          Divider(
            color: Colors.grey,
            height: 2,
          ),
          SizedBox(height: 5,),
          GestureDetector(
            onTap: (){
              // print("Weekly Report");
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context)=>book_week1_2()
                )
              );
            },
            child: Container(
              height: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Weekly Report",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18
                  ),
                  ),
                  Icon(
                    Icons.punch_clock_outlined,
                    color: Colors.white,
                    size: 24,
                  )
                ],
              ),
            ),
          ),
          Divider(
            color: Colors.grey,
            height: 2,
          ),
          SizedBox(height: 5,),          
        ],
      ),
    );
  }
}



