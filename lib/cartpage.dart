import 'package:flutter/material.dart';

class CartList extends StatefulWidget {
  const CartList({super.key});

  @override
  State<StatefulWidget> createState() => CartListState();
}

class CartListState extends State<CartList> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

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
        child: const Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //cannot proceed until i build the statemanagemt
            //BlocBuilder<CartBloc, CartState>(builder: (cartState){
          ],
        ),
      ),
    );
  }
}
