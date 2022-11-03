import 'package:flutter/material.dart';

class CusAppBar extends StatefulWidget implements PreferredSizeWidget {
  String pageTitle;

  CusAppBar({super.key, required this.pageTitle});
  @override
  Size get preferredSize => const Size.fromHeight(56);
  @override
  State<CusAppBar> createState() => _CusAppBarState();
}

class _CusAppBarState extends State<CusAppBar> {
  @override
  Widget build(BuildContext context) {
    String pageTitle = widget.pageTitle;

    return AppBar(
      title: Text(
        pageTitle,
        style: const TextStyle(
          fontFamily: 'Poppins',
          color: Colors.white,
          fontSize: 22,
        ),
      ),
      flexibleSpace: FlexibleSpaceBar(
        background: Image.asset(
          'assets/appbarlogo.png',
          fit: BoxFit.cover,
        ),
      ),
      centerTitle: true,
      elevation: 0,
    );
  }
}
