import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_native_splash/cli_commands.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:v1douvery/common/widgets/loader.dart';

import 'package:v1douvery/constantes/global_variables.dart';
import 'package:v1douvery/features/account/services/accountServices.dart';
import 'package:v1douvery/features/account/widgets/IconoDePerfil.dart';
import 'package:v1douvery/features/search/vista/search_screen.dart';
import 'package:v1douvery/models/user.dart';
import 'package:v1douvery/provider/user_provider.dart';

import '../../../provider/theme.dart';

class PerfilUsuario extends StatefulWidget {
  const PerfilUsuario({Key? key}) : super(key: key);

  @override
  State<PerfilUsuario> createState() => _PerfilUsuarioState();
}

class _PerfilUsuarioState extends State<PerfilUsuario> {
  User? userList;

  final AccountServices accountServices = AccountServices();

  @override
  void initState() {
    super.initState();
    fetchUser();
  }

  void fetchUser() async {
    userList = await accountServices.fetchUser(
      context: context,
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);
    List<User>? prList;
    final currentTheme = Provider.of<ThemeProvider>(context);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: currentTheme.isDarkTheme()
                  ? GlobalVariables.darkbackgroundColor
                  : GlobalVariables.backgroundColor,
            ),
            child: userList == null
                ? const Loader()
                : Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                IconoDePerfil(),
                                const SizedBox(
                                  width: 20,
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 20),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        userList!.name.capitalize(),
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400,
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
                                              color: currentTheme.isDarkTheme()
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
                                      ? GlobalVariables.text1darkbackgroundColor
                                      : GlobalVariables.colorTextGreylv180,
                                ),
                                onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SearchPage(),
                                  ),
                                ),
                              ),
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
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                width: 100,
                                height: 35,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: currentTheme.isDarkTheme()
                                      ? GlobalVariables.darkOFbackgroundColor
                                      : Color(0xffe6f2ff),
                                ),
                                child: TextButton(
                                  child: Text(
                                    "Informacion",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        letterSpacing: 0.5,
                                        fontSize: 14,
                                        color: currentTheme.isDarkTheme()
                                            ? GlobalVariables
                                                .text1darkbackgroundColor
                                            : Color.fromARGB(255, 5, 68, 177)),
                                  ),
                                  onPressed: () async {},
                                ),
                              ),
                              Container(
                                width: 100,
                                height: 35,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: TextButton(
                                  child: Text(
                                    "Contactos",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      letterSpacing: 0.5,
                                      fontSize: 15,
                                      color: currentTheme.isDarkTheme()
                                          ? GlobalVariables
                                              .text1darkbackgroundColor
                                          : GlobalVariables
                                              .text1WhithegroundColor,
                                    ),
                                  ),
                                  onPressed: () async {},
                                ),
                              ),
                              Container(
                                width: 100,
                                height: 35,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: TextButton(
                                  child: Text(
                                    "Report",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      letterSpacing: 0.5,
                                      fontSize: 15,
                                      color: currentTheme.isDarkTheme()
                                          ? GlobalVariables
                                              .text1darkbackgroundColor
                                          : GlobalVariables
                                              .text1WhithegroundColor,
                                    ),
                                  ),
                                  onPressed: () async {},
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
      ],
    );
  }
}
