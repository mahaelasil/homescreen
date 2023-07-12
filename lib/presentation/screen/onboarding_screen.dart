import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../core/constans.dart';
import '../../core/my_cache_keys.dart';
import '../../data/data_source/local/my_cache.dart';
import '../../item/onboarding_item.dart';
import '../../model/onboarding_model.dart';
import '../widgets/defult_material_button.dart';
import '../widgets/defult_text.dart';
import '../widgets/defult_text_button.dart';


class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {

  PageController onBoardingPageController = PageController();

  bool isLast = false;

  final List<OnBoardingModel> onBoardingList = [
    OnBoardingModel(
      image: 'assets/image/images.gif',
      title: 'First Title',
      body: 'TestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTest',
    ),
    OnBoardingModel(
      image: 'assets/image/download.png',
      title: 'Second Title',
      body: 'TestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTest',
    ),
    OnBoardingModel(
      image: 'assets/image/download (2).gif',
      title: 'Third Title',
      body: 'TestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTest',
    ),
  ];

  void finishOnBoarding(BuildContext context){
    MyCache.putBool(key: MyCacheKeys.isOnBoardingViewed, value: isLast);
    Navigator.pushNamedAndRemoveUntil(context, loginScreen, (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.deepOrange,
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 2.w),
            child: Visibility(
              visible: !isLast,
              child: CircleAvatar(
                radius: 20.sp,
                backgroundColor: Colors.orangeAccent,
                child: DefaultTextButton(
                  onPressed: () => finishOnBoarding(context),
                  child: const DefaultText(
                    text: 'Skip',
                    textColor: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        top: true,
        bottom: true,
        left: true,
        right: true,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: DefaultText(
                text: 'Hello!',
                textSize: 30.sp,
                textColor: Colors.indigo,
                weight: FontWeight.bold,
                textStyle: FontStyle.italic,
              ),
            ),
            Expanded(
              child: PageView.builder(
                itemBuilder: (context, index) => OnBoardingItem(model: onBoardingList[index]),
                itemCount: onBoardingList.length,
                physics: const BouncingScrollPhysics(),
                controller: onBoardingPageController,
                onPageChanged: (index){
                  if(index == onBoardingList.length-1){
                    setState(() {
                      isLast = true;
                    });
                  }else{
                    setState(() {
                      isLast = false;
                    });
                  }
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 6.h),
              child: SmoothPageIndicator(
                controller: onBoardingPageController,
                count: onBoardingList.length,
                effect: ExpandingDotsEffect(
                    dotColor: Colors.orangeAccent,
                    activeDotColor: Colors.teal,
                    expansionFactor: 3,
                    dotHeight: 3.w,
                    dotWidth: 3.w,
                    spacing: 3.w
                ),
              ),
            ),
            if(isLast)
              DefaultMaterialButton(
                onPressed: () => finishOnBoarding(context),
                backgroundColor: Colors.transparent,
                margin: EdgeInsets.symmetric(horizontal: 8.w),
                height: 6.h,
                radius: 25.sp,
                child: const DefaultText(
                  text: 'Get Started',
                  weight: FontWeight.bold,
                  textColor: Colors.white,
                ),
              ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 2.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: DefaultText(
                      text: "Don't have an account?",
                      textSize: 12.sp,
                      textColor: Colors.black,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: DefaultText(
                      text: 'Sign Up Now!',
                      textSize: 12.sp,
                      textColor: Colors.blue,
                      weight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}