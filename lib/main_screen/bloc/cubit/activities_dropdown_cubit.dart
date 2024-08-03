import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'activities_dropdown_state.dart';

class ActivitiesDropdownCubit extends Cubit<ActivitiesDropdownState> {
  ActivitiesDropdownCubit() : super(ActivitiesDropdownClosed());

  void toggle() {
    if (state is ActivitiesDropdownClosed) {
      emit(ActivitiesDropdownOpen());
    } else {
      emit(ActivitiesDropdownClosed());
    }
  }
}
