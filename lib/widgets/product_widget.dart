import 'package:admin_watches/presentation/screens/inner_screens/upload_product_form.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controllers/product_provider.dart';
import 'custom_subtitle_widget.dart';
import 'custom_text_widget.dart';



class ProductWidget extends StatelessWidget {
  const ProductWidget({super.key, required this.productId});
  final String productId;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final productProvider =Provider.of<ProductProvider>(context);
    final getCurrentProduct = productProvider.findById(productId);

    return getCurrentProduct == null ?const SizedBox.shrink() :Padding(
      padding: const EdgeInsets.all(3.0),
      child: GestureDetector(
        onTap: () async {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>UploadProductForm(productModel: getCurrentProduct,)));
        },
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: FancyShimmerImage(
                imageUrl:getCurrentProduct.productImage,
                // productModelProvider.productImage,
                height: size.height * 0.2,
                width: size.height * 0.2,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Flexible(
                    flex: 5,
                    child: CustomTextWidget(
                        title:getCurrentProduct.productTitle
                        // productModelProvider.productTitle
                    ),),
                 // CustomHeartButton(productId: getCurrentProduct.productId,)
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                    flex: 5,
                    child: SubTitleWidget(
                      subTitle: '\$${getCurrentProduct.productPrice
                          // productModelProvider.productPrice
                      }' ,
                      maxLines: 1,
                      color: Colors.blue,
                      fontSize: 20,
                    )),
                 // CustomBagButton(productId: getCurrentProduct.productId,)
              ],
            ),
            const SizedBox(
              height: 5,
            ),
          ],
        ),
      ),
    );
  }
}
