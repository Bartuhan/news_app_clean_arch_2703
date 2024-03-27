import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_clean_arch_2703/core/resources/data_state.dart';
import 'package:news_app_clean_arch_2703/features/daily_news/domain/usecases/get_article.dart';
import 'package:news_app_clean_arch_2703/features/daily_news/presentation/bloc/article/remote/remote_article_event.dart';
import 'package:news_app_clean_arch_2703/features/daily_news/presentation/bloc/article/remote/remote_article_state.dart';

class RemoteArticlesBloc extends Bloc<RemoteArticleEvent, RemoteArticleState> {
  final GetArticleUseCase _getArticleUseCase;

  RemoteArticlesBloc(this._getArticleUseCase) : super(const RemoteArticleLoading()) {
    on<GetArticles>(onGetArticles);
  }

  void onGetArticles(GetArticles event, Emitter<RemoteArticleState> emit) async {
    final dataState = await _getArticleUseCase();

    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(RemoteArticleDone(dataState.data!));
    }

    if (dataState is DataFailed) {
      emit(RemoteArticleError(dataState.error!));
    }
  }
}
