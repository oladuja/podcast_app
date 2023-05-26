import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:just_audio/just_audio.dart';

import '../screens/listening_screen.dart';
import 'audio_control.dart';

class PositionedAudioPlayer extends StatelessWidget {
  const PositionedAudioPlayer({
    super.key,
    required this.audioPlayer,
  });

  final AudioPlayer audioPlayer;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      child: GestureDetector(
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => ListeningScreen(audioPlayer: audioPlayer),
          ),
        ),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 75.h,
          child: ClipRRect(
            clipBehavior: Clip.hardEdge,
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
              child: Container(
                color: Colors.transparent,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0).w,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0).w,
                        child: Image.network(
                          'https://99designs-blog.imgix.net/blog/wp-content/uploads/2018/01/attachment_91625055-e1515419927311.jpeg?auto=format&q=60&fit=max&w=930',
                          width: 64.w,
                          height: 64.h,
                        ),
                      ),
                      SizedBox(width: 18.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Independently Good Design',
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '19 mins',
                            style: TextStyle(
                              fontSize: 12.sp,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      AudioControl(
                        audioPlayer: audioPlayer,type: AudioControlType.playing,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
