// ignore_for_file: file_names
import 'package:flutter/material.dart';

class DefaultMaterialButton extends StatelessWidget{
  final VoidCallback onPressed;
  final double?elevation;
  final double radius;
  final double height;
  final double width;
  final Color backgroundColor;
  final Color? splashColor;
  final EdgeInsetsGeometry? internalPadding;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Widget? child;
  const DefaultMaterialButton(
      {Key? key,
        this.height=40,
        this.width=50,
        this.padding,
        this.margin, required this.onPressed, this.elevation,  this.radius=10,  this.backgroundColor=Colors.deepOrangeAccent, this.splashColor, this.internalPadding, this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: padding,
      margin: margin,
      child: MaterialButton(
        onPressed: onPressed,
        color: backgroundColor,
        splashColor: splashColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
        child: child,),
    );
  }
}