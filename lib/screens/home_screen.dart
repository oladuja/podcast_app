import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';

import '../models/playlist_item.dart';
import '../widgets/header_title.dart';
import '../widgets/home_screen_bnb.dart';
import '../widgets/library_tab.dart';
import '../widgets/positioned_audio_player.dart';
import '../widgets/top_podcast.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  late AudioPlayer audioPlayer;

  @override
  void initState() {
    super.initState();
    audioPlayer = AudioPlayer();

    init();
  }

  Future<void> init() async {
    await audioPlayer.setAudioSource(
      AudioSource.asset(
        'assets/audio/podcast.mp3',
        tag: MediaItem(
            id: '0',
            title: 'Independently Good Design',
            artist: 'Adobe / Gimlet Creative',
            artUri: Uri.parse('https://99designs-blog.imgix.net/blog/wp-content/uploads/2018/01/attachment_91625055-e1515419927311.jpeg?auto=format&q=60&fit=max&w=930'),),
      ),
    );
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0).w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 75.h),
                  Text(
                    'Library',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 36.sp,
                    ),
                  ),
                  SizedBox(height: 30.h),
                  const LibraryTab(),
                  SizedBox(height: 30.h),
                  const HeaderTitle(title: 'Top Podcasts in Books'),
                  const TopPodcast(),
                  const HeaderTitle(title: 'Playlist'),
                  ...List<Widget>.generate(
                    playlists.length,
                    (index) => ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Text(
                        playlists[index].title,
                        style: TextStyle(
                          fontSize: 16.sp,
                        ),
                      ),
                      subtitle: Text(
                        playlists[index].title,
                        style: TextStyle(
                          fontSize: 12.sp,
                        ),
                      ),
                      leading: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.play_arrow_rounded,
                          size: 24.h,
                          color: Colors.black,
                        ),
                      ),
                      trailing: Text(
                        playlists[index].duration,
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          PositionedAudioPlayer(audioPlayer: audioPlayer),
        ],
      ),
      bottomNavigationBar: const HomeScreenBottomNavigationBar(),
    );
  }
}
