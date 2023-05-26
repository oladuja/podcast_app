import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreenBottomNavigationBar extends StatelessWidget {
  const HomeScreenBottomNavigationBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      selectedLabelStyle: TextStyle(
        fontSize: 12.sp,
        color: const Color(0XFF437DFF),
      ),
      unselectedLabelStyle: TextStyle(
        fontSize: 12.sp,
        color: const Color(0XFFBEBEBE),
      ),
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
          icon: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              'assets/images/list-ul-solid.png',
              width: 24.w,
              height: 24.h,
            ),
          ),
          label: 'Library',
        ),
        BottomNavigationBarItem(
          icon: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              'assets/images/microphone-solid.png',
              width: 24.w,
              height: 24.h,
            ),
          ),
          label: 'New',
        ),
        BottomNavigationBarItem(
          icon: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              'assets/images/user-alt-solid.png',
              width: 24.w,
              height: 24.h,
            ),
          ),
          label: 'New',
        ),
      ],
    );
  }
}
