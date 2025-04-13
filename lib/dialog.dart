import 'package:flutter/material.dart';

void main(){
  runApp(
    dialog1_1()
  );
}


class dialog1_1 extends StatelessWidget{
  @override  
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: dialog1_2(),
    );
  }
}

class dialog1_2 extends StatefulWidget{
  @override  
  dialog1_3 createState()=> dialog1_3();
}

class dialog1_3 extends State<dialog1_2>{
  void showIdanDialog(BuildContext context){
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: "",
      transitionDuration: Duration(milliseconds: 300),
      pageBuilder: (context, anim1, anim2){
        return Align(
          alignment: Alignment.bottomCenter,
          child: Material(
            color: Colors.transparent,
            child: Container(
              margin: EdgeInsets.all(16),
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.black87
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Delete these lecture ?",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: "PlayfairDisplay"
                  ),
                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton(
                        onPressed: (){
                          Navigator.of(context).pop();
                        },
                        child: Text("Cancel"),
                      ),

                      ElevatedButton(
                        onPressed: (){},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red
                        ),                        
                        child: Text("Delete"),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
      transitionBuilder: (context,anim1,anim2,child){
        return SlideTransition(
          position: Tween<Offset>(
            begin: Offset(0, 1),
            end: Offset(0, 0)
          ).animate(anim1),
          child: child,
        );
      }
    );
  }

  @override  
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("P O P U P"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: (){
            showIdanDialog(context);
          },
          child: Text("Press"),
        ),
      ),
    );
  }
}




