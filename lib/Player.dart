import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:audioplayers/audio_cache.dart';

class Player extends StatefulWidget {
  @override
  _PlayerState createState() => _PlayerState();
}

class _PlayerState extends State<Player> {
  static AudioCache cache = AudioCache();
  AudioPlayer player;

  bool isPlaying = false;
  bool isPaused = false;

  void playHandler() async {
    if (isPlaying) {
      player.stop();
    } else {
      player = await cache.play('audio/abc.mp3');
    }

    setState(() {
      if (isPaused) {
        isPlaying = false;
        isPaused = false;
      } else {
        isPlaying = !isPlaying;
      }
    });
  }

  void pauseHandler() {
    if (isPaused && isPlaying) {
      player.resume();
    } else {
      player.pause();
    }
    setState(() {
      isPaused = !isPaused;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        PlayerButton(
          onPressed: playHandler,
          isTrue: isPlaying,
          trueText: "Stop",
          falseText: "Play",
        ),
        PlayerButton(
          onPressed: isPlaying ? pauseHandler : null,
          isTrue: isPaused,
          trueText: "Resume",
          falseText: "Pause",
        ),
      ],
    );
  }
}

class PlayerButton extends StatefulWidget {
  final VoidCallback onPressed;
  final bool isTrue;
  final String trueText;
  final String falseText;

  PlayerButton({
    @required this.onPressed,
    @required this.isTrue,
    @required this.trueText,
    @required this.falseText,
  });

  @override
  _PlayerButtonState createState() => _PlayerButtonState();
}

class _PlayerButtonState extends State<PlayerButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: SizedBox(
        width: 200,
        height: 70,
        child: ElevatedButton(
          onPressed: widget.onPressed,
          child: Text(widget.isTrue ? widget.trueText : widget.falseText,
              style: TextStyle(fontSize: 20)),
        ),
      ),
    );
  }
}