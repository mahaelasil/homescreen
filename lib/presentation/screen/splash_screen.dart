
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../core/constans.dart';
import '../../core/my_cache_keys.dart';
import '../../data/data_source/local/my_cache.dart';
import '../widgets/defult_text.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin{
  late final AnimationController _controller;
  late final AnimationController _slideController;
  late final Animation<Offset> _slideAnimation;

  @override
  void initState() {

    _controller = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    )..repeat(reverse: true);


    _slideController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      animationBehavior: AnimationBehavior.preserve,
      value: 1,
      vsync: this,
    )..repeat(reverse: true);

    _slideAnimation = Tween<Offset>(
        begin: Offset.zero,
        end: const Offset(0.0, 1.0)
    ).animate(
        CurvedAnimation(parent: _slideController, curve: Curves.easeIn)
    );

    Timer(const Duration(milliseconds: 4000), () {
      bool isOnBoardingViewed = MyCache.getBool(key: MyCacheKeys.isOnBoardingViewed);
      if(isOnBoardingViewed){
        Navigator.pushNamedAndRemoveUntil(
            context,
            loginScreen,
                (route) => false);
      }else {
        Navigator.pushNamedAndRemoveUntil(
            context,
            onBoardingScreen,
                (route) => false);
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _slideController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange.withOpacity(0.4),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            SlideTransition(
              position: _slideAnimation,
              child: DefaultText(
                text: 'Google',
                textSize: 20.sp,
                textColor: Colors.deepOrange,
                weight: FontWeight.bold,
                textStyle: FontStyle.italic,
              ),
            )
          ],
        ),
      ),
    );
  }
}