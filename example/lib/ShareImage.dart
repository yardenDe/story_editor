import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ex13done/MyCamera.dart';

class ShareImage extends StatefulWidget {
  final File? myImage;
  const ShareImage({super.key,this.myImage,});

  @override
  State<ShareImage> createState() => _ShareImageState();
}

class _ShareImageState extends State<ShareImage> {

  // Future<void> _pickImage(MyCamera myImage) async {
  //   try {
  //     final myImage = await MyCamera.takePicture();
  //
  //     if (myImage == null) return;
  //
  //     setState(() {
  //       _myImage = File(myImage.path);
  //     });
  //   } catch (e) {
  //     print('Error: $e');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            if(widget.myImage == null)
              Container(
                  margin: EdgeInsets.only(top: 40.0, bottom: 20.0),
                  child:  Image.asset('assets/all.png')
              ),
            if(widget.myImage != null)
              Container(
                height: MediaQuery.of(context).size.height*0.6,
                width: MediaQuery.of(context).size.width*0.8,
                margin: EdgeInsets.only(top: 40.0,),
                child: Stack(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height*0.6,
                        width: MediaQuery.of(context).size.width*0.8,
                        child: Image.file(widget.myImage!,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Positioned(
                        bottom: 0.0,
                      child: Container(
                        width: MediaQuery.of(context).size.width*0.8,
                        child: Opacity(
                          opacity: 0.4,
                          child: Image.asset('assets/Frame 77547294.png',
                          fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      ),
                      Positioned(
                        top: 15,
                        right: 55,
                        child: Image.asset('assets/Vector.png'),
                      ),
                      Positioned(
                        top: 10,
                        right: 10,
                        child: Image.asset('assets/Group.png'),
                      ),
                      Positioned(
                        bottom: 15,
                        right: 70,
                        child: Text(
                          'גאה להתנדב בידידים!',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.93,
                            fontFamily: 'Assistant',
                            fontWeight: FontWeight.w800,
                            height: 1,
                            letterSpacing: 0.44,
                          ),
                        ),
                      )
                    ]
                ),
              ),


            const Text('שיתוף באמצעות',
              style: TextStyle(
                color: Colors.black38,
                fontSize: 20,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    IconButton(
                      icon: Image.asset('assets/Instagram.png'),
                      onPressed: () { },
                    ),
                    Text('Instegram',
                      style: TextStyle(
                        fontSize: 8,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 10.0,
                ),
                Column(
                  children: <Widget>[
                    IconButton(
                      icon: Image.asset('assets/facebook.png'),
                      onPressed: () {
                        // Handle button press for icon 2
                      },
                    ),
                    Text('Facebook',
                      style: TextStyle(
                        fontSize: 8,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 10.0,
                ),
                Column(
                  children: <Widget>[
                    IconButton(
                      icon: Image.asset('assets/whatsapp32x32.png'),
                      onPressed: () {
                        // Handle button press for icon 3
                      },
                    ),
                    Text('Whatsapp',
                      style: TextStyle(
                        fontSize: 8,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            if(widget.myImage != null)
              SizedBox(
                height: 10.0,
              ),
            if(widget.myImage != null)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.blue, width: 2.0),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      child: ElevatedButton(
                        onPressed: (){
                          MyCamera.takePicture().then((value) => Navigator.push(context,  MaterialPageRoute(builder: (context) => ShareImage(myImage: value))));
                        },
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),
                          backgroundColor: MaterialStateProperty.all(Colors.white),
                          minimumSize: MaterialStateProperty.all(Size(150, 45)),
                        ),
                        child: Row(
                          children: [
                            Text(
                              'צילום חדש',
                              style: TextStyle(
                                color: Colors.blue,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
