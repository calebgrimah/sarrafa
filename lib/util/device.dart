import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'colors.dart';

class ScreenSizeHelper {
  static const _SmallFactor = 0.9;
  static const _XSmallFactor = 0.8;
  static const _XLargeFactor = 1.2;

  static ScreenSizeHelper? _instance;

  double _factor = 1;

  factory ScreenSizeHelper(BuildContext context) {
    if (_instance != null) {
      return _instance!;
    }

    _instance = ScreenSizeHelper._internal(context);
    return _instance!;
  }

  ScreenSizeHelper._internal(BuildContext context) {
    if (isSmall(context)) {
      _factor = _SmallFactor;
    }
    if (isXSmall(context)) {
      _factor = _XSmallFactor;
    }
    if (isXLarge(context)) {
      _factor = _XLargeFactor;
    }
  }

  double get factor {
    return _factor;
  }

  static bool isSmall(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return mediaQuery.size.width < 370;
  }

  static bool isXSmall(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return mediaQuery.size.width < 350;
  }

  static bool isXLarge(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return mediaQuery.size.width > 750;
  }
}


/// This helps us do something in response to Transitions,
/// we are just logging errors and transitions in this case
/// * https://bloclibrary.dev/#/coreconcepts?id=blocdelegate
class SimpleBlocObserver extends BlocObserver {

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(transition);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    print(error);
  }
}

Scaffold appScaffold(
    {Key? scaffoldKey,
      Widget? drawer,
      required Widget body,
      Widget? bottomNavigationBar}) {
  return Scaffold(
    key: scaffoldKey,
    drawer: drawer,
    backgroundColor: AppColors.greyLight,
    body: body,
    bottomNavigationBar: bottomNavigationBar,
  );
}
