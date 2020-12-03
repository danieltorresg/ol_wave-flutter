import 'package:flutter/material.dart';
import 'package:old_wave_flutter/src/constants/constants.dart';

class AppBarApp extends StatelessWidget implements PreferredSizeWidget {
  final AppBar appBar;

  const AppBarApp({Key key, this.appBar}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Image.asset(
        'assets/oldwave-logo-horizontal.png',
        fit: BoxFit.cover,
        scale: 2,
      ),
      backgroundColor: Colors.white,
      leading: Builder(
        builder: (BuildContext context) {
          return IconButton(
            icon: const Icon(Icons.menu),
            color: purpleMainColor,
            onPressed: () {},
          );
        },
      ),
      actions: <Widget>[
        IconButton(
          icon: Image.asset('assets/user_icon.png'),
          color: purpleMainColor,
          onPressed: () {
            print('Click search');
          },
        ),
        IconButton(
          icon: Icon(Icons.shopping_cart),
          color: blueComplementaryColor,
          onPressed: () {
            print('Click start');
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => new Size.fromHeight(appBar.preferredSize.height);
}
