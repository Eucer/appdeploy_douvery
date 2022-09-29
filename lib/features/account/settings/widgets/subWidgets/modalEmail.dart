import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:v1douvery/common/widgets/custom.button.dart';
import 'package:v1douvery/common/widgets/custom_textfiels.dart';
import 'package:v1douvery/common/widgets/loader.dart';
import 'package:v1douvery/features/account/services/accountServices.dart';
import 'package:v1douvery/models/user.dart';
import 'package:v1douvery/provider/user_provider.dart';

import '../../../../../provider/theme.dart';

class MadaleditEmail extends StatefulWidget {
  MadaleditEmail({Key? key}) : super(key: key);

  @override
  State<MadaleditEmail> createState() => _MadaleditEmailState();
}

class _MadaleditEmailState extends State<MadaleditEmail> {
  final AccountServices accountServices = AccountServices();

  final TextEditingController editEmailController = TextEditingController();

  final _addProductFormKey = GlobalKey<FormState>();

  void sellProduct() {
    if (_addProductFormKey.currentState!.validate()) {
      accountServices.editDatEmailUser(
        context: context,
        email: editEmailController.text,
      );
    }
  }

  User? userList;

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
    final user = Provider.of<UserProvider>(context).user;

    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Row(
              children: [
                Text('Email actual:  '),
                userList == null ? Loader() : Text(userList!.email),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Form(
              key: _addProductFormKey,
              child: CustomTextField(
                controller: editEmailController,
                hintText: 'Editar email',
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: CustomnButton(
                text: 'Sell',
                onTap: sellProduct,
              ),
            )
          ],
        ),
      ),
    );
  }
}
