import 'package:flutter/material.dart';
import 'package:tur/shared/style/colors.dart';

PreferredSize myAppBar({
  required String tittle,
  Widget? leading,
  Widget? action,
}) {
  return PreferredSize(
    preferredSize: Size.fromHeight(70.0),
    child: SafeArea(
      child: Padding(
        padding: EdgeInsets.only(top: 8.0),
        child: AppBar(
          centerTitle: true,
          title: Text(
            tittle,
          ),
          backgroundColor: backgroundColor,
          elevation: 0,
          automaticallyImplyLeading: false,
          leading: leading,
          actions: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: action,
            ),
          ],
        ),
      ),
    ),
  );
}
