import 'package:audioplayers/audioplayers.dart';
import 'package:audioplayers/src/source.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/src/audioplayer.dart';

void main() => runApp(XylophoneApp());//main method

class XylophoneApp extends StatelessWidget {//creating a stateless widget

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xffA1662F),//giving a wood themed background color to the scaffold
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,//to place the tiles with proper space
            children: [
              //all the tiles for the xylophone
              XylophoneTile(color: Color(0xff7F00FF),audioNumber: 1,),
              XylophoneTile(color: Color(0xff4B0082),audioNumber: 2,),
              XylophoneTile(color: Colors.blue,audioNumber: 3,),
              XylophoneTile(color: Colors.green,audioNumber: 4,),
              XylophoneTile(color: Colors.yellow,audioNumber: 5,),
              XylophoneTile(color: Colors.orange,audioNumber: 6,),
              XylophoneTile(color: Colors.red,audioNumber: 7,),
            ],
          ),
        ),
      ),
    );
  }
}

//each individual tile which has its color changing and its audio file changing
class XylophoneTile extends StatelessWidget {
  XylophoneTile({
    super.key,
    required this.audioNumber, required this.color,
  });//constructor

  AudioPlayer audioPlayer = AudioPlayer();//This is used to call an existing method in the package - this method is for playing an audio file
  final int audioNumber;//to take the note file to be played
  final Color color;//to take the color for the tile

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: (){
          audioPlayer.play(UrlSource('assets/note$audioNumber.wav'));
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: color,
          ),
          margin: EdgeInsets.all(7),

          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.black
                ),
                height: 20,
                width: 20,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.black
                ),
                height: 20,
                width: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}



