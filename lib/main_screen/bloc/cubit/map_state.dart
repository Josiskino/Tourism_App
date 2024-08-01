part of 'map_cubit.dart';

sealed class MapState extends Equatable {
  const MapState();

  @override
  List<Object> get props => [];
}

final class MapInitial extends MapState {}

class MapLoading extends MapState {}

class MapLoaded extends MapState {
  final LatLng currentPosition;

  const MapLoaded({required this.currentPosition});

  @override
  List<Object> get props => [currentPosition];
}