import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:v1douvery/NAV/mobiles/centerSearchNav.dart';
import 'package:v1douvery/common/widgets/custom.button.dart';
import 'package:v1douvery/common/widgets/iconCart.dart';
import 'package:v1douvery/features/Drawer/screen/mobiles_drawerScreen.dart';
import 'package:v1douvery/features/account/settings/screens/settingsHomeAccount.dart';
import 'package:v1douvery/features/account/settings/widgets/subWidgets/modalEmail.dart';
import 'package:v1douvery/models/user.dart';
import 'package:v1douvery/provider/theme.dart';
import 'package:v1douvery/provider/user_provider.dart';

import '../../../../common/widgets/IconButton.dart';
import '../../../../common/widgets/custom_textfiels.dart';
import '../../../../constantes/global_variables.dart';
import '../../services/accountServices.dart';

class EditDatosUser extends StatefulWidget {
  final User user;
  EditDatosUser({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  State<EditDatosUser> createState() => _EditDatosUserState();
}

class _EditDatosUserState extends State<EditDatosUser> {
  @override
  Widget build(BuildContext context) {
    final currentTheme = Provider.of<ThemeProvider>(context);
    final user = Provider.of<UserProvider>(context).user;

    _modalEmail(BuildContext context) async {
      showModalBottomSheet(
          context: context,
          builder: (BuildContext bc) {
            return MadaleditEmail();
          });
    }

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
              'Editar datos',
            ),
          ),
          actions: [
            Builder(
              builder: (context) {
                return CustomnIconsButton(
                  icon: Icon(Iconsax.user_octagon,
                      size: 28, color: Color.fromARGB(235, 255, 255, 255)),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                );
              },
            ),
            IconCart(),
          ],
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(15),
            child: CenterSearchNav(),
          ),
          backgroundColor: Colors.blue[900],
        ),
      ),
      drawer: DrawerScreen(),
      body: SingleChildScrollView(
        child: Column(
          children: [
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
                _modalEmail(context);
              },
              currentTheme: currentTheme,
            ),
          ],
        ),
      ),
    );
  }
}
