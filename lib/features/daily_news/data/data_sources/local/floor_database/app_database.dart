import 'dart:async';
import 'package:floor/floor.dart';
import 'package:news_app_clean_arch_2703/features/daily_news/data/data_sources/local/floor_database/DAO/article_dao.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:news_app_clean_arch_2703/features/daily_news/data/model/article.dart';
part 'app_database.g.dart';

@Database(version: 1, entities: [ArticleModel])
abstract class AppDatabase extends FloorDatabase {
  ArticleDao get articleDAO;
}
