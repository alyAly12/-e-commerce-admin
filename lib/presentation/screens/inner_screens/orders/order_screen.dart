import 'package:flutter/material.dart';

import '../../../../consts/assets_manager.dart';
import '../../../../widgets/custom_text_widget.dart';
import '../../../../widgets/empty_screen.dart';
import 'order_widget.dart';


class OrderScreen extends StatefulWidget {
  static const String id = 'order-screen';

  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  final bool _isEmpty = false;

  @override
  Widget build(BuildContext context) {
    return _isEmpty
        ? Scaffold(
            body: EmptyScreen(
            title: 'Whoops!',
            secondTitle: 'No orders found',
            thirdTitle: 'Go ahead & Explore',
            image: AssetsManager.order,
            fun: () {},
          ))
        : Scaffold(
            appBar: AppBar(
              elevation: 0,
              leading: IconButton(
                  onPressed: () {
                    Navigator.canPop(context) ? Navigator.pop(context) : null;
                  },
                  icon: const Icon(Icons.arrow_back_ios)),
              title: const CustomTextWidget(title: 'Orders'),
            ),
            body: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return const Padding(
                    padding:  EdgeInsets.symmetric(vertical: 6,horizontal: 10),
                    child:   OrderWidget(),
                  );
                }),
          );
  }
}
