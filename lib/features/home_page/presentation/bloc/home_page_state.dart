part of 'home_page_bloc.dart';

enum HomePageStatus { initial, loading, loaded, error }

class HomePageState extends Equatable {
  final HomePageStatus status;
  final List<Category> categories;
  final List<TourismSite> recentSites;
  final String? errorMessage;

  const HomePageState({
    this.status = HomePageStatus.initial,
    this.categories = const [],
    this.recentSites = const [],
    this.errorMessage,
  });

  HomePageState copyWith({
    HomePageStatus? status,
    List<Category>? categories,
    List<TourismSite>? recentSites,
    String? errorMessage,
  }) {
    return HomePageState(
      status: status ?? this.status,
      categories: categories ?? this.categories,
      recentSites: recentSites ?? this.recentSites,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, categories, recentSites, errorMessage];
}