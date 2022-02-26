import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sarrafa/util/colors.dart';
import 'package:sarrafa/util/constants.dart';
import 'package:sarrafa/util/device.dart';
import 'package:sarrafa/util/strings.dart';

class AddExpenseScreen extends StatefulWidget {
  const AddExpenseScreen({Key? key}) : super(key: key);

  @override
  _AddExpenseScreenState createState() => _AddExpenseScreenState();
}

class _AddExpenseScreenState extends State<AddExpenseScreen> {
  @override
  Widget build(BuildContext context) {
    double factor = ScreenSizeHelper(context).factor;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0 * factor),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0 * factor),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppStrings.addExpense,
                        style: GoogleFonts.muli(
                            color: AppColors.primary,
                            fontSize: FontSizes.heading,
                            fontWeight: FontWeight.w900),
                      ),
                      ButtonTheme(
                        minWidth: 0,
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        height: 0,
                        child: MaterialButton(
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          clipBehavior: Clip.hardEdge,
                          color: AppColors.primary,
                          padding: EdgeInsets.all(4 * factor),
                          shape: const CircleBorder(),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Icon(
                            Icons.close,
                            color: AppColors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 24.0 * factor),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            AppStrings.amount,
                            style: GoogleFonts.muli(
                                color: AppColors.greyDark,
                                fontWeight: FontWeight.w900,
                                fontSize: FontSizes.body),
                          ),
                        ],
                      ),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        cursorHeight: 28 * factor,
                        decoration: InputDecoration(
                          focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: AppColors.primary)
                          ),
                          hintText: AppStrings.enter,
                          hintStyle: GoogleFonts.muli(
                              color: AppColors.primary.withOpacity(.8),
                              fontSize: FontSizes.headingLarge,
                              fontWeight: FontWeight.w700),
                          suffixIcon: const Icon(
                            Icons.attach_money,
                            color: AppColors.primary,
                          ),
                          focusColor: AppColors.primary,
                        ),
                        expands: false,
                        style: GoogleFonts.muli(
                            color: AppColors.primary,
                            fontSize: FontSizes.headingLarge,
                            fontWeight: FontWeight.w700
                        ),

                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
