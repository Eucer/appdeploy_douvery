import 'dart:io';

import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:elegant_notification/elegant_notification.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_native_splash/cli_commands.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:v1douvery/NAV/mobiles/centerSearchNav.dart';
import 'package:v1douvery/common/widgets/IconButton.dart';
import 'package:v1douvery/common/widgets/custom.button.dart';
import 'package:v1douvery/common/widgets/iconCart.dart';
import 'package:v1douvery/common/widgets/loader.dart';
import 'package:v1douvery/common/widgets/stars.dart';
import 'package:v1douvery/constantes/global_variables.dart';
import 'package:v1douvery/constantes/utils.dart';
import 'package:v1douvery/features/Drawer/screen/mobiles_drawerScreen.dart';
import 'package:v1douvery/features/account/services/accountServices.dart';
import 'package:v1douvery/features/account/widgets/IconoDePerfil.dart';
import 'package:v1douvery/features/admin/servicios/adminServices.dart';
import 'package:v1douvery/models/user.dart';
import 'package:v1douvery/provider/theme.dart';
import 'package:v1douvery/provider/user_provider.dart';

class Subir_And_EditarImagenAccount extends StatefulWidget {
  final User user;
  Subir_And_EditarImagenAccount({Key? key, required this.user})
      : super(key: key);

  @override
  State<Subir_And_EditarImagenAccount> createState() =>
      _Subir_And_EditarImagenAccountState();
}

class _Subir_And_EditarImagenAccountState
    extends State<Subir_And_EditarImagenAccount> {
  final AccountServices accountServices = AccountServices();

  List<File> images = [];
  final _addProductFormKey = GlobalKey<FormState>();

  void sellProduct() {
    if (images.isNotEmpty) {
      accountServices.enviarImagenAccount(
        context: context,
        name: widget.user.name,
        images: images,
      );
    }
  }

  void selectImagess() async {
    var res = await pickImages();
    setState(() {
      images = res;
    });
  }

  @override
  Widget build(BuildContext context) {
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
              'Editar imagen',
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
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8, top: 8),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  width: 1,
                  color: currentTheme.isDarkTheme()
                      ? GlobalVariables.borderColorsDarklv10
                      : Color.fromARGB(17, 0, 0, 0),
                ),
                color: currentTheme.isDarkTheme()
                    ? GlobalVariables.darkbackgroundColor
                    : GlobalVariables.backgroundColor,
              ),
              child: Column(
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
                            IconButton(
                              icon: Icon(
                                Icons.compare,
                                color: currentTheme.isDarkTheme()
                                    ? GlobalVariables.text2darkbackgroundColor
                                    : GlobalVariables.text1WhithegroundColor,
                              ),
                              onPressed: () {},
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Container(
                              width: 60,
                              height: 60,
                              child: CircularProfileAvatar(
                                '',
                                backgroundColor:
                                    GlobalVariables.greyBackgroundCOlor,
                                child: CarouselSlider(
                                  items: images.map(
                                    (i) {
                                      return Builder(
                                        builder: (BuildContext context) =>
                                            Image.file(
                                          i,
                                          fit: BoxFit.contain,
                                          height: 300,
                                        ),
                                      );
                                    },
                                  ).toList(),
                                  options: CarouselOptions(
                                    height: 400,
                                    aspectRatio: 16 / 9,
                                    viewportFraction: 1,
                                  ),
                                ),
                                radius: 50,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(0.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  width: 1,
                  color: currentTheme.isDarkTheme()
                      ? GlobalVariables.borderColorsDarklv10
                      : Color.fromARGB(17, 0, 0, 0),
                ),
                color: currentTheme.isDarkTheme()
                    ? GlobalVariables.darkbackgroundColor
                    : GlobalVariables.backgroundColor,
              ),
              child: Form(
                key: _addProductFormKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 15,
                      ),
                      images.isNotEmpty
                          ? GestureDetector(
                              onDoubleTap: () {
                                Navigator.pop(context);
                              },
                              child: Container(
                                child: CarouselSlider(
                                  items: images.map(
                                    (i) {
                                      return Builder(
                                        builder: (BuildContext context) =>
                                            Image.file(
                                          i,
                                          fit: BoxFit.contain,
                                          height: 300,
                                        ),
                                      );
                                    },
                                  ).toList(),
                                  options: CarouselOptions(
                                    height: 400,
                                    aspectRatio: 16 / 9,
                                    viewportFraction: 1,
                                  ),
                                ),
                              ),
                            )
                          : GestureDetector(
                              onTap: selectImagess,
                              child: DottedBorder(
                                color: currentTheme.isDarkTheme()
                                    ? GlobalVariables.borderColorsDarklv20
                                    : GlobalVariables.borderColorsWhithelv20,
                                borderType: BorderType.RRect,
                                radius: Radius.circular(10),
                                dashPattern: [10, 4],
                                strokeCap: StrokeCap.round,
                                child: Container(
                                  width: double.infinity,
                                  height: 150,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.folder_open,
                                        size: 40,
                                        color: currentTheme.isDarkTheme()
                                            ? GlobalVariables
                                                .borderColorsDarklv20
                                            : GlobalVariables
                                                .borderColorsWhithelv20,
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Text(
                                        'Seleciona la imagen que deseas agregar',
                                        style: TextStyle(
                                            color: Colors.grey, fontSize: 15),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                      Padding(
                        padding: const EdgeInsets.all(50.0),
                        child: CustomnButton(
                          text: 'Cambiar imagen',
                          onTap: sellProduct,
                          color: Color(0xff3CCF4E),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Container(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        width: 1,
                        color: currentTheme.isDarkTheme()
                            ? GlobalVariables.borderColorsDarklv10
                            : Color.fromARGB(17, 0, 0, 0),
                      ),
                      color: currentTheme.isDarkTheme()
                          ? GlobalVariables.darkbackgroundColor
                          : GlobalVariables.backgroundColor,
                    ),
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.only(left: 10, top: 10),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                  width: 45,
                                  height: 45,
                                  child: CircularProfileAvatar(
                                    '',
                                    backgroundColor:
                                        GlobalVariables.greyBackgroundCOlor,
                                    child: CarouselSlider(
                                      items: images.map(
                                        (i) {
                                          return Builder(
                                            builder: (BuildContext context) =>
                                                Image.file(
                                              i,
                                              fit: BoxFit.contain,
                                              height: 300,
                                            ),
                                          );
                                        },
                                      ).toList(),
                                      options: CarouselOptions(
                                        height: 400,
                                        aspectRatio: 16 / 9,
                                        viewportFraction: 1,
                                      ),
                                    ),
                                    radius: 50,
                                  )),
                              Container(
                                padding: EdgeInsets.only(left: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      user.name,
                                      style: TextStyle(
                                          color: currentTheme.isDarkTheme()
                                              ? GlobalVariables
                                                  .text1darkbackgroundColor
                                              : GlobalVariables
                                                  .text1WhithegroundColor,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    CustomnIconsButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        IconlyLight.shieldDone,
                                        size: 15,
                                        color: GlobalVariables.colorgreen,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      GestureDetector(
                                        child: Icon(
                                          Icons.more_vert,
                                          size: 15,
                                          color: currentTheme.isDarkTheme()
                                              ? GlobalVariables
                                                  .text1darkbackgroundColor
                                              : GlobalVariables
                                                  .text1WhithegroundColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            child: Text(
                              'Me encanta ese producto! ',
                              style: TextStyle(
                                  color: currentTheme.isDarkTheme()
                                      ? GlobalVariables.text2darkbackgroundColor
                                      : GlobalVariables.text2WhithegroundColor,
                                  fontSize: 13),
                            ),
                          ),
                          Container(
                              margin: EdgeInsets.only(top: 0),
                              child: Row(
                                children: [
                                  Stars(rating: 5),
                                  Text(
                                    '(5.0) ',
                                    style: TextStyle(
                                        color: currentTheme.isDarkTheme()
                                            ? GlobalVariables
                                                .text1darkbackgroundColor
                                            : GlobalVariables
                                                .text1WhithegroundColor,
                                        fontSize: 13),
                                  ),
                                  CustomnIconsButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.thumb_up_off_alt,
                                      size: 15,
                                      color: Colors.blueGrey,
                                    ),
                                  ),
                                  CustomnIconsButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.thumb_down_off_alt,
                                      size: 15,
                                      color: Colors.blueGrey,
                                    ),
                                  ),
                                ],
                              )),
                        ]),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8, top: 0),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                        color: currentTheme.isDarkTheme()
                            ? GlobalVariables.borderColorsDarklv10
                            : Color.fromARGB(17, 0, 0, 0),
                      ),
                      borderRadius: BorderRadius.circular(10),
                      color: currentTheme.isDarkTheme()
                          ? GlobalVariables.darkbackgroundColor
                          : GlobalVariables.backgroundColor,
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Container(
                                    width: 60,
                                    height: 60,
                                    child: CircularProfileAvatar(
                                      '',
                                      backgroundColor:
                                          GlobalVariables.greyBackgroundCOlor,
                                      child: CarouselSlider(
                                        items: images.map(
                                          (i) {
                                            return Builder(
                                              builder: (BuildContext context) =>
                                                  Image.file(
                                                i,
                                                fit: BoxFit.contain,
                                                height: 300,
                                              ),
                                            );
                                          },
                                        ).toList(),
                                        options: CarouselOptions(
                                          height: 400,
                                          aspectRatio: 16 / 9,
                                          viewportFraction: 1,
                                        ),
                                      ),
                                      radius: 50,
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
                                        : GlobalVariables.colorTextGreylv180,
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
                                              : Color.fromARGB(
                                                  255, 5, 68, 177)),
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
            ),
          ),
        ],
      )),
    );
  }
}
