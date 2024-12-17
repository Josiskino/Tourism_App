part of 'home_page_bloc.dart';

abstract class HomePageEvent extends Equatable {
  const HomePageEvent();

  @override
  List<Object> get props => [];
}

class LoadHomePageDataEvent extends HomePageEvent {
  const LoadHomePageDataEvent();
}

class RefreshHomePageDataEvent extends HomePageEvent {
  const RefreshHomePageDataEvent();
}