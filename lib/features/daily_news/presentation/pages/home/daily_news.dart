import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_clean_arch_2703/features/daily_news/domain/entities/article.dart';
import 'package:news_app_clean_arch_2703/features/daily_news/presentation/bloc/article/remote/remote_article_block.dart';
import 'package:news_app_clean_arch_2703/features/daily_news/presentation/bloc/article/remote/remote_article_state.dart';
import 'package:news_app_clean_arch_2703/features/daily_news/presentation/pages/article_details/article_detail.dart';
import 'package:news_app_clean_arch_2703/features/daily_news/presentation/pages/saved_articles/saved_article.dart';
import 'package:news_app_clean_arch_2703/features/daily_news/presentation/widgets/article_tile.dart';

class DailyNews extends StatelessWidget {
  const DailyNews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(context),
      body: _buildBody(),
    );
  }

  _buildAppbar(BuildContext context) {
    return AppBar(
      title: const Text(
        'Daily News',
        style: TextStyle(color: Colors.black),
      ),
      actions: [
        GestureDetector(
          onTap: () => _onShowSavedArticlesViewTapped(context),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 14),
            child: Icon(Icons.bookmark),
          ),
        )
      ],
    );
  }

  _buildBody() {
    return BlocBuilder<RemoteArticlesBloc, RemoteArticleState>(
      builder: (context, state) {
        if (state is RemoteArticleLoading) {
          return const Center(child: CupertinoActivityIndicator());
        }
        if (state is RemoteArticleError) {
          return const Center(child: Icon(Icons.refresh));
        }
        if (state is RemoteArticleDone) {
          return ListView.builder(
            itemCount: state.articles!.length,
            itemBuilder: (context, index) {
              return ArticleWidget(
                article: state.articles![index],
                onArticlePressed: (article) => _onArticlePressed(context, article),
              );
            },
          );
        }
        return const SizedBox();
      },
    );
  }

  _onArticlePressed(BuildContext context, ArticleEntity article) {
    //Navigator.pushNamed(context, '/ArticleDetails', arguments: article);
    Navigator.push(context, MaterialPageRoute(builder: (context) => ArticleDetailsView(article: article)));
  }

  _onShowSavedArticlesViewTapped(BuildContext context) {
    //Navigator.pushNamed(context, 'SavedArticles');
    Navigator.push(context, MaterialPageRoute(builder: (context) => const SavedArticles()));
  }
}
