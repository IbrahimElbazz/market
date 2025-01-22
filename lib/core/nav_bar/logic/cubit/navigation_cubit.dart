import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market/core/nav_bar/logic/cubit/navigation_state.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(const NavigationState.initial());
  int currentIndex = 0;
  void chaneVeiws(int index) {
    currentIndex = index;
    emit(NavigationState.changeIndex(index));
  }
}
