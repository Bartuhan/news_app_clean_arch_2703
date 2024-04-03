import 'package:floor/floor.dart';
import 'package:news_app_clean_arch_2703/features/daily_news/data/model/article.dart';

@dao
abstract class ArticleDao {
  @Insert()
  Future<void> insertArticle(ArticleModel article);

  @delete
  Future<void> deleteArticle(ArticleModel article);

  @Query('Select * From article')
  Future<List<ArticleModel>> getArticles();
}
