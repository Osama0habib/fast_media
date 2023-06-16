import 'package:bloc/bloc.dart';
import 'package:circular_bottom_navigation/circular_bottom_navigation.dart';
import 'package:circular_bottom_navigation/tab_item.dart';
import 'package:equatable/equatable.dart';
import 'package:fast_media/home/presentaion/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../../colors/colors.dart';
import '../pages/favorite_page.dart';
import '../pages/home_view.dart';
import '../pages/search_page.dart';
import '../pages/setting_page.dart';

part 'navigation_state.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(InitialState());

  int currentIndex = 0 ;
  CircularBottomNavigationController controller = CircularBottomNavigationController(0);
  final List<Widget> widgets = List.of([
    const HomePage(),
    const FavoritePage(),
    const SearchPage(),
    const SettingPage(),
  ]);
  List<TabItem> tabItems = List.of([
    TabItem(Icons.home_outlined, "Home", kGradient,),
    TabItem(Icons.favorite_border_outlined, "Search", kGradient,),
    TabItem(Icons.search_outlined, "Reports", kGradient,),
    TabItem(Icons.settings_outlined, "Notifications", kGradient),
  ]);

  void selectPage(int page){
    currentIndex = page;
    controller.value = currentIndex;
    emit(ChangeIndexState());
  }
}
