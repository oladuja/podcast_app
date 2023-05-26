import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:just_audio/just_audio.dart';

enum AudioControlType {
  listening,
  playing,
}

class AudioControl extends StatelessWidget {
  const AudioControl({
    super.key,
    required this.audioPlayer,
    required this.type,
  });

  final AudioPlayer audioPlayer;
  final AudioControlType type;

  @override
  Widget build(BuildContext context) {
    return (type == AudioControlType.listening)
        ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              TextButton(
                onPressed: () {},
                child: Icon(
                  Icons.skip_previous_rounded,
                  size: 45.h,
                  color: Colors.black,
                ),
              ),
              StreamBuilder<PlayerState>(
                stream: audioPlayer.playerStateStream,
                builder: (_, snapshot) {
                  final playerState = snapshot.data;
                  final processingState = playerState?.processingState;
                  final playing = playerState?.playing;
                  if (!(playing ?? false)) {
                    return TextButton(

                      onPressed: () => audioPlayer.play(),
                      child: Icon(
                        Icons.play_arrow_rounded,
                        size: 45.h,
                        color: Colors.black,
                      ),
                    );
                  } else if (processingState != ProcessingState.completed) {
                    return TextButton(
                      onPressed: () => audioPlayer.pause(),
                      child: Icon(
                        Icons.pause_rounded,
                        size: 45.h,
                        color: Colors.black,
                      ),
                    );
                  }
                  return TextButton(
                    onPressed: () {},
                    child: Icon(
                      Icons.play_arrow_rounded,
                      size: 45.h,
                      color: Colors.black,
                    ),
                  );
                },
              ),
              TextButton(
                onPressed: () {},
                child: Icon(
                  Icons.skip_next_rounded,
                  size: 45.h,
                  color: Colors.black,
                ),
              ),
            ],
          )
        : StreamBuilder<PlayerState>(
            stream: audioPlayer.playerStateStream,
            builder: (_, snapshot) {
              final playerState = snapshot.data;
              final processingState = playerState?.processingState;
              final playing = playerState?.playing;
              if (!(playing ?? false)) {
                return TextButton(
                  onPressed: () => audioPlayer.play(),
                  child: Icon(
                    Icons.play_arrow_rounded,
                    size: 45.h,
                    color: Colors.black,
                  ),
                );
              } else if (processingState != ProcessingState.completed) {
                return TextButton(
                  onPressed: () => audioPlayer.pause(),
                  child: Icon(
                    Icons.pause_rounded,
                    size: 60.h,
                    color: Colors.black,
                  ),
                );
              }
              return TextButton(
                onPressed: () {},
                child: Icon(
                  Icons.play_arrow_rounded,
                  size: 45.h,
                  color: Colors.black,
                ),
              );
            },
          );
  }
}
