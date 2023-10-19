import 'package:flutter/material.dart';
import 'package:flutter_projects/blocState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'landing_page.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<StatefulWidget> createState() => CartPageState();
}

class CartPageState extends State<CartPage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  late List<Product> cartItems;

  @override
  void initState() {
    super.initState();
    setState(() {
      cartItems = BlocProvider.of<CartBloc>(context).items;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.teal.withOpacity(0.2),
          title: const Text(
            'Cart',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
        body: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        BlocBuilder<CartBloc, CartState>(
                          builder: (_, cartState) {
                            return ListView.builder(
                                padding: EdgeInsets.zero,
                                primary: false,
                                scrollDirection: Axis.vertical,
                                itemCount: cartItems.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            16, 8, 16, 0),
                                    child: Container(
                                      width: double.infinity,
                                      height: 100,
                                      decoration: BoxDecoration(
                                          color: Colors.teal,
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(16, 8, 8, 8),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.all(10),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                child: Image.network(
                                                  cartItems[index].imageUrl,
                                                  width: 80,
                                                  height: 80,
                                                  fit: BoxFit.fitWidth,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsetsDirectional
                                                      .fromSTEB(12, 0, 0, 0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                              0, 0, 0, 0),
                                                      child: Text(
                                                        cartItems[index].name,
                                                        style: const TextStyle(
                                                            color: Colors.red,
                                                            fontSize: 20,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      )),
                                                  Text(
                                                    '\$${cartItems[index].price}',
                                                    style: const TextStyle(
                                                        color: Colors.blue),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                            0, 0, 0, 0),
                                                    child: Text(
                                                      'Quantity: ${cartItems[index].quantity}',
                                                      style: const TextStyle(
                                                          color: Colors.red),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            IconButton(
                                                onPressed: () {
                                                  BlocProvider.of<CartBloc>(
                                                          context)
                                                      .add(RemoveProduct(
                                                          cartItems[index]));
                                                },
                                                icon: const Icon(
                                                  Icons.delete_outline_rounded,
                                                  color: Colors.red,
                                                  size: 20,
                                                ))
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                });
                          },
                        ),
                        //BOTTOM WIDGET OF CHECKOUT BUTTON AND TOTAL
                        const Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(24, 16, 24, 4),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'Price Breakdown',
                                style: TextStyle(
                                    color: Colors.teal,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(24, 4, 24, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Base Price',
                                style: TextStyle(
                                    color: Colors.teal,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '\$156.00',
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(24, 4, 24, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Taxes',
                                style: TextStyle(
                                    color: Colors.teal,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '\$24.20',
                                style: TextStyle(
                                    color: Colors.teal,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              24, 4, 24, 24),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  const Text(
                                    'Total',
                                    style: TextStyle(
                                        color: Colors.teal,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  IconButton(
                                    icon: const Icon(
                                      Icons.info_outlined,
                                      color: Color(0xFF57636C),
                                      size: 18,
                                    ),
                                    onPressed: () {
                                      const SnackBar(
                                          content: Text(
                                              'Total amount of items in cart, excluding delivery fees'));
                                    },
                                  ),
                                ],
                              ),
                              const Text(
                                '\$230.20',
                                style: TextStyle(
                                    color: Colors.teal,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  child: Container(
                    width: double.infinity,
                    height: 100,
                    decoration: const BoxDecoration(
                      color: Colors.teal,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 4,
                          color: Color(0x320E151B),
                          offset: Offset(0, -2),
                        )
                      ],
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(0),
                        bottomRight: Radius.circular(0),
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16),
                      ),
                    ),
                    alignment: const AlignmentDirectional(0, -0.35),
                    child: const Text(
                      'Checkout (\$230.20)',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ),
                  onTap: () {},
                ),
              ],
            )));
  }
}