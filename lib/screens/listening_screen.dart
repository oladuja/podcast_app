import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:just_audio/just_audio.dart';
import 'package:rxdart/rxdart.dart';

import '../helper/position_data.dart';
import '../widgets/audio_control.dart';

class ListeningScreen extends StatefulWidget {
  final AudioPlayer audioPlayer;

  const ListeningScreen({
    super.key,
    required this.audioPlayer,
  });

  @override
  State<ListeningScreen> createState() => _ListeningScreenState();
}

class _ListeningScreenState extends State<ListeningScreen> {
  Stream<PositonData> get positonDataStream =>
      Rx.combineLatest3<Duration, Duration, Duration?, PositonData>(
        widget.audioPlayer.positionStream,
        widget.audioPlayer.bufferedPositionStream,
        widget.audioPlayer.durationStream,
        (position, bufferedPosition, duration) => PositonData(
          position,
          bufferedPosition,
          duration ?? Duration.zero,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 80.h),
            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.16),
                      offset: const Offset(0, 30),
                      blurRadius: 60)
                ],
              ),
              width: 200.w,
              child: Image.network(
                'https://99designs-blog.imgix.net/blog/wp-content/uploads/2018/01/attachment_91625055-e1515419927311.jpeg?auto=format&q=60&fit=max&w=930',
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(height: 45.h),
            Text(
              'Independently Good Design',
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.h),
            Text(
              'Adobe / Gimlet Creative',
              style: TextStyle(
                fontSize: 14.sp,
              ),
            ),
            SizedBox(height: 10.h),
            Text(
              'NOV 26, 2019',
              style: TextStyle(
                fontSize: 12.sp,
              ),
            ),
            SizedBox(height: 50.h),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30).w,
              child: StreamBuilder<PositonData>(
                stream: positonDataStream,
                builder: (_, snapshot) {
                  final positonData = snapshot.data;
                  return ProgressBar(
                    barHeight: 8.h,
                    baseBarColor: const Color(0XFFEBEBEB),
                    progressBarColor: const Color(0XFF004EFF).withOpacity(0.7),
                    bufferedBarColor: const Color(0XFF004EFF).withOpacity(0.45),
                    thumbColor: const Color(0XFF004EFF),
                    timeLabelTextStyle: TextStyle(
                      color: Colors.black.withOpacity(0.75),
                      fontWeight: FontWeight.bold,
                    ),
                    progress: positonData?.position ?? Duration.zero,
                    total: positonData?.duration ?? Duration.zero,
                    onSeek: (position) => widget.audioPlayer.seek(position),
                  );
                },
              ),
            ),
            AudioControl(
              audioPlayer: widget.audioPlayer,
              type: AudioControlType.listening,
            ),
          ],
        ),
      ),
    );
  }
}
