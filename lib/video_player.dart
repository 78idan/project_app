import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

void main(){
  runApp(
    videoPlayer1_1()
  );
}


class videoPlayer1_1 extends StatelessWidget{
  @override  
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: videoPlayer1_2(),
    );
  }
}

class videoPlayer1_2 extends StatefulWidget{
  @override  
  videoPlayer1_3 createState()=> videoPlayer1_3();
}

class videoPlayer1_3 extends State<videoPlayer1_2>{
  late VideoPlayerController controllerVideo;
  late Future<void> initalizeVideo;

  @override  
  void initState(){
    super.initState();
    controllerVideo = VideoPlayerController.asset("assets/gpt.mp4");
    initalizeVideo = controllerVideo.initialize();
    controllerVideo.setLooping(false);
    controllerVideo.addListener(intoTheEnd);
  }

  @override  
  void dispose(){
    controllerVideo.removeListener(intoTheEnd);
    controllerVideo.dispose();
    super.dispose();
  }

  void toggleVideo(){
    setState(() {
      controllerVideo.value.isPlaying ? controllerVideo.pause() : controllerVideo.play();
    });
  }

  void intoTheEnd(){
    if(controllerVideo.value.position == controllerVideo.value.duration){
      setState(() {
        controllerVideo.seekTo(Duration.zero);
      });
    }
  }


  @override  
  Widget build(BuildContext context ){
    return Scaffold(
      appBar: AppBar(
        title: Text("V I D E O"),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: EdgeInsets.all(30),
        child: Column(
          children: [
            FutureBuilder(
              future: initalizeVideo,
              builder: (context, SnapshotController){
                if(SnapshotController.connectionState == ConnectionState.done){
                  return Container(
                    height: 50,
                    width: 50,
                    child: AspectRatio(
                      aspectRatio: controllerVideo.value.aspectRatio,
                      child: VideoPlayer(controllerVideo),
                    ),
                  );
                }else{
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }



}


