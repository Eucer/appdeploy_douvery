import 'package:cached_network_image/cached_network_image.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:v1douvery/common/widgets/loader.dart';
import 'package:v1douvery/constantes/global_variables.dart';
import 'package:v1douvery/features/account/services/accountServices.dart';
import 'package:v1douvery/models/user.dart';
import 'package:v1douvery/provider/theme.dart';

class IconoDePerfil extends StatefulWidget {
  IconoDePerfil({Key? key}) : super(key: key);

  @override
  State<IconoDePerfil> createState() => _IconoDePerfilState();
}

class _IconoDePerfilState extends State<IconoDePerfil> {
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
    final currentTheme = Provider.of<ThemeProvider>(context);
    return Container(
      width: 60,
      height: 60,
      child: userList == null
          ? const Loader()
          : CircularProfileAvatar(
              '',
              borderColor: currentTheme.isDarkTheme()
                  ? Colors.white
                  : Color.fromARGB(17, 0, 0, 0),
              child: CachedNetworkImage(
                fit: BoxFit.contain,
                height: 45,
                imageUrl: userList!.images[0],
              ),
              radius: 50,
            ),
    );
  }
}
