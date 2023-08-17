import 'dart:io';

import 'package:admin_watches/consts/auth_validator.dart';
import 'package:admin_watches/consts/dialog_services.dart';
import 'package:admin_watches/widgets/custom_subtitle_widget.dart';
import 'package:admin_watches/widgets/custom_text_widget.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import '../../../consts/app_color.dart';
import '../../../model/product_model.dart';
import '../../../widgets/app_animated_name.dart';

class UploadProductForm extends StatefulWidget {
  static String id='upload-form';
  const UploadProductForm({super.key, this.productModel});
final ProductModel?productModel;
  @override
  State<UploadProductForm> createState() => _UploadProductFormState();
}

class _UploadProductFormState extends State<UploadProductForm> {

  XFile?_pickedImage;
  bool isEditing =false;
  String? productNetworkImage;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController _titleController;
  late TextEditingController _priceController;
  late TextEditingController _quantityController;
  late TextEditingController _descriptionController;

  @override
  void initState() {
    if(widget.productModel != null){
      isEditing =true;
      productNetworkImage = widget.productModel!.productImage;
      categoryValue = widget.productModel!.productCategory;
    }
    _titleController= TextEditingController(text: widget.productModel?.productTitle);
    _priceController = TextEditingController(text:widget.productModel?.productPrice);
    _quantityController = TextEditingController(text:widget.productModel?.productQuantity);
    _descriptionController = TextEditingController(text:widget.productModel?.productDescription);
    super.initState();
  }

  @override
  void dispose() {
   _titleController.dispose();
   _descriptionController.dispose();
   _quantityController.dispose();
   _priceController.dispose();
    super.dispose();
  }
  void clearForm(){
    _titleController.clear();
    _priceController.clear();
    _quantityController.clear();
    _descriptionController.clear();
    removePickedImage();
  }

  void removePickedImage(){
    setState(() {
      _pickedImage =null;
      productNetworkImage=null;
    });
  }

  Future<void>upLoadProduct()async{

    if(categoryValue == null){
      DialogsServices.appDialog(context: context, title: 'Pick category',
          fct: (){}
      );
      return;
    }
    if(_pickedImage == null){
      DialogsServices.appDialog(context: context, title: 'Pick image',
          fct: (){}
      );
      return;
    }
    final isValid = formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if(isValid){

    }
  }

  Future<void>editProduct()async{
    final isValid = formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if(_pickedImage == null && productNetworkImage == null){
      DialogsServices.appDialog(context: context, title: 'Pick image',
          fct: (){}
      );
      return;
    }
    if(isValid){

    }
  }

Future<void>localImagePicker()async{
    final ImagePicker picker = ImagePicker();
    await DialogsServices.imagePickerDialog(
        context: context,
        cameraFct: ()async{
          _pickedImage =await picker.pickImage(source:ImageSource.camera );
          setState(() {});
        },
        galleryFct: ()async{
          _pickedImage = await picker.pickImage(source: ImageSource.gallery);
          setState(() {});
        },
        removeFct: (){
           setState(() {
             removePickedImage();
           });
        }
    );
}
  String?categoryValue;

  @override
  Widget build(BuildContext context) {
    final  size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title:  AppAnimatedName(name:isEditing?'Edit Product' :'Upload New Product'),
        ),
        bottomSheet: SizedBox(
          height: kBottomNavigationBarHeight+10,
          child: Material(
            color: Theme.of(context).scaffoldBackgroundColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(12),
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)
                    )
                  ),
                    onPressed: (){
                      setState(() {
                        clearForm();
                      });
                    },
                    icon: const Icon(Icons.clear),
                    label: const CustomTextWidget(title: 'Clear'),
                ),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(12),
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)
                      )
                  ),
                  onPressed: (){
                   if(isEditing){
                     editProduct();
                   }else{
                     upLoadProduct();
                   }


                  },
                  icon: const Icon(Icons.upload),
                  label: const CustomTextWidget(title: 'Upload Product'),
                ),
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const SizedBox(height: 20,),
                  // image picker
                  if(isEditing && productNetworkImage!=null)...[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                       productNetworkImage!,
                        height: size.width*0.5,
                        alignment: Alignment.center,
                      ),
                    )
                  ]
                else if(_pickedImage == null)...[
                   SizedBox(
                     height:size.width*0.4 ,
                     width: size.width*0.4+10,
                     child: DottedBorder(
                       borderType: BorderType.RRect,
                       radius: const Radius.circular(12),
                       padding: const EdgeInsets.all(6),
                       child: ClipRRect(
                           borderRadius:  const BorderRadius.all(Radius.circular(12)),
                           child: Center(
                             child: Column(
                               mainAxisAlignment: MainAxisAlignment.center,
                               children: [
                                 const Icon(Icons.image_outlined,size: 80,color: Colors.blue,),
                                 TextButton(onPressed: (){
                                   localImagePicker();
                                 },
                                     child: const Text('Pick an image'),
                                 )
                               ],
                             ),
                           )
                       ),
                     ),
                   ),
                 ]else...[
                   ClipRRect(
                     borderRadius: BorderRadius.circular(12),
                     child: Image.file(
                       File(_pickedImage!.path),
                       height: size.width*0.5,
                       alignment: Alignment.center,
                     ),
                   )
                 ],
                  if(_pickedImage != null && productNetworkImage!=null)...[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                            onPressed: (){
                              localImagePicker();
                            },
                            child: const CustomTextWidget(title: 'Pick another image',color: Colors.blue,fontSize: 16,)),
                        TextButton(
                            onPressed: (){
                              removePickedImage();
                            },
                            child: const CustomTextWidget(title: 'Delete',color: Colors.red,fontSize: 16,)),
                      ],
                    )
                  ],
                  const SizedBox(height: 25,),
                DropdownButton(
                  hint:  Text(categoryValue??'select'),
                  value: categoryValue,
                    items: AppConsts.categoriesDropDownList,
                    onChanged: (String?value){
                      setState(() {
                        categoryValue =value;
                      });
                    }
                ),
                  const SizedBox(height:25),
                  Form(
                    key: formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            controller: _titleController,
                            key: const ValueKey('Title'),
                            maxLength: 80,
                            minLines: 1,
                            maxLines: 2,
                            keyboardType: TextInputType.multiline,
                            textInputAction: TextInputAction.newline,
                            decoration: const InputDecoration(
                              hintText: 'Product Title',
                            ),
                            validator: (value){
                             return AuthValidator.upLoadProdText(
                               value: value,
                               toBeReturnedString:'please enter a valid title'
                             );
                            },
                          ),
                          const SizedBox(height: 20,),
                          Row(
                            children: [
                              Flexible(
                                  flex:1,
                                  child: TextFormField(
                                    controller: _priceController,
                                    key: const ValueKey('Price \$'),
                                    keyboardType: TextInputType.number,
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.allow(
                                        RegExp( r'^(\d+)?\.?\d{0,2}')
                                      )
                                    ],
                                    decoration: const InputDecoration(
                                      hintText: 'Price',
                                      prefix: SubTitleWidget(subTitle: '\$',color: Colors.blue,fontSize: 16,)
                                    ),
                                    validator: (value){
                                      return AuthValidator.upLoadProdText(
                                        value:value ,
                                        toBeReturnedString:'Price is missing'
                                      );
                                    },
                                  ),),
                              const SizedBox(width: 15,),
                              Flexible(
                                flex:1,
                                child: TextFormField(
                                  controller: _quantityController,
                                  key: const ValueKey('Quantity'),
                                  keyboardType: TextInputType.number,
                                  inputFormatters: <TextInputFormatter>[
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                  decoration: const InputDecoration(
                                      hintText: 'Qty',
                                  ),
                                  validator: (value){
                                    return AuthValidator.upLoadProdText(
                                        value:value ,
                                        toBeReturnedString:'Quantity is missing'
                                    );
                                  },
                                ),),
                            ],
                          ),
                          const SizedBox(height: 15,),
                          TextFormField(
                            controller: _descriptionController,
                            key: const ValueKey('Description'),
                            maxLength: 1000,
                            minLines: 3,
                            maxLines: 8,
                            keyboardType: TextInputType.multiline,
                            textInputAction: TextInputAction.newline,
                            decoration: const InputDecoration(
                              hintText: 'Description',
                            ),
                            validator: (value){
                              return AuthValidator.upLoadProdText(
                                  value: value,
                                  toBeReturnedString:'Description is missing'
                              );
                            },
                          ),
                        ],
                      ),
                  )
                ],
              ),
            ),),
      ),
    );
  }
}
