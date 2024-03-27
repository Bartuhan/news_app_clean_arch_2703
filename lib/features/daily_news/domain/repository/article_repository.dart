import 'package:news_app_clean_arch_2703/core/resources/data_state.dart';
import 'package:news_app_clean_arch_2703/features/daily_news/domain/entities/article.dart';

abstract class ArticleRepository {
  Future<DataState<List<ArticleEntity>>> getNewsArticles();
}
