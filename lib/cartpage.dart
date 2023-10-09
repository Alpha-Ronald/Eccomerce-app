import 'package:flutter/material.dart';
import 'package:flutter_projects/blocstate.dart';

class CartList extends StatefulWidget {
  const CartList({super.key});

  @override
  State<StatefulWidget> createState() => CartListState();
}

class CartListState extends State<CartList> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    // TODO: implement initState
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
                  BlocBuilder<CartBloc, CartState>(builder: (cartState) {
                    return ListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: cartItems.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(16, 8, 16, 0),
                          child: Container(
                            width: double.infinity,
                            height: 100,
                            decoration: BoxDecoration(
                                color: Colors.white10,
                                borderRadius: BorderRadius.circular(12)),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(16, 8, 8, 8),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Hero(
                                      tag: 'ControllerImage',
                                      transitionOnUserGestures: true,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(12),
                                        child: Image.network(
                                          cartItems[index].image,
                                          width: 80,
                                          height: 80,
                                          fit: BoxFit.fitWidth,
                                        ),
                                      ))
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  })
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
