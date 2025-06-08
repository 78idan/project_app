import 'package:flutter/material.dart';
// import 'package:weeklist/book.dart';
import 'package:project_app/lecture_dashboard/lecture_log/lecture_book.dart';
// import 'package:weeklist/book_week.dart';
import 'package:project_app/lecture_dashboard/lecture_log/lecture_bookWeek.dart';

// void main(){
//   runApp(lecture_day1_1());
// }

// class lecture_day1_1 extends StatelessWidget{
//   @override  
//   Widget build(BuildContext context ){
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: lecture_day1_2(),
//     );
//   }
// }

class lecture_day1_2 extends StatefulWidget{
  final String IpAddress;
  final String candidate_num;
  final String week;
  lecture_day1_2({required this.IpAddress, required this.candidate_num, required this.week });  
  @override  
  lecture_day1_3 createState()=> lecture_day1_3();
}

class lecture_day1_3 extends State<lecture_day1_2>{
  @override  
  Widget build(BuildContext context ){
    return Scaffold(
      backgroundColor: Color(0xFF002147),
      appBar: LectureDayAppBar(context,widget.week),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              lecture_dayContainer1_1(IpAddress: widget.IpAddress, candidate_num: widget.candidate_num, week: widget.week)
            ],
          ),
        ),
      ),
    );
  }
}


PreferredSizeWidget LectureDayAppBar(BuildContext context, String week ){
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
    title: Text(week,
    style: TextStyle(
      color: Colors.white,
      fontFamily: "PlayfairDisplay"
    ),
    ),
  );
}

class lecture_dayContainer1_1 extends StatefulWidget{
  final String IpAddress;
  final String candidate_num;
  final String week;
  lecture_dayContainer1_1({required this.IpAddress, required this.candidate_num, required this.week });  
  @override  
  lecture_dayContainer1_2 createState()=> lecture_dayContainer1_2();
}


class lecture_dayContainer1_2 extends State<lecture_dayContainer1_1>{
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
              // print("Monday");
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context)=> lecture_book1_2(IpAddress: widget.IpAddress, candidate_num: widget.candidate_num, week: widget.week, day: day)
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
                  builder: (context)=> lecture_book1_2(IpAddress: widget.IpAddress, candidate_num: widget.candidate_num, week: widget.week, day: day)
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
                  builder: (context)=> lecture_book1_2(IpAddress: widget.IpAddress, candidate_num: widget.candidate_num, week: widget.week, day: day)
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
                  builder: (context)=> lecture_book1_2(IpAddress: widget.IpAddress, candidate_num: widget.candidate_num, week: widget.week, day: day)
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
                  builder: (context)=> lecture_book1_2(IpAddress: widget.IpAddress, candidate_num: widget.candidate_num, week: widget.week, day: day)
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
              String day = "weekly";
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context)=>lecture_book_week1_2(IpAddress: widget.IpAddress, candidate_num: widget.candidate_num, week: widget.week, day: day)
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



