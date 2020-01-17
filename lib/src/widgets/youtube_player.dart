import 'package:flutter/material.dart';
import 'package:flutter_youtube/flutter_youtube.dart';

class YoutubePlayerWidget extends StatelessWidget {
  final String idVideo;
  final String nameTrailer;
  final String apiKey = 'AIzaSyAE2_GzQOKJ6W9jbiK5tvQcenqTmJ79fjQ';
  TextEditingController textEditingControllerUrl = new TextEditingController();
  TextEditingController textEditingControllerId = new TextEditingController();

  YoutubePlayerWidget({@required this.idVideo, @required this.nameTrailer});

  void playYoutubeVideo() {
    FlutterYoutube.playYoutubeVideoByUrl(
      apiKey: apiKey,
      videoUrl: "https://www.youtube.com/watch?v=wgTBLj7rMPM",
    );
  }

  void playYoutubeVideoEdit() {
    FlutterYoutube.onVideoEnded.listen((onData) {
      //perform your action when video playing is done
    });

    FlutterYoutube.playYoutubeVideoByUrl(
      apiKey: apiKey,
      videoUrl: textEditingControllerUrl.text,
    );
  }

  void playYoutubeVideoIdEdit(String idVideo) {
    FlutterYoutube.onVideoEnded.listen((onData) {
      //perform your action when video playing is done
    });

    FlutterYoutube.playYoutubeVideoById(
      apiKey: apiKey,
      videoId: idVideo,
    );
  }

  void playYoutubeVideoIdEditAuto() {
    FlutterYoutube.onVideoEnded.listen((onData) {
      //perform your action when video playing is done
    });

    FlutterYoutube.playYoutubeVideoById(
        apiKey: apiKey, videoId: textEditingControllerId.text, autoPlay: true);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          width: double.infinity,
          child: OutlineButton(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
            // shape: UnderlineInputBorder(),
            color: Colors.black87,            
            textColor: Colors.black87,
            padding: EdgeInsets.all(8.0),
            onPressed: () => playYoutubeVideoIdEdit(idVideo),
            child: Text(
              nameTrailer,
            ),
          ),
        )
      ],
    );
  }
}
