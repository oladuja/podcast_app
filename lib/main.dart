import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:podcast_app/screens/home_screen.dart';

Future<void> main() async {
  await JustAudioBackground.init(
    androidNotificationChannelId: 'com.ryanheise.bg_demo.channel.audio',
    androidNotificationChannelName: 'Audio playback',
    androidNotificationOngoing: true,
  );
  runApp(const PodcastApp());
}

class PodcastApp extends StatelessWidget {
  const PodcastApp({super.key});

  @override
  Widget build(BuildContext context) {
    MediaQueryData deviceInfo = MediaQueryData.fromWindow(WidgetsBinding.instance.window);
    return ScreenUtilInit(
      designSize: Size(deviceInfo.size.width, deviceInfo.size.height),
      builder: (_, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: child,
      ),
      child: const HomeScreen(),
    );
  }
}
