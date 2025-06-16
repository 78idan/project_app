import 'package:flutter/material.dart';



void main(){
  runApp(
    markLecture1_1()
  );
}


class markLecture1_1 extends StatelessWidget{
  @override  
  Widget build(BuildContext context ){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: markLecture1_2(),
    );
  }
}

class markLecture1_2 extends StatefulWidget{

  @override  
  markLecture1_3 createState()=> markLecture1_3();
}


class markLecture1_3 extends State<markLecture1_2>{
  @override  
  Widget build(BuildContext context ){
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Color(0xFF002147),
        appBar: markLectureAppBar(context),
        body: TabBarView(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    technicalReportTextField1_1()
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    collegeSupervisorTextField1_1()
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    industrySupervisorTextField1_1()
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    markerSupervisorTextField1_1()
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

PreferredSizeWidget markLectureAppBar(BuildContext context){
  return AppBar(
    elevation: 0,
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
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.white,
        fontFamily: "PlayfairDisplay"
      ),
      unselectedLabelStyle: TextStyle(
        fontFamily: "PlayfairDisplay",
        fontSize: 16,
        fontWeight: FontWeight.normal,
        color: Colors.white70
      ),
      indicatorColor: Colors.white,
      labelColor: Colors.white,
      tabs: [
        Tab(text: "Report",),
        Tab(text: "College",),
        Tab(text: "Industry",),
        Tab(text: "Marker",),
      ],
    ),
  );
}

class technicalReportTextField1_1 extends StatefulWidget{
  @override  
  technicalReportTextField1_2 createState()=> technicalReportTextField1_2();
}

class technicalReportTextField1_2 extends State<technicalReportTextField1_1>{  



  @override  
  Widget build(BuildContext context ){
    return Container(
      child: Text("Technical report",
      style: TextStyle(
        color: Colors.white
      ),
      ),
    );
  }
}

class collegeSupervisorTextField1_1 extends StatefulWidget{
  @override  
  collegeSupervisorTextField1_2 createState()=> collegeSupervisorTextField1_2();
}

class collegeSupervisorTextField1_2 extends State<collegeSupervisorTextField1_1>{




  @override  
  Widget build(BuildContext context ){
    return Container(
      child: Text("College supervisor",
      style: TextStyle(
        color: Colors.white
      ),
      ),
    );
  }
}


class industrySupervisorTextField1_1 extends StatefulWidget{
  @override  
  industrySupervisorTextField1_2 createState()=> industrySupervisorTextField1_2();
}

class industrySupervisorTextField1_2 extends State<industrySupervisorTextField1_1>{




  @override  
  Widget build(BuildContext context ){
    return Container(
      child: Text("industry supervisor",
      style: TextStyle(
        color: Colors.white
      ),
      ),
    );
  }
}



class markerSupervisorTextField1_1 extends StatefulWidget{
  @override  
  markerSupervisorTextField1_2 createState()=> markerSupervisorTextField1_2();
}

class markerSupervisorTextField1_2 extends State<markerSupervisorTextField1_1>{




  @override  
  Widget build(BuildContext context ){
    return Container(
      child: Text("marker supervisor",
      style: TextStyle(
        color: Colors.white
      ),
      ),
    );
  }
}


