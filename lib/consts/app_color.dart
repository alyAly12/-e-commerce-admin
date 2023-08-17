import 'package:flutter/material.dart';

class AppColors {
  static const Color lightScaffoldColor = Colors.white;
  static const Color lightPrimary = Color(0xff0ACF83);
  static const Color lightCardColor = Color.fromARGB(106, 250, 250, 250);
  static const Color darkScaffoldColor = Color.fromARGB(255, 9, 3, 27);
  static const Color darkPrimary = Color.fromARGB(255, 94, 75, 239);
}

class AppConsts {
  static List<String> categoryList = [
    'cosmetics',
    'fashion',
    'watches',
    'shoes',
    'mobiles',
    'books',
    'electronics',
  ];

  static List<DropdownMenuItem<String>>? get categoriesDropDownList {
    List<DropdownMenuItem<String>>? menuItems = List<DropdownMenuItem<String>>.generate(
      categoryList.length,
      (index) => DropdownMenuItem(
        value: categoryList[index],
        child: Text(categoryList[index]),
      ),
    );
    return menuItems;
  }

  static const String imgUrl =
      'https://content.rolex.com/v7/dam/new-watches/2023/new-gmt-master-ii/new-watches-2023-gmt-master-ii-connection-to-the-world-m126718grnr-0001_2301jva_002.jpg?imwidth=1600';
  static String landingImages =
      'https://scontent.fcai21-4.fna.fbcdn.net/v/t39.30808-6/363355860_279586534719955_5893956710259079506_n.jpg?_nc_cat=109&cb=99be929b-59f725be&ccb=1-7&_nc_sid=8bfeb9&_nc_ohc=gzP8MkY5tCcAX_np4Gq&_nc_ht=scontent.fcai21-4.fna&oh=00_AfBDPXZN6rHAs5JCtthmSelWnVLtDSS-faskriP9J7kimQ&oe=64D94CD9';
  static String ozaroImage =
      'https://scontent.fcai21-4.fna.fbcdn.net/v/t39.30808-6/362666624_278081858203756_20885709065740004_n.jpg?stp=cp6_dst-jpg&_nc_cat=103&cb=99be929b-59f725be&ccb=1-7&_nc_sid=8bfeb9&_nc_ohc=xt4qC6KA6mUAX_K_wtK&_nc_ht=scontent.fcai21-4.fna&oh=00_AfBR48P_AR0bi7lXrFXDemRNsms-tbBiuq1kRtFTUzq5eg&oe=64D811E0';
}
