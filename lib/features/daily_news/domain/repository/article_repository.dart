import 'package:news_app_clean_arch_2703/core/resources/data_state.dart';
import 'package:news_app_clean_arch_2703/features/daily_news/domain/entities/article.dart';

abstract class ArticleRepository {
  // API Methods
  Future<DataState<List<ArticleEntity>>> getNewsArticles();

  // Database methods
  Future<List<ArticleEntity>> getSavedArticles();

  Future<void> saveArticles(ArticleEntity article);

  Future<void> removeArticles(ArticleEntity article);
}
