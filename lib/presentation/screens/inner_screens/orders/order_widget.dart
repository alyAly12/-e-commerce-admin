import 'package:flutter/material.dart';

import '../../../../consts/app_color.dart';
import '../../../../widgets/custom_subtitle_widget.dart';
import '../../../../widgets/custom_text_widget.dart';

class OrderWidget extends StatefulWidget {
  const OrderWidget({super.key});

  @override
  State<OrderWidget> createState() => _OrderWidgetState();
}

class _OrderWidgetState extends State<OrderWidget> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.network(AppConsts.imgUrl,
            height: size.height * 0.2,
            width: size.height * 0.2,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(width: 10,),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Row(children: [
                   Flexible(
                     child: CustomTextWidget(
                       title: 'OZARO ZAR' * 10,
                       maxLines: 1,
                     ),
                   ),
                   IconButton(onPressed: (){},
                       icon:const Icon(Icons.clear,color: Colors.red,)),
                 ],),
                const SizedBox(height: 15,),
                 const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                     CustomTextWidget(
                      title: 'Price :',
                    ),
                    SubTitleWidget(subTitle: '\$120',fontSize: 20,color: Colors.blue,)
                  ],
                ),
                const SizedBox(height: 15,),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomTextWidget(
                      title: 'QTY: ',
                    ),
                    SubTitleWidget(subTitle: '20',fontSize: 20,color: Colors.blue,)
                  ],
                ),

              ],
            ),
          ),
        )
      ],
    );
  }
}
