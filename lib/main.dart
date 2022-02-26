import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sarrafa/expense/add_expense_screen.dart';
import 'package:sarrafa/home/bloc/home_bloc.dart';
import 'package:sarrafa/util/colors.dart';
import 'package:sarrafa/util/constants.dart';
import 'package:sarrafa/util/device.dart';
import 'package:sarrafa/util/routes.dart';
import 'package:sarrafa/util/strings.dart';

import 'account/dashboard_screen.dart';
import 'home/home_screen.dart';

void main() {
  runZonedGuarded(() async {
    SimpleBlocObserver();
    runApp(
      MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => HomeBloc(),
          )
        ],
        child: App(),
      ),
    );
  }, (error, stacktrace) {
    print(error);
  });
}

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: AppColors.greyLight, //top bar color
        statusBarIconBrightness: Brightness.dark, //top bar icons
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.appTitle,
      navigatorKey: navigatorKey,
      builder: (context, child) {
        return ScrollConfiguration(
          behavior: UniformScrollBehavior(),
          child: child!,
        );
      },
      theme: ThemeData(
        primaryColor: AppColors.primary,
        backgroundColor: AppColors.greyLight,
      ),
      initialRoute: AppRoutes.home,
      routes: {
        AppRoutes.home: (context) => const DashboardScreen(),
      },
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case AppRoutes.addExpenseScreen:
            return _generateSlideInFromBottomRoute(
              destinationScreen: const AddExpenseScreen(),
              // destinationScreen: BlocProvider.value(
              //   value: BlocProvider.of<AppBloc>(context)..add(SetDifficulty(difficulty)),
              //   child: BoardScreen(
              //     gameDifficulty: difficulty,
              //   ),
              // ),
              settings: settings,
            );
        }
      },
    );
  }

  Route _generateSlideInRoute({
    required Widget destinationScreen,
    required RouteSettings settings,
  }) {
    return PageRouteBuilder(
      transitionDuration: const Duration(milliseconds: 400),
      pageBuilder: (_, __, ___) => destinationScreen,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = const Offset(1.0, 0.0);
        var end = Offset.zero;
        var curve = Curves.ease;

        var tween =
        Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
      settings: settings,
    );
  }

  Route _generateSlideInFromBottomRoute({
    required Widget destinationScreen,
    required RouteSettings settings,
  }) {
    return PageRouteBuilder(
      transitionDuration: const Duration(milliseconds: 400),
      pageBuilder: (_, __, ___) => destinationScreen,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = const Offset(0.0, 1.0);
        var end = Offset.zero;
        var curve = Curves.ease;

        var tween =
        Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
      settings: settings,
    );
  }

  Route _generateSlideInFromLeftRoute({
    required Widget destinationScreen,
    required RouteSettings settings,
  }) {
    return PageRouteBuilder(
      transitionDuration: const Duration(milliseconds: 400),
      pageBuilder: (_, __, ___) => destinationScreen,
      transitionsBuilder: (
          context,
          animation,
          secondaryAnimation,
          child,
          ) {
        var begin = const Offset(-1.0, 0.0);
        var end = Offset.zero;
        var curve = Curves.ease;

        var tween = Tween(
          begin: begin,
          end: end,
        ).chain(
          CurveTween(
            curve: curve,
          ),
        );

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
      settings: settings,
    );
  }

  Route _generateFadeInRoute({
    required Widget destinationScreen,
    required RouteSettings settings,
  }) {
    return PageRouteBuilder(
      transitionDuration: const Duration(milliseconds: 400),
      pageBuilder: (_, __, ___) => destinationScreen,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
      settings: settings,
    );
  }
}

