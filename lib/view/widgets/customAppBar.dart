import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:thimblestock/controller/login.dart';
import 'package:thimblestock/view/pages/loginPage.dart';

class CusAppBar extends StatefulWidget implements PreferredSizeWidget {
  String pageTitle;

  CusAppBar({super.key, required this.pageTitle});
  @override
  Size get preferredSize => const Size.fromHeight(56);
  @override
  State<CusAppBar> createState() => _CusAppBarState();
}

class _CusAppBarState extends State<CusAppBar> {
  final _pref = SharedPreferences.getInstance();
  final _loginController = LoginController();
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
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.exit_to_app),
          onPressed: () async {
            var nav = Navigator.of(context);
            //cerrar sesion en auth
            _loginController.logout();

            // limpiar preferencias
            var pref = await _pref;
            pref.remove("uid");
            pref.remove("name");
            pref.remove("email");
            pref.remove("admin");

            //volver a la pagina de login
            nav.pushReplacement(
              MaterialPageRoute(builder: (context) => LoginWidget()),
            );
          },
        )
      ],
      centerTitle: true,
      elevation: 0,
    );
  }
}
