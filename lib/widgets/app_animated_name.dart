import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'custom_text_widget.dart';

class AppAnimatedName extends StatelessWidget {
  const AppAnimatedName({super.key, required this.name,  this.fontSize=20});
  final String name;
  final double fontSize;
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: const Color(0xff0ACF83),
        highlightColor: const Color(0xff5bFF22),
        child: CustomTextWidget(title: name,fontSize:fontSize ,));
  }
}
