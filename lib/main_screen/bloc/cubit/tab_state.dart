part of 'tab_cubit.dart';

sealed class TabState extends Equatable {
  const TabState();

  @override
  List<Object> get props => [];
}

final class TabInitial extends TabState {}

final class TabSelected extends TabState {
  final int index;

  const TabSelected(this.index);

  @override
  List<Object> get props => [index];
}
