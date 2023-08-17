import 'package:flutter/cupertino.dart';

class CategoryModel with ChangeNotifier {
  final String image;
  final String name;
  final String id;

  CategoryModel({required this.image, required this.name, required this.id});
}
