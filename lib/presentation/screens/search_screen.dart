import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';
import '../../../consts/assets_manager.dart';
import '../../../widgets/app_animated_name.dart';
import '../../controllers/product_provider.dart';
import '../../model/product_model.dart';
import '../../widgets/custom_text_widget.dart';
import '../../widgets/product_widget.dart';

class SearchScreen extends StatefulWidget {
  static String id = 'search_screen';
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late TextEditingController searchController;

  @override
  void initState() {
    searchController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
  List<ProductModel>searchProductList=[];
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    final catName = ModalRoute.of(context)!.settings.arguments as String?;
    final List<ProductModel> productList = catName == null
        ? productProvider.getProducts
        : productProvider.findByCategory(cateName: catName);
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const AppAnimatedName(name:'Products'),
        ),
        body: productList.isEmpty
            ? const Center(child: CustomTextWidget(title: 'No products yet'))
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    TextField(
                      controller: searchController,
                      decoration: InputDecoration(
                          hintText: 'Search',
                          prefixIcon:  const Icon(Ionicons.search),
                          suffixIcon: IconButton(
                              onPressed: () {
                                searchController.clear();
                                FocusScope.of(context).unfocus();
                              },
                              icon: const Icon(
                                Icons.clear,
                                color: Colors.red,
                              ))),
                      onChanged: (value) {
                        // setState(() {
                        //   searchProductList =productProvider.searchQuery(searchText: searchController.text);
                        // });
                      },
                      onSubmitted: (value){
                        setState(() {
                          searchProductList =productProvider.searchQuery(
                              searchText: searchController.text,
                              passedList: productList
                          );
                        });
                      },
                    ),

                    if(searchController.text.isNotEmpty&&searchProductList.isEmpty)...[
                      const Center(child: CustomTextWidget(title: 'NO results found',fontSize: 40,),)
                    ],
                    Expanded(
                            child: DynamicHeightGridView(
                                builder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ProductWidget(
                                      productId:searchController.text.isNotEmpty
                                          ?searchProductList[index].productId
                                          :productList[index].productId,
                                    ),
                                  );
                                },
                                itemCount:searchController.text.isNotEmpty
                                    ?searchProductList.length
                                    :productList.length,
                                crossAxisCount: 2),
                          )
                  ],
                ),
              ),
      ),
    );
  }
}
