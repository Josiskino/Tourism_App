part of 'map_cubit.dart';

abstract class MapState extends Equatable {
  const MapState();
  
  @override
  List<Object> get props => [];
}

class MapInitial extends MapState {}

class MapLoading extends MapState {}

class MapLoaded extends MapState {
  final LatLng currentPosition;

  const MapLoaded({required this.currentPosition});

  @override
  List<Object> get props => [currentPosition];
}

class MapError extends MapState {
  final String message;

  const MapError(this.message);

  @override
  List<Object> get props => [message];
}