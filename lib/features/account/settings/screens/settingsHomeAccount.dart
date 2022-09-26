import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/cli_commands.dart';
import 'package:provider/provider.dart';
import 'package:swipe_refresh/swipe_refresh.dart';
import 'package:v1douvery/NAV/mobiles/centerSearchNav.dart';
import 'package:v1douvery/common/widgets/IconButton.dart';
import 'package:v1douvery/common/widgets/iconCart.dart';
import 'package:v1douvery/constantes/global_variables.dart';
import 'package:v1douvery/features/account/settings/widgets/editarImagen.dart';
import 'package:v1douvery/provider/theme.dart';

import '../../../../provider/user_provider.dart';

class SettingsAccounts extends StatefulWidget {
  SettingsAccounts({
    Key? key,
  }) : super(key: key);

  @override
  State<SettingsAccounts> createState() => _SettingsAccountsState();
}

class _SettingsAccountsState extends State<SettingsAccounts> {
  final _controller = StreamController<SwipeRefreshState>.broadcast();

  Stream<SwipeRefreshState> get _stream => _controller.stream;

  @override
  Widget build(BuildContext context) {
    final userCartLen = context.watch<UserProvider>().user.cart.length;
    Future _delayedFuture = Future.delayed(
      const Duration(milliseconds: 100),
      () {},
    );
    void _reset() {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          transitionDuration: Duration.zero,
          pageBuilder: (_, __, ___) => SettingsAccounts(),
        ),
      );
    }
    //*ModalCart

    final currentTheme = Provider.of<ThemeProvider>(context);
    final user = Provider.of<UserProvider>(context).user;
    return Scaffold(
        backgroundColor: currentTheme.isDarkTheme()
            ? GlobalVariables.darkOFbackgroundColor
            : GlobalVariables.greyBackgroundCOlor,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(105),
          child: AppBar(
            automaticallyImplyLeading: false,
            leading: Container(
              child: CustomnIconsButton(
                icon: Icon(
                  Icons.arrow_back_ios_new,
                  size: 20,
                ),
                onPressed: () => Navigator.pop(
                  context,
                ),
              ),
            ),
            elevation: 0,
            title: FadeInLeft(
              from: 10,
              child: const Text(
                'Volver',
              ),
            ),
            actions: [
              IconCart(),
            ],
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(15),
              child: CenterSearchNav(),
            ),
            backgroundColor: Colors.blue[900],
          ),
        ),

        //SelectBody
        body: SwipeRefresh
            .material(stateStream: _stream, onRefresh: _reset, children: [
          Scrollbar(
            child: SingleChildScrollView(
              child: Column(children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 100,
                  color: currentTheme.isDarkTheme()
                      ? GlobalVariables.darkbackgroundColor
                      : GlobalVariables.backgroundColor,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: currentTheme.isDarkTheme()
                            ? GlobalVariables.darkbackgroundColor
                            : GlobalVariables.backgroundColor,
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 60,
                                      height: 60,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                          image: NetworkImage(user.images[0]),
                                          // picked file
                                          fit: BoxFit.cover,
                                        ),
                                        color: currentTheme.isDarkTheme()
                                            ? GlobalVariables
                                                .darkbackgroundColor
                                            : GlobalVariables.backgroundColor,
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 20),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            user.name.capitalize(),
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600,
                                              color: currentTheme.isDarkTheme()
                                                  ? GlobalVariables
                                                      .text2darkbackgroundColor
                                                  : GlobalVariables
                                                      .text1WhithegroundColor,
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(right: 25),
                                            child: Text(
                                              'Super Usuario',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: currentTheme
                                                          .isDarkTheme()
                                                      ? GlobalVariables
                                                          .text1darkbackgroundColor
                                                      : Colors.black45),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                child: IconButton(
                                  icon: GestureDetector(
                                      child: Icon(
                                        Icons.ios_share_outlined,
                                        color: currentTheme.isDarkTheme()
                                            ? GlobalVariables
                                                .text1darkbackgroundColor
                                            : GlobalVariables
                                                .colorTextGreylv180,
                                      ),
                                      onTap: () {}),
                                  onPressed: () {},
                                ),
                              ),
                              Container(
                                  child: PopupMenuButton(
                                icon: Icon(
                                  Icons.more_vert,
                                  color: currentTheme.isDarkTheme()
                                      ? GlobalVariables.text1darkbackgroundColor
                                      : GlobalVariables.text1WhithegroundColor,
                                ),
                                color: currentTheme.isDarkTheme()
                                    ? GlobalVariables.text1darkbackgroundColor
                                    : GlobalVariables.colorTextGreylv180,
                                itemBuilder: (context) => [
                                  PopupMenuItem(
                                    child: Text('Reportar'),
                                  ),
                                ],
                              )),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                ListitleSettings(
                  iconPrime: Icon(
                    Icons.image,
                    size: 30,
                    color: currentTheme.isDarkTheme()
                        ? GlobalVariables.text1darkbackgroundColor
                        : GlobalVariables.text1WhithegroundColor,
                  ),
                  listitle: 'Editar Imagen',
                  subtitle: 'Cambiar imagen , modificar imagen , borrar imagen',
                  iconSegund: Icon(
                    Icons.arrow_right,
                    color: currentTheme.isDarkTheme()
                        ? GlobalVariables.text1darkbackgroundColor
                        : GlobalVariables.text1WhithegroundColor,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => Subir_And_EditarImagenAccount(
                          user: user,
                        ),
                      ),
                    );
                  },
                  currentTheme: currentTheme,
                ),
                ListitleSettings(
                  iconPrime: Icon(
                    Icons.system_security_update_warning_sharp,
                    size: 30,
                    color: currentTheme.isDarkTheme()
                        ? GlobalVariables.text1darkbackgroundColor
                        : GlobalVariables.text1WhithegroundColor,
                  ),
                  listitle: 'Datos',
                  subtitle: 'Editar nombre , tipo de usuario , borrar cuenta',
                  iconSegund: Icon(
                    Icons.arrow_right,
                    color: currentTheme.isDarkTheme()
                        ? GlobalVariables.text1darkbackgroundColor
                        : GlobalVariables.text1WhithegroundColor,
                  ),
                  onPressed: () {},
                  currentTheme: currentTheme,
                )
              ]),
            ),
          )
        ]));
  }
}

class ListitleSettings extends StatelessWidget {
  final Icon iconPrime;
  final String listitle;
  final String subtitle;
  final Icon iconSegund;
  final VoidCallback onPressed;

  const ListitleSettings({
    Key? key,
    required this.iconPrime,
    required this.listitle,
    required this.subtitle,
    required this.iconSegund,
    required this.onPressed,
    required this.currentTheme,
  }) : super(key: key);

  final ThemeProvider currentTheme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
              color: currentTheme.isDarkTheme()
                  ? GlobalVariables.borderColorsDarklv10
                  : GlobalVariables.borderColorsWhithelv10,
              width: 1),
          borderRadius: BorderRadius.circular(10),
          color: currentTheme.isDarkTheme()
              ? GlobalVariables.darkbackgroundColor
              : GlobalVariables.backgroundColor,
        ),
        child: Row(
          children: [
            Container(
              width: MediaQuery.of(context).size.width / 1.1,
              height: 70,
              child: Column(
                children: [
                  ListTile(
                    leading: iconPrime,
                    title: Text(
                      listitle,
                      style: TextStyle(
                        fontSize: 17,
                        color: currentTheme.isDarkTheme()
                            ? GlobalVariables.text2darkbackgroundColor
                            : GlobalVariables.text2WhithegroundColor,
                      ),
                    ),
                    subtitle: Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 12,
                        color: currentTheme.isDarkTheme()
                            ? GlobalVariables.text1darkbackgroundColor
                            : GlobalVariables.text1WhithegroundColor,
                      ),
                    ),
                    trailing: iconSegund,
                    selected: true,
                    onTap: onPressed,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
