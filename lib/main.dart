import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(XylophoneApp());
}

class XylophoneApp extends StatefulWidget {
  XylophoneApp({Key? key}) : super(key: key);

  @override
  State<XylophoneApp> createState() => _XylophoneAppState();
}

class _XylophoneAppState extends State<XylophoneApp> {
  final player = AudioCache(prefix: 'assets/');
  final audioPlayer = AudioPlayer();

  Future<void> playSound(int sound) async {
    final url = await player.load('note$sound.wav');
    await audioPlayer.play(UrlSource(url.path));
    // https://stackoverflow.com/questions/73230108/type-string-is-not-a-subtype-of-type-source
  }

  Widget key({int? sound, Color? color}) {
    return Expanded(
      child: TextButton(
        onPressed: () {
          playSound(sound!);
          print('$color');
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: color,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              key(sound: 1, color: Colors.red),
              key(sound: 2, color: Colors.orange),
              key(sound: 3, color: Colors.yellow),
              key(sound: 4, color: Colors.green),
              key(sound: 5, color: Colors.teal),
              key(sound: 6, color: Colors.blue),
              key(sound: 7, color: Colors.purple),
            ],
          ),
        ),
      ),
    );
  }
}
