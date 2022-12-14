import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:v1douvery/common/widgets/carouselCustonIconsArrow.dart';
import 'package:v1douvery/common/widgets/header_bold.dart';
import 'package:v1douvery/common/widgets/header_double.dart';
import 'package:v1douvery/common/widgets/header_text.dart';
import 'package:v1douvery/common/widgets/loader.dart';
import 'package:v1douvery/common/widgets/stars.dart';
import 'package:v1douvery/constantes/global_variables.dart';
import 'package:v1douvery/features/account/widgets/ordenesUser.dart';
import 'package:v1douvery/features/cart/services/cardServices.dart';
import 'package:v1douvery/features/home/services/homeServices.dart';
import 'package:v1douvery/features/pruductDetails/screens/mobiles_productDetailsScrenn.dart';
import 'package:v1douvery/features/pruductDetails/screens/webFull_productDetails.dart';
import 'package:v1douvery/features/pruductDetails/services/pruductDetailsServices.dart';
import 'package:v1douvery/main.dart';
import 'package:v1douvery/models/product.dart';
import 'package:v1douvery/provider/user_provider.dart';

import '../mobiles/banner_widget.dart';

class WebFull_conMarca extends StatefulWidget {
  WebFull_conMarca({Key? key}) : super(key: key);

  @override
  State<WebFull_conMarca> createState() => _WebFull_conMarcaState();
}

class _WebFull_conMarcaState extends State<WebFull_conMarca> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: WebFull_Container(
        marca: 'Apple',
      ),
    );
  }
}

class WebFull_Container extends StatefulWidget {
  final String marca;
  const WebFull_Container({
    Key? key,
    required this.marca,
  }) : super(key: key);

  @override
  State<WebFull_Container> createState() => _WebFull_ContainerState();
}

class _WebFull_ContainerState extends State<WebFull_Container> {
  List<Product>? productList;
  final HomeServices homeServices = HomeServices();

  @override
  void initState() {
    super.initState();
    fetchMarcaProducts();
  }

  fetchMarcaProducts() async {
    productList = await homeServices.fetchMarcaProducts(
      context: context,
      marca: widget.marca,
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final CarouselController _controller = CarouselController();

    @override
    void initState() {
      super.initState();
    }

    return Padding(
      padding: const EdgeInsets.only(top: 5.0),
      child: Container(
        width: 1260,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                  bottom: BorderSide(
                    width: 1,
                    color: Color.fromARGB(7, 0, 0, 0),
                  ),
                ),
              ),
              child: headerDoubleText(
                textHeader: 'Productos de ' + widget.marca,
                textAction: 'Ver mas',
              ),
            ),
            productList == null
                ? const Loader()
                : Container(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    width: 1260,
                    color: GlobalVariables.backgroundColor,
                    child: Stack(
                      children: [
                        Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                height: 205,
                                width: MediaQuery.of(context).size.width,
                                color: Colors.white,
                                child: CarouselSlider(
                                  items: GlobalVariables.marcaApple.map(
                                    (i) {
                                      return Builder(
                                        builder: (BuildContext context) =>
                                            Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: CachedNetworkImage(
                                            imageUrl: i,
                                            fit: BoxFit.cover,
                                            width: 1260,
                                          ),
                                        ),
                                      );
                                    },
                                  ).toList(),
                                  options: CarouselOptions(
                                    autoPlayAnimationDuration:
                                        const Duration(milliseconds: 1),
                                    autoPlayInterval:
                                        const Duration(seconds: 20),
                                    autoPlay: true,
                                    viewportFraction: 1,
                                    height: 205,
                                    aspectRatio: 16 / 10,
                                    initialPage: 0,
                                    enableInfiniteScroll: false,
                                    reverse: false,
                                    autoPlayCurve: Curves.fastOutSlowIn,
                                    enlargeCenterPage: true,
                                    scrollDirection: Axis.horizontal,
                                  ),
                                ),
                              ),
                              Center(
                                child: Container(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Flexible(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: CarouselconsButton(
                                            onPressed: () =>
                                                _controller.previousPage(),
                                            icon: Icon(
                                              IconlyLight.arrowLeft2,
                                              size: 20,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Flexible(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: CarouselconsButton(
                                            onPressed: () =>
                                                _controller.nextPage(),
                                            icon: Icon(
                                              IconlyLight.arrowRight2,
                                              size: 20,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                  height: 185,
                                  width: 1260,
                                  child: CarouselSlider.builder(
                                    itemCount: productList!.length,
                                    itemBuilder: (context, index, realIndex) {
                                      final product = productList![index];
                                      return GestureDetector(
                                        onTap: () => Navigator.push(
                                          context,
                                          PageRouteBuilder(
                                            pageBuilder: (_, __, ___) =>
                                                WebFull_productDetails(
                                              product: product,
                                            ),
                                          ),
                                        ),
                                        child: Container(
                                          width: 150,
                                          child: Column(
                                            children: [
                                              Container(
                                                width: 155.0,
                                                height: 110.0,
                                                child: productList == null
                                                    ? const Loader()
                                                    : CachedNetworkImage(
                                                        imageUrl:
                                                            product.images[0]),
                                              ),
                                              Align(
                                                alignment: Alignment.bottomLeft,
                                                child: Column(
                                                  children: [
                                                    Container(
                                                      alignment:
                                                          Alignment.bottomLeft,
                                                      margin:
                                                          const EdgeInsets.only(
                                                              top: 2.0,
                                                              left: 10),
                                                      child: Text(
                                                        product.name,
                                                        style: const TextStyle(
                                                          color:
                                                              Color(0xff1C2833),
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          letterSpacing: 0.4,
                                                          fontSize: 11.0,
                                                        ),
                                                        textAlign:
                                                            TextAlign.start,
                                                        maxLines: 2,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 0.0),
                                                      child: Container(
                                                        alignment: Alignment
                                                            .bottomLeft,
                                                        margin: const EdgeInsets
                                                                .only(
                                                            top: 2.0, left: 10),
                                                        child: Text(
                                                          'Envio ' + 'Gratis',
                                                          style: GoogleFonts
                                                              .roboto(
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    4,
                                                                    161,
                                                                    17),
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            letterSpacing: 1,
                                                            fontSize: 10.0,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 60.0,
                                                              bottom: 0.0),
                                                      child: Text(
                                                        r'$' +
                                                            product.price
                                                                .toString(),
                                                        style:
                                                            GoogleFonts.roboto(
                                                          color:
                                                              Color(0xff1C2833),
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          letterSpacing: 0.4,
                                                          fontSize: 15.0,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                    options: CarouselOptions(
                                      enableInfiniteScroll: false,
                                      viewportFraction: 0.2,
                                      enlargeStrategy:
                                          CenterPageEnlargeStrategy.height,
                                      aspectRatio: 1 / 2,
                                      disableCenter: true,
                                      pageSnapping: false,
                                      padEnds: false,
                                      pauseAutoPlayOnTouch: false,
                                    ),
                                    carouselController: _controller,
                                  )),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
