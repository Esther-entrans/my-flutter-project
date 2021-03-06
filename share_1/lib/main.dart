import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:social_share_plugin/social_share_plugin.dart';
import 'package:image_picker/image_picker.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      platformVersion = await SocialSharePlugin.platformVersion;
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Column(
          children: <Widget>[
            Center(
              child: Text('Running on: $_platformVersion\n'),
            ),
            RaisedButton(
              child: Text('Share to Instagram'),
              onPressed: (){
                 FlutterShareMe().shareToFacebbok(url: "https://www.linkedin.com/feed/",  msg: "Babilok");

               } 
              // onPressed: () async {
              //   File file = await ImagePicker.pickImage(source: ImageSource.gallery);
              //   await SocialSharePlugin.shareToFeedInstagram("image/*", file.path);
              // },
            ),
           
      
          
          ],
        ),
      ),
    );
  }
}

class FlutterShareMe {
  void shareToFacebbok({required String url, required String msg}) {
    String url="https://www.linkedin.com/feed/";
  }
}
