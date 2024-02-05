import 'package:flutter/material.dart';
import 'package:mind_ease/models/category.dart';
import 'package:mind_ease/repositories/category_repository.dart';
import 'package:mind_ease/services/api.dart';

class CategoryController extends ChangeNotifier {
  late List<Category> categories = [];
  final CategoryRepository repository = CategoryRepository();

  Future<void> loadCategories() async {
    categories = await repository.findCategories();
    notifyListeners();
  }
}