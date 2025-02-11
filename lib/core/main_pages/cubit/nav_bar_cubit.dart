import 'nav_bar_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavBarCubit extends Cubit<NavBarStates> {
  NavBarCubit() : super(NavBarInit());

  static NavBarCubit of(context) => BlocProvider.of(context);

  int currentViewIndex = 0;

  void changeView(int index) {
    currentViewIndex = index;
    _emit(NavBarInit());
  }

  bool get isStateLoading {
    return state is NavBarLoading;
  }

  void _emit(NavBarStates state) {
    if (!isClosed) {
      emit(state);
    }
  }
}
