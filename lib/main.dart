import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:v1douvery/provider/theme.dart';
import 'package:v1douvery/provider/user_provider.dart';
import 'package:v1douvery/router.dart';

import 'features/admin/responsive/Admin_responsive_layaout.dart';
import 'features/auth/services/auth_service.dart';
import 'features/home/responsive/responsive_layaout.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AuthService authService = AuthService();

  @override
  void initState() {
    super.initState();
    authService.getUserData(context);
    getCurrentAppTheme();
  }

  ThemeProvider themeChangeProvider = new ThemeProvider();

  void getCurrentAppTheme() async {
    themeChangeProvider.setTheme =
        await themeChangeProvider.themePreference.getTheme();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: themeChangeProvider,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Douvery',
        onGenerateRoute: (settings) => generateRoute(settings),
        home: Provider.of<UserProvider>(context).user.token.isNotEmpty
            ? Provider.of<UserProvider>(context).user.type == 'user'
                ? ResponsiveLayaout()
                : AdminResponsiveLayaout()
            : ResponsiveLayaout(),
      ),
    );
  }
}
