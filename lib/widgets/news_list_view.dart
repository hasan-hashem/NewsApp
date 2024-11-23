import 'package:flutter/material.dart';
import 'package:newsapp/models/artical_model.dart';
import 'package:newsapp/services/news_service.dart';
import 'package:newsapp/widgets/new_title.dart';
import 'package:dio/dio.dart';

class NewsListView extends StatefulWidget {
  const NewsListView({
    super.key,
  });

  @override
  State<NewsListView> createState() => _NewsListViewState();
}

class _NewsListViewState extends State<NewsListView> {
  List<ArticalModel> articals = [];
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    getNews();
  }

  Future<void> getNews() async {
    articals = await NewsService(Dio()).getnews();
    isLoading = false;
    setState(() {});
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    NewsService(Dio()).getnews();
    return isLoading
        ? SliverToBoxAdapter(child: Center(child: CircularProgressIndicator()))
        : SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: articals.length,
              (context, index) {
                return NewTitle(
                  articalModel: articals[index],
                );
              },
            ),
          );
  }
}
