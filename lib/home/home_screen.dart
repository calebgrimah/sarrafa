import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:sarrafa/main.dart';
import 'package:sarrafa/util/colors.dart';
import 'package:sarrafa/util/constants.dart';
import 'package:sarrafa/util/device.dart';
import 'package:collection/collection.dart';
import 'package:sarrafa/util/routes.dart';
import 'package:sarrafa/util/strings.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    double factor = ScreenSizeHelper(context).factor;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 16.0 * factor),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height / 2,
                  child: PageView(
                    padEnds: false,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0 * factor),
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16 * factor)),
                          child: Column(
                            children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 32.0 * factor,
                                          vertical: 16 * factor),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            AppStrings.september,
                                            style: GoogleFonts.muli(
                                              fontSize: FontSizes.heading,
                                              fontWeight: FontWeight.bold,
                                              color: AppColors.primary,
                                            ),
                                          ),
                                          Icon(
                                            Icons.calendar_today,
                                            size: 18 * factor,
                                          )
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.only(top: 24.0 * factor),
                                      child: CircularPercentIndicator(
                                        animation: true,
                                        radius: 198 * factor,
                                        lineWidth: 42.0 * factor,
                                        percent: 0.5,
                                        center: Text(
                                          "50%",
                                          style: GoogleFonts.muli(
                                              fontSize: FontSizes.body,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        progressColor: AppColors.primary,
                                        arcType: ArcType.HALF,
                                        arcBackgroundColor: AppColors.greyLight,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "10000\$",
                                    style: GoogleFonts.muli(
                                      fontSize: FontSizes.bodyLarge,
                                      color: AppColors.primary,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 4.0 * factor),
                                    child: Text(
                                      "/",
                                      style: GoogleFonts.muli(
                                          fontSize: FontSizes.bodyLarge,
                                          color: AppColors.primary
                                              .withOpacity(.5)),
                                    ),
                                  ),
                                  Text(
                                    "20000\$",
                                    style: GoogleFonts.muli(
                                        fontSize: FontSizes.bodyLarge,
                                        fontWeight: FontWeight.bold,
                                        color:
                                            AppColors.primary.withOpacity(.5)),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 24.0 * factor),
                                child: OutlinedButton(
                                  onPressed: () {},
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 24.0 * factor),
                                    child: Text(
                                      AppStrings.editBudget,
                                      style: GoogleFonts.muli(
                                        color: AppColors.primary,
                                        fontSize: FontSizes.body,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0 * factor),
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16 * factor)),
                          child: Column(
                            children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 32.0 * factor,
                                          vertical: 16 * factor),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            AppStrings.september,
                                            style: GoogleFonts.muli(
                                              fontSize: FontSizes.heading,
                                              fontWeight: FontWeight.bold,
                                              color: AppColors.primary,
                                            ),
                                          ),
                                          Icon(
                                            Icons.calendar_today,
                                            size: 18 * factor,
                                          )
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.only(top: 24.0 * factor),
                                      child: CircularPercentIndicator(
                                        radius: 198 * factor,
                                        lineWidth: 42.0 * factor,
                                        percent: 0.5,
                                        center: Text(
                                          "50%",
                                          style: GoogleFonts.muli(
                                              fontSize: FontSizes.body,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        progressColor: AppColors.primary,
                                        arcType: ArcType.HALF,
                                        arcBackgroundColor: AppColors.greyLight,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "10000\$",
                                    style: GoogleFonts.muli(
                                      fontSize: FontSizes.bodyLarge,
                                      color: AppColors.primary,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 4.0 * factor),
                                    child: Text(
                                      "/",
                                      style: GoogleFonts.muli(
                                          fontSize: FontSizes.bodyLarge,
                                          color: AppColors.primary
                                              .withOpacity(.5)),
                                    ),
                                  ),
                                  Text(
                                    "20000\$",
                                    style: GoogleFonts.muli(
                                        fontSize: FontSizes.bodyLarge,
                                        fontWeight: FontWeight.bold,
                                        color:
                                            AppColors.primary.withOpacity(.5)),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 24.0 * factor),
                                child: OutlinedButton(
                                  onPressed: () {},
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 24.0 * factor),
                                    child: Text(
                                      AppStrings.editBudget,
                                      style: GoogleFonts.muli(
                                        color: AppColors.primary,
                                        fontSize: FontSizes.body,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0 * factor),
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16 * factor)),
                          child: Column(
                            children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 32.0 * factor,
                                          vertical: 16 * factor),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            AppStrings.september,
                                            style: GoogleFonts.muli(
                                              fontSize: FontSizes.heading,
                                              fontWeight: FontWeight.bold,
                                              color: AppColors.primary,
                                            ),
                                          ),
                                          Icon(
                                            Icons.calendar_today,
                                            size: 18 * factor,
                                          )
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.only(top: 24.0 * factor),
                                      child: CircularPercentIndicator(
                                        radius: 198 * factor,
                                        lineWidth: 42.0 * factor,
                                        percent: 0.5,
                                        center: Text(
                                          "50j%",
                                          style: GoogleFonts.muli(
                                              fontSize: FontSizes.body,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        progressColor: AppColors.primary,
                                        arcType: ArcType.HALF,
                                        arcBackgroundColor: AppColors.greyLight,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "10000\$",
                                    style: GoogleFonts.muli(
                                      fontSize: FontSizes.bodyLarge,
                                      color: AppColors.primary,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 4.0 * factor),
                                    child: Text(
                                      "/",
                                      style: GoogleFonts.muli(
                                          fontSize: FontSizes.bodyLarge,
                                          color: AppColors.primary
                                              .withOpacity(.5)),
                                    ),
                                  ),
                                  Text(
                                    "20000\$",
                                    style: GoogleFonts.muli(
                                        fontSize: FontSizes.bodyLarge,
                                        fontWeight: FontWeight.bold,
                                        color:
                                            AppColors.primary.withOpacity(.5)),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 24.0 * factor),
                                child: OutlinedButton(
                                  onPressed: () {},
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 24.0 * factor),
                                    child: Text(
                                      AppStrings.editBudget,
                                      style: GoogleFonts.muli(
                                        color: AppColors.primary,
                                        fontSize: FontSizes.body,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Spacer(),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 32 * factor),
                child: Column(
                  children: [
                    FloatingActionButton(
                      onPressed: () {
                        Navigator.pushNamed(context, AppRoutes.addExpenseScreen);
                      },
                      child: const Icon(Icons.add),
                      backgroundColor: AppColors.primary,
                      elevation: 3,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 16.0 * factor),
                      child: Text(
                        AppStrings.addExpense,
                        style: GoogleFonts.muli(
                            fontSize: FontSizes.body,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primary),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
