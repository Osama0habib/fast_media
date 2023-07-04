import 'package:fast_media/authentication/presentation/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:fast_media/authentication/presentation/pages/navigation_screen.dart';
import 'package:fast_media/home/presentaion/pages/home_view.dart';
import 'package:fast_media/colors/colors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:device_preview/device_preview.dart';

import 'core/bloc_observer/bloc_observer.dart';
import 'core/services/service_locator.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((value) {
    ServiceLocator().init();
  });

  Bloc.observer = MyBlocObserver();
  runApp(
    DevicePreview(
      enabled: false,
      builder: (context) => const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (BuildContext context) =>
                sl<AuthenticationBloc>()..add(AuthenticationStarted()))
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          textTheme: GoogleFonts.robotoTextTheme(textTheme),
          colorScheme: ColorScheme.fromSeed(seedColor: kSeconderyColor),
          useMaterial3: true,
        ),
        home: const NavigationScreen(),
      ),
    );
  }
}
