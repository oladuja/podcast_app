import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LibraryTab extends StatelessWidget {
  const LibraryTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Listen now',
          style: TextStyle(
            color: const Color(0XFF004EFF),
            fontSize: 18.sp,
          ),
        ),
        SizedBox(width: 40.w),
        Text(
          'Discover',
          style: TextStyle(
            color: const Color(0XFF7B7A7C),
            fontSize: 18.sp,
          ),
        ),
        SizedBox(width: 40.w),
        Text(
          'Favorite',
          style: TextStyle(
            color: const Color(0XFF7B7A7C),
            fontSize: 18.sp,
          ),
        ),
      ],
    );
  }
}
