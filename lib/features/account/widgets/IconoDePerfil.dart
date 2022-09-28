import 'package:flutter/material.dart';
import 'package:v1douvery/common/widgets/loader.dart';
import 'package:v1douvery/features/account/services/accountServices.dart';
import 'package:v1douvery/models/user.dart';

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
    return Container(
      width: 60,
      height: 60,
      child: userList == null
          ? const Loader()
          : CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(userList!.images[0]),
            ),
    );
  }
}
