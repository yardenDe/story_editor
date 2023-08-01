import 'dart:io';
import 'package:flutter/material.dart';
import 'package:ex13done/MyCamera.dart';
import 'package:ex13done/ShareImage.dart';

class PopUpShare extends StatelessWidget {
  const PopUpShare({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: IconButton(
                    icon: Image.asset('assets/close.png'),
                    onPressed: () {},
                  ),
                ),
              ]
          ),

          Container(
            child: Image(
              image: AssetImage('assets/all.png'),
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: (){
                  MyCamera.takePicture().then((value) => Navigator.push(context,  MaterialPageRoute(builder: (context) => ShareImage(myImage: value))));
                },
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                  ),
                  backgroundColor: MaterialStateProperty.all(Colors.green),
                  minimumSize: MaterialStateProperty.all(Size(300, 50)),
                ),
                child: Row(
                  children: [
                    Text(
                      'שיתוף תמונה',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    Icon(
                      Icons.camera_alt_outlined,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(6.0),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue, width: 2.0),
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  child: ElevatedButton(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ShareImage()),);
                    },
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                      ),
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                      minimumSize: MaterialStateProperty.all(Size(300, 50)),
                    ),
                    child: Row(
                      children: [
                        Text(
                          'שיתוף אירוע',
                          style: TextStyle(
                            color: Colors.blue,
                          ),
                        ),
                        Image.asset('assets/myEvents2.png'),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
