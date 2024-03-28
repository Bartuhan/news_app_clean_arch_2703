import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_clean_arch_2703/features/daily_news/domain/usecases/get_saved_article.dart';
import 'package:news_app_clean_arch_2703/features/daily_news/domain/usecases/remove_article.dart';
import 'package:news_app_clean_arch_2703/features/daily_news/domain/usecases/save_article.dart';
import 'package:news_app_clean_arch_2703/features/daily_news/presentation/bloc/article/local/local_article_event.dart';
import 'package:news_app_clean_arch_2703/features/daily_news/presentation/bloc/article/local/local_article_state.dart';

class LocalArticlesBloc extends Bloc<LocalArticlesEvent, LocalArticleState> {
  final GetSavedArticleUseCase _getSavedArticleUseCase;
  final SaveArticleUseCase _saveArticleUseCase;
  final RemoveArticleUseCase _removeArticleUseCase;

  LocalArticlesBloc(
    this._getSavedArticleUseCase,
    this._saveArticleUseCase,
    this._removeArticleUseCase,
  ) : super(const LocalArticlesLoading()) {
    on<GetSavedArticles>(onGetSavedArticles);
    on<RemoveArticles>(onRemoveArticle);
    on<SaveArticles>(onSaveArticle);
  }

  void onGetSavedArticles(GetSavedArticles event, Emitter<LocalArticleState> emit) async {
    final articles = await _getSavedArticleUseCase();
    emit(LocalArticlesDone(articles));
  }

  void onRemoveArticle(RemoveArticles removedArticles, Emitter<LocalArticleState> emit) async {
    await _removeArticleUseCase(params: removedArticles.article);
    final articles = await _getSavedArticleUseCase();
    emit(LocalArticlesDone(articles));
  }

  void onSaveArticle(SaveArticles saveArticles, Emitter<LocalArticleState> emit) async {
    await _saveArticleUseCase(params: saveArticles.article);
    final articles = await _getSavedArticleUseCase();
    emit(LocalArticlesDone(articles));
  }
}
