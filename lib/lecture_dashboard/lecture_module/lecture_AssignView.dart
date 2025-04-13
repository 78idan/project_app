import 'package:flutter/material.dart';


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
  @override  
  lecture_AssignView1_3 createState()=> lecture_AssignView1_3();
}

class lecture_AssignView1_3 extends State<lecture_AssignView1_2>{
  @override  
  Widget build(BuildContext context ){
    return Scaffold(
      backgroundColor: Color(0xFF002147),
      appBar: lectureAssignViewAppBar(context),
      body: Padding(
        padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
        child: viewAnswer1_1(),
      ),
    );
  }
}

PreferredSizeWidget lectureAssignViewAppBar( BuildContext context ){
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
        Text("22050513038",
        style: TextStyle(
          color: Colors.white,
          fontFamily: "PlayfairDisplay",
          fontSize: 16
        ),
        ),
        Text("LEVEL 8",
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
  @override  
  viewAnswer1_2 createState()=> viewAnswer1_2();
}


class viewAnswer1_2 extends State<viewAnswer1_1>{
  @override  
  Widget build(BuildContext context){
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        child: Text("Certainly! Let’s dive into the fascinating world of bioluminescence, a natural phenomenon that lights up the darkness in the most enchanting ways. Bioluminescence is the ability of certain living organisms to produce and emit light through a chemical reaction involving a molecule called luciferin, oxygen, and an enzyme known as luciferase. This glowing spectacle is most famously observed in marine environments, where creatures like jellyfish, deep-sea fish, and tiny plankton called dinoflagellates illuminate the ocean’s depths or its surface with eerie, ethereal glows. On land, fireflies are the poster children of bioluminescence, using their flickering lights to attract mates in a dance of nature’s own design. Scientists believe this ability evolved as a survival mechanism—some species use it to lure prey, others to deter predators by startling them or even mimicking more dangerous creatures, and some, like the Hawaiian bobtail squid, employ it for camouflage by matching the light filtering down from the moon and stars above. The glow itself comes in various colors, though blue and green dominate due to their ability to travel farther through water. What’s truly mind-blowing is how efficient this process is—unlike a light bulb that wastes energy as heat, bioluminescence converts nearly all its energy into light, making it a marvel of natural engineering. From the sparkling waves of Mosquito Bay in Puerto Rico to the glowing fungi in ancient forests, bioluminescence reminds us how life on Earth finds the most creative ways to adapt, communicate, and simply shine, even in the darkest corners of the world.",
        style: TextStyle(
          color: Colors.white
        ),
        ),
      ),
    );
  }
}





