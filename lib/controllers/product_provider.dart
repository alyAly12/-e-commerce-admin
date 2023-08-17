import 'package:flutter/cupertino.dart';
import 'package:uuid/uuid.dart';

import '../model/product_model.dart';


class ProductProvider with ChangeNotifier {
  ProductModel? findById(String productId) {
    if (products.where((element) => element.productId == productId).isEmpty) {
      return null;
    }
    return products.firstWhere((element) => element.productId == productId);
  }

  List<ProductModel> findByCategory({required String cateName}) {
    List<ProductModel> ctgList = products
        .where((element) => element.productCategory
            .toLowerCase()
            .contains(cateName.toLowerCase()))
        .toList();
    return ctgList;
  }

  List<ProductModel> searchQuery({required String searchText,required List<ProductModel>passedList}) {
    List<ProductModel> searchList = passedList
        .where((element) => element.productTitle
            .toLowerCase()
            .contains(searchText.toLowerCase()))
        .toList();
    return searchList;
  }

  List<ProductModel> get getProducts {
    return products;
  }

  final List<ProductModel> products = [
    ProductModel(
        productId: const Uuid().v4(),
        productTitle: 'Men Gold Arrival ',
        productPrice: '1900',
        productCategory: 'watches',
        productDescription:
            'With the numerals 3, 9, 12 and its small seconds hand at 6 o’clock, the 1908 revisits the style of an Oyster Perpetual from 1931 and resolutely endows it with modernity.',
        productImage:
            'https://content.rolex.com/v7/dam/new-watches/2023/new-1908/roller-tradition/new-watches-2023-1908-gold-black-dial-m52508-0002_2301jva_001.jpg?imwidth=640',
        productQuantity: '5'),
    ProductModel(
        productId: const Uuid().v4(),
        productTitle: 'Men  Arrival ',
        productPrice: '1400',
        productCategory: 'watches',
        productDescription:
            'The dial receives new graphic balance with resized and restyled hour markers and counter rings. Subtle combinations of colours and finishes accentuate the contrast between the dial and the counters and/or their rings, bringing even greater visual harmony and a more modern demeanour to the face of the Cosmograph Daytona.',
        productImage:
            'https://content.rolex.com/v7/dam/new-watches/2023/new-cosmograph-daytona/new-watches-2023-cosmograph-daytona-an-icon-m126503-0001_2301ac_002.jpg?imwidth=1600',
        productQuantity: '5'),
    ProductModel(
        productId: const Uuid().v4(),
        productTitle: 'Men daytona Arrival ',
        productPrice: '1200',
        productCategory: 'watches',
        productDescription:
            'In 18 kt yellow or white gold, the particularly slim case is fitted with a transparent case back which allows the quality of the movement finishings to be admired.',
        productImage:
            'https://content.rolex.com/v7/dam/new-watches/2023/new-1908/new-watches-2023-1908-transparent-case-back-m52509-0002_2301jva_002.jpg?imwidth=1600',
        productQuantity: '5'),
    ProductModel(
        productId: const Uuid().v4(),
        productTitle: 'Samsung fold ',
        productPrice: '4200',
        productCategory: 'mobiles',
        productDescription:
            'The dial receives new graphic balance with resized and restyled hour markers and counter rings. Subtle combinations of colours and finishes accentuate the contrast between the dial and the counters and/or their rings, bringing even greater visual harmony and a more modern demeanour to the face of the Cosmograph Daytona.',
        productImage:
            'https://images.samsung.com/eg/smartphones/galaxy-z-fold5/images/galaxy-z-fold5-highlights-excellence-design.jpg?imbypass=true',
        productQuantity: '5'),
  ];
}
