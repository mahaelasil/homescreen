import 'package:flutter/material.dart';

class OnBoardingItem  extends StatelessWidget {
  final dynamic model;
  final String title;
  const OnBoardingItem ({Key? key,  this.model, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(flex: 4,
          child: Image.asset('assets/image/images.gif',
            fit: BoxFit.fill,
            height: 20,
            width: 18,
          ),


        ),
      ],
    );
  }
}