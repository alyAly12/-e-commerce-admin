import 'package:admin_watches/widgets/custom_subtitle_widget.dart';
import 'package:flutter/material.dart';


class DashBoardButtons extends StatelessWidget {
  const DashBoardButtons({super.key, required this.onTap, required this.img, required this.text});
final void Function() onTap;
final String img;
final String text;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 5,
        shadowColor: Colors.green.withOpacity(0.5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(img,width: 60,height: 60,),
            const SizedBox(height: 15,),
            SubTitleWidget(subTitle: text)
          ],
        ),
      ),
    );
  }
}
