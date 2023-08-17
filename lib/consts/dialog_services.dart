import 'package:flutter/material.dart';

import '../widgets/custom_subtitle_widget.dart';
import '../widgets/custom_text_widget.dart';
import 'assets_manager.dart';

class DialogsServices
{
  static Future<void>appDialog({required BuildContext context,
    required String title,
    required Function fct,
    bool isError = true
  })async{
    return await showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12)
            ),
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            content:  Image.asset(AssetsManager.warningPath,height: 60,width: 60,),
            title:  CustomTextWidget(title: title),
            actions: [
              Visibility(
                visible: isError,
                child: TextButton(onPressed: (){
                  Navigator.pop(context);
                }, child: const SubTitleWidget(subTitle: 'Cancel',color: Colors.green,fontSize: 20,)),
              ),
              TextButton(onPressed: (){
                fct();
                Navigator.pop(context);
              }, child: const SubTitleWidget(subTitle: 'Ok',color: Colors.red,fontSize: 20,))
            ],
          );
        });
  }
  static Future<void>imagePickerDialog({
    required BuildContext context,
    required Function cameraFct,
    required Function galleryFct,
    required Function removeFct,


  })async{
    await showDialog(context: context, builder: (BuildContext context){
      return AlertDialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8)
        ),
        title: const Center(
          child: CustomTextWidget(title: 'Choose option',color: Colors.black,),
        ),
        content: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListBody(
              children: [
                TextButton.icon(
                    onPressed: (){
                      cameraFct();
                      if(Navigator.canPop(context)){
                        Navigator.pop(context);
                      }
                    },
                    icon: const Icon(Icons.camera_alt_outlined),
                    label: const CustomTextWidget(title: 'Camera')
                ),
                TextButton.icon(
                    onPressed: (){
                      galleryFct();
                      if(Navigator.canPop(context)){
                        Navigator.pop(context);
                      }
                    },
                    icon: const Icon(Icons.image),
                    label: const CustomTextWidget(title: 'Gallery')
                ),
                TextButton.icon(
                    onPressed: (){
                      removeFct();
                      if(Navigator.canPop(context)){
                        Navigator.pop(context);
                      }
                    },
                    icon: const Icon(Icons.remove),
                    label: const CustomTextWidget(title: 'Remove')
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}