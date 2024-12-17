import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/params/params.dart';
import '../../domain/entities/category.dart';
import '../../domain/entities/tourism_site.dart';
import '../../domain/usecases/home_page_usecases.dart';

part 'home_page_event.dart';
part 'home_page_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  final HomePageUseCases homePageUseCases;

  HomePageBloc({required this.homePageUseCases}) : super(const HomePageState()) {
    on<LoadHomePageDataEvent>(_onLoadHomePageData);
    on<RefreshHomePageDataEvent>(_onRefreshHomePageData);
  }

  Future<void> _onLoadHomePageData(
    LoadHomePageDataEvent event, 
    Emitter<HomePageState> emit
  ) async {
    // If already loaded, don't reload
    if (state.status == HomePageStatus.loaded) return;

    emit(state.copyWith(status: HomePageStatus.loading));

    final result = await homePageUseCases(NoParams());

    result.fold(
      (failure) => emit(state.copyWith(
        status: HomePageStatus.error,
        errorMessage: failure.message
      )), 
      (data) => emit(state.copyWith(
        status: HomePageStatus.loaded,
        categories: data.categories,
        recentSites: data.recentSites
      ))
    );
  }

  Future<void> _onRefreshHomePageData(
    RefreshHomePageDataEvent event, 
    Emitter<HomePageState> emit
  ) async {
    emit(const HomePageState(status: HomePageStatus.loading));

    final result = await homePageUseCases(NoParams());

    result.fold(
      (failure) => emit(state.copyWith(
        status: HomePageStatus.error,
        errorMessage: failure.message
      )), 
      (data) => emit(state.copyWith(
        status: HomePageStatus.loaded,
        categories: data.categories,
        recentSites: data.recentSites
      ))
    );
  }
}