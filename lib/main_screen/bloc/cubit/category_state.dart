part of 'category_cubit.dart';

sealed class CategoryState extends Equatable {
  const CategoryState();

  @override
  List<Object> get props => [];
}

final class CategoryInitial extends CategoryState {}

final class CategorySelected extends CategoryState {
  final int selectedIndex;

  const CategorySelected(this.selectedIndex);

  @override
  List<Object> get props => [selectedIndex];
}
