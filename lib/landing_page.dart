import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_projects/productDetails.dart';

//import 'package:flutter_projects/ProductDetails_page.dart';
//import 'package:badges/badges.dart';
//import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

final List<String> productImageUrls = [
  'https://images.unsplash.com/photo-1595950653106-6c9ebd614d3a?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8c25lYWtlcnN8ZW58MHx8MHx8fDA%3D&w=1000&q=80',
  'https://images.unsplash.com/photo-1579338559194-a162d19bf842?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OXx8c25lYWtlcnN8ZW58MHx8MHx8fDA%3D&w=1000&q=80',
  'https://i.insider.com/59b7f9d638d20d1f008b4c6f?width=1200&format=jpeg',
  'https://static-uc.olist.ng/upload/20200613/y9kzb0afu2p.jpg',
  'https://fancysoles.com.ng/wp-content/uploads/2023/06/8be8e466775e87c83e5133450c47092a.jpg',
  'https://canary.contestimg.wish.com/api/webimage/5ebe8a136e995c0302ab17cb-large.jpg?cache_buster=c60db8584f7ff3a99ee096202bdac84d',
  'https://i.insider.com/59b7f9d638d20d1f008b4c6f?width=1200&format=jpeg',
  'https://static-uc.olist.ng/upload/20200613/y9kzb0afu2p.jpg',
  'https://fancysoles.com.ng/wp-content/uploads/2023/06/8be8e466775e87c83e5133450c47092a.jpg',
  'https://static-uc.olist.ng/upload/20200613/y9kzb0afu2p.jpg',
];

class Product {
  final int id;
  final String name;
  final String imageUrl;
  final double price;
  int quantity;

  Product(
      {required this.id,
      required this.name,
      required this.imageUrl,
      required this.price,
      this.quantity = 0});
}
//final product = products[index];

final List<Product> products = [
  Product(
      id: 1,
      name: 'Champion',
      imageUrl:
          'https://i.insider.com/59b7f9d638d20d1f008b4c6f?width=1200&format=jpeg',
      price: 55.5),
  Product(
      id: 2,
      name: 'Stark',
      imageUrl: 'https://static-uc.olist.ng/upload/20200613/y9kzb0afu2p.jpg',
      price: 65.5),
  Product(
      id: 3,
      name: 'Stone',
      imageUrl:
          'https://i.insider.com/59b7f9d638d20d1f008b4c6f?width=1200&format=jpeg',
      price: 65.5),
  Product(
      id: 4,
      name: 'Supra',
      imageUrl:
          'https://images.unsplash.com/photo-1579338559194-a162d19bf842?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OXx8c25lYWtlcnN8ZW58MHx8MHx8fDA%3D&w=1000&q=80',
      price: 65.5),
  Product(
      id: 5,
      name: 'Storm',
      imageUrl: 'https://static-uc.olist.ng/upload/20200613/y9kzb0afu2p.jpg',
      price: 65.5),
  Product(
      id: 6,
      name: 'Rike',
      imageUrl:
          'https://fancysoles.com.ng/wp-content/uploads/2023/06/8be8e466775e87c83e5133450c47092a.jpg',
      price: 65.5),
  Product(
      id: 7,
      name: 'Vane',
      imageUrl:
          'https://images.unsplash.com/photo-1595950653106-6c9ebd614d3a?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8c25lYWtlcnN8ZW58MHx8MHx8fDA%3D&w=1000&q=80',
      price: 65.5),
];

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
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.shopping_bag_sharp),
                iconSize: 30,
              ),
            ],
          ),
          // actions: <Widget>[ShoppingCartBadge()],
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
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.teal.withOpacity(0.2),
                        ),
                        width: double.infinity,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 0, vertical: 5),
                        child: CachedNetworkImage(
                          fadeInCurve: Curves.easeIn,
                          imageUrl: imageUrl,
                          fit: BoxFit.contain,
                          placeholder: (context, url) => const Center(
                            child: CircularProgressIndicator(),
                          ),
                          errorWidget: (context, url, error) => const Center(
                            child: Icon(Icons.error),
                          ),
                        ),
                      );
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
