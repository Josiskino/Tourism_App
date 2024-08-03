part of 'activities_dropdown_cubit.dart';

sealed class ActivitiesDropdownState extends Equatable {
  const ActivitiesDropdownState();

  @override
  List<Object> get props => [];
}

final class ActivitiesDropdownInitial extends ActivitiesDropdownState {}

final class ActivitiesDropdownClosed extends ActivitiesDropdownState {}

final class ActivitiesDropdownOpen extends ActivitiesDropdownState {}