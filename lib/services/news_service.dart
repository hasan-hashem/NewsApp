import 'package:dio/dio.dart';
import 'package:newsapp/models/artical_model.dart';

class NewsService {
  final Dio dio;
  NewsService(this.dio);

  Future<List<ArticalModel>> getnews() async {
    try {
      Response response = await dio.get(
          'https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=7af874dae61d4dbf9b9a041b7ba6ee5f');

      Map<String, dynamic> jsonData = response.data;
      List<dynamic> articles = jsonData['articles'];
      List<ArticalModel> articalsList = [];

      for (var article in articles) {
        // التحقق من وجود جميع البيانات المطلوبة
        if (article['urlToImage'] != null &&
            article['title'] != null &&
            article['description'] != null) {
          ArticalModel articalModel = ArticalModel(
              image: article['urlToImage'],
              title: article['title'],
              subtitle: article['description']);

          articalsList.add(articalModel);
        }
      }

      // التحقق من أن القائمة ليست فارغة
      if (articalsList.isEmpty) {
        throw Exception('No articles found with complete data');
      }

      return articalsList;
    } catch (e) {
      print('Error fetching news: $e');
      throw Exception(
          'Failed to load news articles'); // رمي استثناء بدلاً من إرجاع قائمة فارغة
    }
  }
}
