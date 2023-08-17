
import 'package:admin_watches/consts/assets_manager.dart';
import 'package:admin_watches/presentation/screens/inner_screens/orders/order_screen.dart';
import 'package:admin_watches/presentation/screens/inner_screens/upload_product_form.dart';
import 'package:admin_watches/presentation/screens/search_screen.dart';
import 'package:flutter/cupertino.dart';

class DashBoardButtonModel
{
  final String img;
  final String text;
  final void Function() onTap;

  DashBoardButtonModel({required this.img,required this.text,required this.onTap});

  static List<DashBoardButtonModel> dashBoardButtonList (BuildContext context)=>[
    DashBoardButtonModel(
        img: AssetsManager.cloud,
        text: 'Add new product',
        onTap: (){
          Navigator.pushNamed(context, UploadProductForm.id);
        }
    ),
    DashBoardButtonModel(
        img: AssetsManager.shoppingPath,
        text: 'Inspect all products',
        onTap: (){
          Navigator.pushNamed(context, SearchScreen.id);
        }
    ),
    DashBoardButtonModel(
        img: AssetsManager.order,
        text: 'View orders',
        onTap: (){
          Navigator.pushNamed(context,OrderScreen.id);
        }
    ),
  ];
}