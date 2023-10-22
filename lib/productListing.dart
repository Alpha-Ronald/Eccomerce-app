import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projects/productDetails.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter_projects/products.dart';
import 'blocState.dart';
import 'cartPage.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.teal.withOpacity(0.2),
          title: Row(
            children: [
              Expanded(
                  child: Container(
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15)),
                child: const TextField(
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                      prefixIconColor: Colors.teal,
                      hintStyle: TextStyle(color: Colors.black, fontSize: 15),
                      hintText: 'Search shoe',
                      prefixIcon: Icon(Icons.search)),
                ),
              )),
              const SizedBox(
                width: 10,
              ),
              /*IconButton(
                onPressed: () {},
                icon: const Icon(Icons.shopping_bag_sharp),
                iconSize: 30,
              ),*/
            ],
          ),
          actions: [
            BlocBuilder<CartBloc, CartState>(builder: (_, cartState) {
              List cartItem = cartState.cartItem;
              return Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 8, 24, 0),
                  child: badges.Badge(
                    badgeContent: Text(
                      '${cartItem.length}',
                      style: const TextStyle(color: Colors.white),
                    ),
                    showBadge: true,
                    badgeStyle: const badges.BadgeStyle(
                      shape: badges.BadgeShape.circle,
                      badgeColor: Colors.black,
                      elevation: 4,
                      padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                    ),
                    position: badges.BadgePosition.topEnd(),
                    //animationType: BadgeAnimationType.scale,toAnimate: true
                    child: IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const CartPage()));
                      },
                      icon: const Icon(
                        Icons.shopping_bag_sharp,
                        size: 30,
                      ),
                    ),
                  ));
            })
          ],
        ),
        body: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(children: [
              const SizedBox(
                height: 7,
              ),
              CarouselSlider(
                items: productImageUrls.map((imageUrl) {
                  return Builder(
                    builder: (BuildContext context) {
                      return ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            width: double.infinity,
                            margin: const EdgeInsets.symmetric(
                                horizontal: 0, vertical: 5),
                            child: CachedNetworkImage(
                              fadeInCurve: Curves.easeIn,
                              imageUrl: imageUrl,
                              fit: BoxFit.fill,
                              placeholder: (context, url) => const Center(
                                child: CircularProgressIndicator(),
                              ),
                              errorWidget: (context, url, error) =>
                                  const Center(
                                child: Icon(Icons.error),
                              ),
                            ),
                          ));
                    },
                  );
                }).toList(),
                options: CarouselOptions(
                    aspectRatio: 16 / 6,
                    autoPlay: true,
                    enlargeCenterPage: true),
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: GridView.builder(
                  itemCount: products.length,
                  padding: const EdgeInsets.all(5),
                  itemBuilder: (BuildContext context, int index) {
                    final product = products[index];
                    return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ProductDetails2(
                                        product: products[index],
                                      )));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.teal.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(8)),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0, 0, 0, 20),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: ClipRRect(
                                        borderRadius: const BorderRadius.only(
                                          bottomLeft: Radius.circular(0),
                                          bottomRight: Radius.circular(0),
                                          topLeft: Radius.circular(8),
                                          topRight: Radius.circular(8),
                                        ),
                                        child: Image.network(
                                          product.imageUrl,
                                          width: 100,
                                          height: 115,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(8, 4, 0, 0),
                                        child: Text(
                                          product.name,
                                          style: TextStyle(
                                              fontStyle: FontStyle.italic,
                                              color: Colors.white70
                                                  .withOpacity(0.7),
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0, 3, 0, 0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(8, 4, 0, 0),
                                        child: Text(
                                          '\$ ${product.price}',
                                          style: const TextStyle(
                                              fontSize: 15,
                                              color: Colors.green),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ));
                  },
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 15),
                ),
              )
            ])));
  }
}

/*Card(
                          elevation: 05,
                          margin: const EdgeInsets.all(5),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          color: Colors.tealAccent.withOpacity(0.4),
                          child: CachedNetworkImage(
                            imageUrl: product.imageUrl,
                            fit: BoxFit.contain,
                            placeholder: (context, url) =>
                            const Center(
                              child: CircularProgressIndicator(),
                            ),
                          ),
                        )*/
