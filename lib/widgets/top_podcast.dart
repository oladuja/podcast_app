
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TopPodcast extends StatelessWidget {
  const TopPodcast({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20).h,
      height: 240.h,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: const [
          TopPodcastItem(image: 'assets/images/828x0w.png'),
          TopPodcastItem(image: 'assets/images/image2.png'),
        ],
      ),
    );
  }
}

class TopPodcastItem extends StatelessWidget {
  final String image;

  const TopPodcastItem({
    super.key,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 15.0).w,
      width: 190.w,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
