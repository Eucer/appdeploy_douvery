import 'dart:convert';
import 'dart:io';

import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:v1douvery/constantes/error_handling.dart';
import 'package:v1douvery/constantes/global_variables.dart';
import 'package:v1douvery/constantes/utils.dart';
import 'package:v1douvery/features/auth/responsive/authResponsivelayout.dart';
import 'package:v1douvery/models/order.dart';
import 'package:v1douvery/models/user.dart';
import 'package:v1douvery/provider/user_provider.dart';

import 'package:http/http.dart' as http;

class AccountServices {
  Future<List<Order>> fetchMyOrders({
    required BuildContext context,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    List<Order> orderList = [];
    try {
      http.Response res =
          await http.get(Uri.parse('$uri/api/orders/me'), headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'x-auth-token': userProvider.user.token,
      });

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          for (int i = 0; i < jsonDecode(res.body).length; i++) {
            orderList.add(
              Order.fromJson(
                jsonEncode(
                  jsonDecode(res.body)[i],
                ),
              ),
            );
          }
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
    return orderList;
  }

  void logOut(BuildContext context) async {
    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      await sharedPreferences.setString('x-auth-token', '');
      // ignore: use_build_context_synchronously
      Navigator.of(context, rootNavigator: true).push(
        // ensures fullscreen
        CupertinoPageRoute(
          builder: (BuildContext context) {
            return WebFullResponsiveLayaout();
          },
        ),
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  void enviarImagenAccount({
    required BuildContext context,
    required String name,
    required List<File> images,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);

    final cloudinary = CloudinaryPublic('douvery', 'bfkwgizb');
    List<String> imageUrls = [];

    for (int i = 0; i < images.length; i++) {
      CloudinaryResponse res = await cloudinary.uploadFile(
        CloudinaryFile.fromFile(images[i].path, folder: name),
      );
      imageUrls.add(res.secureUrl);
    }
    try {
      http.Response res = await http.post(
        Uri.parse('$uri/user/add-images'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token,
        },
        body: jsonEncode({
          'imagen': imageUrls,
        }),
      );

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          showSnackBar(context, 'Imagen Agregada!'.toString());
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
