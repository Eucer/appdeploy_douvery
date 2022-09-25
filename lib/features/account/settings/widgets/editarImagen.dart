import 'dart:io';

import 'package:animate_do/animate_do.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:v1douvery/NAV/mobiles/centerSearchNav.dart';
import 'package:v1douvery/common/widgets/IconButton.dart';
import 'package:v1douvery/common/widgets/custom.button.dart';
import 'package:v1douvery/common/widgets/iconCart.dart';
import 'package:v1douvery/constantes/global_variables.dart';
import 'package:v1douvery/constantes/utils.dart';
import 'package:v1douvery/features/account/services/accountServices.dart';
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
  final AccountServices adminServices = AccountServices();

  String category = 'Mobiles';

  List<File> images = [];
  final _addProductFormKey = GlobalKey<FormState>();

  void sellProduct() {
    if (_addProductFormKey.currentState!.validate() && images.isNotEmpty) {
      adminServices.enviarImagenAccount(
        context: context,
        name: widget.user.name,
        images: images,
      );
    }
  }

  void selectImages() async {
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
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          color: currentTheme.isDarkTheme()
              ? GlobalVariables.darkbackgroundColor
              : GlobalVariables.backgroundColor,
          child: Form(
            key: _addProductFormKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  images.isNotEmpty
                      ? Container(
                          child: CarouselSlider(
                            items: images.map(
                              (i) {
                                return Builder(
                                  builder: (BuildContext context) => Image.file(
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
                              viewportFraction: 0.8,
                              initialPage: 0,
                              enableInfiniteScroll: true,
                              reverse: false,
                              autoPlay: true,
                              autoPlayInterval: Duration(seconds: 8),
                              autoPlayAnimationDuration:
                                  Duration(milliseconds: 1800),
                              autoPlayCurve: Curves.fastOutSlowIn,
                              enlargeCenterPage: true,
                              scrollDirection: Axis.horizontal,
                            ),
                          ),
                        )
                      : GestureDetector(
                          onTap: selectImages,
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
                                        ? GlobalVariables.borderColorsDarklv20
                                        : GlobalVariables
                                            .borderColorsWhithelv20,
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    'Select images Productos ',
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 15),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                  SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    height: 15,
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
          ),
        ),
      )),
    );
  }
}
