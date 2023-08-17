import 'package:flutter/material.dart';
import '../consts/app_color.dart';
import 'custom_subtitle_widget.dart';
import 'custom_text_widget.dart';

class EmptyScreen extends StatelessWidget {
  const EmptyScreen(
      {super.key,
      required this.title,
      required this.secondTitle,
      required this.thirdTitle,
      required this.image,
      required this.fun});
  final String title;
  final String image;
  final String secondTitle;
  final String thirdTitle;
  final Function fun;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(
              image,
              height: size.height * 0.35,
              width: double.infinity,
            ),
            CustomTextWidget(
              title: title,
              color: Colors.red,
              fontSize: 40,
            ),
            SubTitleWidget(
              subTitle: secondTitle,
              fontSize: 20,
            ),
            SubTitleWidget(
              subTitle: thirdTitle,
              color: Colors.grey,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    backgroundColor: AppColors.lightPrimary),
                onPressed: () {
                  fun();
                },
                child: const CustomTextWidget(title: 'Shop now'))
          ],
        ),
      ),
    );
  }
}
