import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'dart:io' as io;
import 'dart:math';
import 'package:audio_recorder/audio_recorder.dart';
import 'package:file/file.dart';
import 'package:file/local.dart';
import 'package:kaash_app/Home.dart';
import 'package:kaash_app/shared/Data.dart' as global;
import 'package:path_provider/path_provider.dart';
import 'package:rich_alert/rich_alert.dart';
import 'package:page_transition/page_transition.dart';
import 'package:uuid/uuid.dart';
final postsRef = Firestore.instance.collection('Recording');
final DateTime timestamp = DateTime.now();

class record extends StatefulWidget {
  @override
  _recordState createState() => _recordState();
}

class _recordState extends State<record> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(
                onPressed: (){},
                icon: Icon(Icons.mic,color: Colors.redAccent,),
                iconSize:40.0,
              ),
              SizedBox(
                height: 10,
              ),
              AppBody(),
            ],
          ),
        ),
      ),
    );
  }
}

class AppBody extends StatefulWidget {
  final LocalFileSystem localFileSystem;
  AppBody({localFileSystem})
      : this.localFileSystem = localFileSystem ?? LocalFileSystem();

  @override
  State<StatefulWidget> createState() => new AppBodyState();
}

class AppBodyState extends State<AppBody> {
  File file ; 
   String postId = Uuid().v4();
   Future<String> uploadImage(imageFile) async {
     print("UPLOADINGGGGG");
    StorageUploadTask uploadTask = FirebaseStorage().ref().child("post_$postId.mp4").putFile(imageFile);
    StorageTaskSnapshot storageSnap = await uploadTask.onComplete;
    String downloadUrl = await storageSnap.ref.getDownloadURL();
    return downloadUrl;
  }
  void createPostInFirestore(
      {String mediaUrl, String location, String description}) {
    postsRef
        .document(postId)
        .setData({
      "Diseases":global.Disese,
      "Age":global.age,
      "Gender":global.gender,
      "Occupation":global.occupation,
      "Height":global.height,
      "Other Risk":global.Risk,
      "postId": postId,
      "mediaUrl": mediaUrl,
      "timestamp": timestamp,
    });
  }
 void handleSubmit() async {
    print("HAndel SUbmit");
    String mediaUrl = await uploadImage(file);
    createPostInFirestore(
      mediaUrl: mediaUrl,
    );
  }
  Recording _recording = new Recording();
  bool _isRecording = false;
  Random random = new Random();
  TextEditingController _controller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new Padding(
        padding: new EdgeInsets.all(8.0),
        child: new Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              new FlatButton(
                onPressed: _isRecording ? null : _start,
                child: new Text("Start"),
                color: Colors.green,
              ),
              new FlatButton(
                onPressed: _isRecording ? _stop : null,
                child: new Text("Stop and Save"),
                color: Colors.red,
              ),
            ]),
      ),
    );
  }

  void _start() async {
    try {
      if (await AudioRecorder.hasPermissions) {
        if (_controller.text != null && _controller.text != "") {
          String path = _controller.text;
          if (!_controller.text.contains('/')) {
            io.Directory appDocDirectory =
            await getApplicationDocumentsDirectory();
            path = appDocDirectory.path + '/' + _controller.text;
          }
          print("Start recording: $path");
          await AudioRecorder.start(
              path: path, audioOutputFormat: AudioOutputFormat.AAC);
        } else {
          await AudioRecorder.start();
        }
        bool isRecording = await AudioRecorder.isRecording;
        setState(() {
          _recording = new Recording(duration: new Duration(), path: "");
          _isRecording = isRecording;
        });
      } else {
        Scaffold.of(context).showSnackBar(
            new SnackBar(content: new Text("You must accept permissions")));
      }
    } catch (e) {
      print(e);
    }
  }

  void _stop() async {
    var recording = await AudioRecorder.stop();
    print("Stop recording: ${recording.path}");
    bool isRecording = await AudioRecorder.isRecording;
    file = widget.localFileSystem.file(recording.path);
    print("  File length: ${await file.length()}");
    setState(() {
      _recording = recording;
      _isRecording = isRecording;
    });
    _controller.text = recording.path;
    
    handleSubmit();


    showDialog<dynamic>(
        context: context,
        builder: (BuildContext context) {
          return RichAlertDialog( //uses the custom alert dialog
            actions: [
              FlatButton(
                child: Text('Thank you!',style: TextStyle(color: Colors.white),),
                color: Colors.green,
                onPressed:(){ Navigator.pushReplacement(context, PageTransition(type: PageTransitionType.rotate, duration: Duration(seconds: 1),  child:home()));} ,
              )
            ],
            alertTitle: richTitle("Saved Succefully"),
            alertSubtitle: richSubtitle("Help us Fight Corona!"),
            alertType: RichAlertType.SUCCESS,
          );
        }
    );

  }
}
