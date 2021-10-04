import 'package:flutter/material.dart';
import 'package:flutter_app/providers/news_provider.dart';
import 'package:flutter_app/view_models/search/topic_search.dart';
import 'package:flutter_app/views/widgets/buttons/app_icon_button.dart';
import 'package:flutter_app/views/widgets/loaders/loading_manager.dart';
import 'package:flutter_app/views/widgets/news/news_list.dart';
import 'package:flutter_app/views/widgets/news/search_bar.dart';
import 'package:provider/provider.dart';

class NewsScreens extends StatefulWidget {
  static final String id = "/news-screen";
  const NewsScreens({Key? key}) : super(key: key);

  @override
  _NewsScreensState createState() => _NewsScreensState();
}

class _NewsScreensState extends State<NewsScreens> {

  late NewsProvider _newsProvider;

  @override
  Widget build(BuildContext context) {
    _newsProvider = Provider.of<NewsProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: LoadingManager(
          isLoading: _newsProvider.isLoading,
          status: _newsProvider.state,
          onRefresh: () async {
            await _newsProvider.getNews(reset: true);
          },
          child: Column(
            children: [
              SizedBox(height: 4,),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      "Items: ${_newsProvider.news.length}",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                  AIconButton(
                    iconData: Icons.view_headline,
                    onPressed: () async {
                      TopicSearch? _temp = await showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          builder: (context){
                              return NewsSearchSheet(
                              search: _newsProvider.search,
                            );
                          });
                      if(_temp != null){
                        _newsProvider.search = _temp;
                        _newsProvider.getNews(reset: true);
                        setState(() {});
                      }
                    },
                  ),
                ],
              ),
              SizedBox(height: 4,),
              Expanded(
                child: NewsList(
                  nextPage: _newsProvider.nextPage,
                  onLazyLoad: () async {
                    await _newsProvider.getNews();
                  },
                  topics: _newsProvider.news,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
