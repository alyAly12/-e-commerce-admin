import 'package:admin_watches/controllers/product_provider.dart';
import 'package:admin_watches/presentation/screens/dashboard_screen.dart';
import 'package:admin_watches/presentation/screens/inner_screens/orders/order_screen.dart';
import 'package:admin_watches/presentation/screens/inner_screens/upload_product_form.dart';
import 'package:admin_watches/presentation/screens/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'consts/app_theme.dart';
import 'controllers/theme_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => ProductProvider()),
      ],
      child: Consumer<ThemeProvider>(
        builder: (BuildContext context, themeProvider, Widget? child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Admin-watches',
            theme: AppTheme.themeData(
                isDarkTheme: themeProvider.getDarkTheme, context: context),
            home: const DashBoardScreen(),
            routes: {
              OrderScreen.id: (context) => const OrderScreen(),
              SearchScreen.id: (context) => const SearchScreen(),
              UploadProductForm.id: (context) => const UploadProductForm()
            },
          );
        },
      ),
    );
  }
}
