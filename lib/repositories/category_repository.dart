import 'package:mind_ease/models/category.dart';
import 'package:mind_ease/services/api.dart';

class CategoryRepository {
  final ApiService api = ApiService();

  Future<List<Category>> findCategories() async {
    try {
      var response = await api.get('categories');


      if (response['success']) {
        var results = response['results'] as List;

        List<Category> categories =
            results.map((json) => Category.fromJson(json)).toList();

        return categories;
      } else {
        return [];
      }
    } catch (error) {
      return [];
    }
  }
}
