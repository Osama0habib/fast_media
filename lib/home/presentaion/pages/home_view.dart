import 'package:circular_bottom_navigation/circular_bottom_navigation.dart';
import 'package:fast_media/colors/colors.dart';
import 'package:fast_media/home/presentaion/bloc/home_bloc.dart';
import 'package:fast_media/home/presentaion/bloc/navigation_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/services/service_locator.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // FirebaseAuth.instance.signOut();

    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeBloc>(
          create: (context) => sl<HomeBloc>()..add(const GetHomeMoviesEvent()),
        ),
        BlocProvider<NavigationCubit>(create: (context) => NavigationCubit()),
      ],
      child: BlocBuilder<NavigationCubit, NavigationState>(
        builder: (ctx, state) {
          print("building");
          final cubit = ctx.read<NavigationCubit>();
          // final cubit = BlocProvider.of<NavigationCubit>(context);
          return
            Scaffold(
              extendBody: true,
              body: cubit.widgets[cubit.currentIndex],
              bottomNavigationBar: CircularBottomNavigation(
                cubit.tabItems,
                controller: cubit.controller,
                selectedPos: cubit.currentIndex,
                borderRadius:
                const BorderRadius.vertical(top: Radius.circular(20)),
                barHeight: 74,
                circleSize: 64,
                iconsSize: 20,
                selectedIconColor: kSeconderyColor,
                circleStrokeWidth: 0,
                backgroundBoxShadow: null,
                normalIconColor: Colors.white,
                barBackgroundGradient: const LinearGradient(
                  colors: [
                    Color(0xff06081B),
                    Color(0xff4B3675),
                  ],
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,

                  stops: [1.0, 1.5],
                  // transform: GradientRotation(1z)
                ),
                selectedCallback: (int? selectedPos) {
                  if (selectedPos != null) {
                    cubit.selectPage(selectedPos);
                  }
                },
              ),
            );
        },
      ),
    );
  }
}
