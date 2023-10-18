import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projects/blocstate.dart';
import 'package:flutter_projects/cartpage.dart';
import 'package:flutter_projects/count_controller.dart';
import 'package:flutter_projects/landing_page.dart';
import 'package:badges/badges.dart' as badges;

class ProductDetails2 extends StatefulWidget {
  const ProductDetails2({super.key, required this.product});

  final Product product;

  @override
  ProductDetails2State createState() => ProductDetails2State();
}

class ProductDetails2State extends State<ProductDetails2> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  int? countControllerValue;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Colors.teal.withOpacity(0.5),
        title: Text(
          ' ${widget.product.name}',
          textAlign: TextAlign.center,
          style: const TextStyle(
              color: Colors.black,
              fontSize: 29,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold),
        ),
        actions: [
          BlocBuilder<CartBloc, CartState>(builder: (_, cartState) {
            List<Product> cartItem = cartState.cartItem;
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
                  //animationType: BadgeAnimationType.scale,toAimate: true
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

        /*IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const CartPage()));
              },
              icon: const Icon(Icons.shopping_bag_sharp),
              iconSize: 30,
            ),*/
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
              child: SingleChildScrollView(
                  child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16, 6, 16, 16),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    widget.product.imageUrl,
                    width: double.infinity,
                    height: 300,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                  child: Text(
                    'Details',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  )),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16, 4, 0, 0),
                child: Text(
                  '\$${widget.product.price}',
                  textAlign: TextAlign.start,
                  style: const TextStyle(color: Colors.white70, fontSize: 25),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16, 8, 10, 8),
                child: Text(
                  'Name: ${widget.product.name} \n\nAvailable Sizes: 39,40,42, 43, 44 \n\nColors: \n\nDescription:\nIntroducing our sleek and stylish sneaker shoe designed for both fashion and function. Crafted with premium materials, its breathable mesh upper provides comfort and ventilation. The cushioned insole and durable rubber outsole ensure all day comfort and support. Its modern design features a streamlined silhouette, making it perfect for any casual or athletic occasion. Elevate your footwear game with these versatile sneakers.',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ))),
          Material(
            color: Colors.transparent,
            elevation: 3,
            shape:
                const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
            child: Container(
              width: double.infinity,
              height: 85,
              decoration: BoxDecoration(
                  color: Colors.transparent.withOpacity(0.1),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 4,
                        color: Colors.teal.withOpacity(0.1),
                        offset: const Offset(0, -2)),
                  ]),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(25, 10, 25, 15),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 170,
                      height: 60,
                      decoration: BoxDecoration(
                          color: Colors.white12,
                          borderRadius: BorderRadius.circular(12),
                          shape: BoxShape.rectangle,
                          border: Border.all(width: 2)),
                      child: CountController(
                        decrementIconBuilder: (bool enabled) => const Icon(
                          Icons.remove_rounded,
                          size: 25,
                        ),
                        incrementIconBuilder: (bool enabled) => const Icon(
                          Icons.add_rounded,
                          size: 25,
                        ),
                        countBuilder: (int count) => Text(
                          count.toString(),
                          style: const TextStyle(fontSize: 22),
                        ),
                        count: countControllerValue ??= 1,
                        updateCount: (count) =>
                            setState(() => countControllerValue = count),
                        stepSize: 1,
                        minimum: 1,
                        contentPadding: const EdgeInsets.all(10),
                      ),
                    ),
                    //trying to input a button that works with the bloc directly into the product details page
                    ElevatedButton(
                        onPressed: () {
                          Product p = widget.product;
                          p.quantity = countControllerValue!.toInt();
                          BlocProvider.of<CartBloc>(context).add(AddProduct(p));
                        },
                        child: Container(
                            width: 100,
                            height: 50,
                            decoration: const BoxDecoration(
                              // color: Colors.purple,
                              shape: BoxShape.rectangle,
                            ),
                            child: const Center(
                              child: Text(
                                'Add to cart',
                                textAlign: TextAlign.center,
                                selectionColor: Colors.white,
                              ),
                            )))
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
