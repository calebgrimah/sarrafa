import 'package:collection/src/iterable_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sarrafa/expense/expenses_screen.dart';
import 'package:sarrafa/home/home_screen.dart';
import 'package:sarrafa/settings/settings_screen.dart';
import 'package:sarrafa/statistics/stats_screen.dart';
import 'package:sarrafa/util/colors.dart';
import 'package:sarrafa/util/device.dart';
import 'package:sarrafa/util/routes.dart';
import 'package:sarrafa/util/strings.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  int _currentPageIndex = 0;
  double factor = 1;

  List<TabNavigationItem> get items => [
        TabNavigationItem(
          page: const HomeScreen(),
          icon: const Icon(Icons.dashboard_rounded),
          title: AppStrings.home,
        ),
        TabNavigationItem(
          page: const StatisticsScreen(),
          icon: const Icon(Icons.insert_chart_rounded),
          title: AppStrings.statistics,
        ),
        TabNavigationItem(
          page: const ExpenseScreen(),
          icon: const Icon(Icons.account_balance_wallet_rounded),
          title: AppStrings.expense,
        ),
        TabNavigationItem(
          page: const SettingsScreen(),
          icon: const Icon(Icons.account_box),
          title: AppStrings.settings,
        ),
      ];

  @override
  Widget build(BuildContext context) {
    double factor = ScreenSizeHelper(context).factor;
    return Scaffold(
      body: SafeArea(
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 200),
          child: items.elementAt(_currentPageIndex).page,
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: 48.0 * factor, vertical: 8 * factor),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ...items.mapIndexed((index, element) {
                return _bottomAppBarWidget(element, index);
              })
            ],
          ),
        ),
        color: AppColors.white,
        shape: const CircularNotchedRectangle(),
      ),
      // floatingActionButtonLocation:
      //     FloatingActionButtonLocation.miniCenterFloat,
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     Navigator.pushNamed(context, AppRoutes.board);
      //   },
      //   tooltip: AppStrings.expense,
      //   child: Icon(
      //     Icons.add,
      //     size: 32 * factor,
      //   ),
      //   backgroundColor: AppColors.primary,
      //   elevation: 1,
      // ),
    );
  }

  Widget _bottomAppBarWidget(TabNavigationItem item, int index) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          icon: item.icon,
          color: _currentPageIndex == index
              ? AppColors.primary
              : AppColors.primary.withOpacity(.3),
          onPressed: () {
            setState(
              () {
                _currentPageIndex = index;
              },
            );
          },
        ),
        Visibility(
          visible: _currentPageIndex == index ? true : false,
          child: Padding(
            padding: EdgeInsets.only(bottom: 12.0 * factor),
            child: Container(
              width: 16 * factor,
              height: 4 * factor,
              decoration: BoxDecoration(
                  color: _currentPageIndex == index
                      ? AppColors.primary
                      : AppColors.primary.withOpacity(.1),
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(8 * factor)),
            ),
          ),
        )
      ],
    );
  }
}

class TabNavigationItem {
  final Widget page;
  final String title;
  final Widget icon;

  TabNavigationItem({
    required this.page,
    required this.title,
    required this.icon,
  });
}
