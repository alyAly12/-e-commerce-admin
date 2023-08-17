import 'package:admin_watches/consts/assets_manager.dart';
import 'package:admin_watches/controllers/theme_provider.dart';
import 'package:admin_watches/model/dashboard_button_model.dart';
import 'package:admin_watches/widgets/custom_text_widget.dart';
import 'package:admin_watches/widgets/dashboard_buttons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  @override
  Widget build(BuildContext context) {
   final  size = MediaQuery.of(context).size;
   final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const CustomTextWidget(title: 'Search'),
        leading: Image.asset(AssetsManager.shoppingPath),
        actions: [
         IconButton(
             onPressed: (){
               themeProvider.setDarkTheme(
                   themeValue: !themeProvider.getDarkTheme);

             },
             icon: Icon(themeProvider.getDarkTheme?Icons.dark_mode_outlined:Icons.light_mode_outlined))
        ],
      ),
      body: GridView.count(crossAxisCount: 2,childAspectRatio: 1,
      children: List.generate(
          DashBoardButtonModel.dashBoardButtonList(context).length,
              (index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: DashBoardButtons(
                    onTap: DashBoardButtonModel.dashBoardButtonList(context)[index].onTap,
                    img: DashBoardButtonModel.dashBoardButtonList(context)[index].img,
                    text: DashBoardButtonModel.dashBoardButtonList(context)[index].text,
                ),
              )
      ),
      ),
    );
  }
}
