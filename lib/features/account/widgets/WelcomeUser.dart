import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_native_splash/cli_commands.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';
import 'package:v1douvery/common/widgets/IconButton.dart';
import 'package:v1douvery/common/widgets/loader.dart';
import 'package:v1douvery/constantes/global_variables.dart';
import 'package:v1douvery/features/account/services/accountServices.dart';
import 'package:v1douvery/features/account/settings/screens/settingsHomeAccount.dart';
import 'package:v1douvery/features/search/vista/search_screen.dart';
import 'package:v1douvery/models/user.dart';
import 'package:v1douvery/provider/user_provider.dart';

import '../../../provider/theme.dart';

class WelcomeUser extends StatefulWidget {
  const WelcomeUser({Key? key}) : super(key: key);

  @override
  State<WelcomeUser> createState() => _WelcomeUserState();
}

class _WelcomeUserState extends State<WelcomeUser> {
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
    final user = Provider.of<UserProvider>(context).user;
    final currentTheme = Provider.of<ThemeProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: currentTheme.isDarkTheme()
              ? GlobalVariables.darkbackgroundColor
              : GlobalVariables.rgbGradient,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(38, 38, 38, 0.4),
              offset: const Offset(
                0.0,
                5.0,
              ),
              blurRadius: 2.0,
              spreadRadius: 0.1,
            ), //BoxShadow
            //BoxShadow
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              padding: EdgeInsets.all(10),
              child: Row(
                children: [
                  Text(
                    'Welcome ',
                    style: TextStyle(
                      fontSize: 20,
                      color: GlobalVariables.colorTextWhiteLight,
                    ),
                  ),
                  Container(
                    width: 100,
                    child: userList == null
                        ? Center(
                            child: LoadingAnimationWidget.staggeredDotsWave(
                              color: GlobalVariables.colorTextGreylv15,
                              size: 30,
                            ),
                          )
                        : Text(
                            userList!.name.capitalize(),
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: GlobalVariables.colorTextWhiteLight,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                  ),
                ],
              ),
            ),
            Container(
              child: CustomnIconsButton(
                icon: Icon(
                  IconlyLight.setting,
                  color: GlobalVariables.colorTextWhiteLight,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SettingsAccounts(),
                    ),
                  );
                },
              ),
            ),
            Container(
              child: CustomnIconsButton(
                icon: Icon(
                  IconlyLight.bag,
                  color: GlobalVariables.colorTextWhiteLight,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SearchPage(),
                    ),
                  );
                },
              ),
            ),
            Container(
              child: CustomnIconsButton(
                icon: Icon(
                  IconlyLight.logout,
                  color: GlobalVariables.colorTextWhiteLight,
                ),
                onPressed: () {
                  AccountServices().logOut(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
