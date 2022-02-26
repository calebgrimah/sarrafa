import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sarrafa/util/colors.dart';

class ExpenseScreen extends StatefulWidget {
  const ExpenseScreen({Key? key}) : super(key: key);

  @override
  _ExpenseScreenState createState() => _ExpenseScreenState();
}

class _ExpenseScreenState extends State<ExpenseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Text(
            "Expense Screen",
            style: GoogleFonts.muli(color: AppColors.blue),
          ),
        ),
      ),
    );
  }
}
