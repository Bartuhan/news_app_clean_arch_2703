import 'package:equatable/equatable.dart';
import 'package:news_app_clean_arch_2703/features/daily_news/domain/entities/article.dart';

abstract class LocalArticlesEvent extends Equatable {
  final ArticleEntity? article;

  const LocalArticlesEvent({this.article});

  @override
  List<Object> get props => [article!];
}

class GetSavedArticles extends LocalArticlesEvent {
  const GetSavedArticles();
}

class RemoveArticles extends LocalArticlesEvent {
  const RemoveArticles(ArticleEntity article) : super(article: article);
}

class SaveArticles extends LocalArticlesEvent {
  const SaveArticles(ArticleEntity article) : super(article: article);
}
