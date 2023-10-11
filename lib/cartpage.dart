import 'package:flutter/material.dart';
import 'package:flutter_projects/blocstate.dart';
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
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    16, 8, 16, 0),
                                child: Container(
                                  width: double.infinity,
                                  height: 100,
                                  decoration: BoxDecoration(
                                      color: Colors.teal,
                                      borderRadius: BorderRadius.circular(12)),
                                  child: Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            16, 8, 8, 8),
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
                                          padding: const EdgeInsetsDirectional
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
                                                          .fromSTEB(0, 0, 0, 0),
                                                  child: Text(
                                                    cartItems[index].name,
                                                    style: const TextStyle(
                                                        color: Colors.red,
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  )),
                                              Text(
                                                '\$${cartItems[index].price}',
                                                style: const TextStyle(
                                                    color: Colors.blue),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsetsDirectional
                                                        .fromSTEB(0, 0, 0, 0),
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
                                              BlocProvider.of<CartBloc>(context)
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
                    )
                    //BOTTOM WIDGET OF CHECKOUT BUTTON AND TOTAL
                  ],
                ),
              ))
            ],
          ),
        ));
  }
}
