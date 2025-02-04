import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/ui/Home_Screen/home_screen.dart';
import 'package:graduation_project/ui/home_screen/cubit/home_state.dart';

class HomeScreenViewModel extends Cubit<HomeStates> {
  HomeScreenViewModel() : super(HomeInitialState());
  int currentindex = 0;
}
