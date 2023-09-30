import 'package:flutter/material.dart';
import 'package:flutter_projects/landing_page.dart';

class ProductDetails2 extends StatefulWidget {
  const ProductDetails2({super.key, required this.product});

  final Product product;

  @override
  ProductDetails2State createState() => ProductDetails2State();
}

class ProductDetails2State extends State<ProductDetails2> {
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
          title: Row(children: [
            Expanded(
              child: Text(
                ' ${widget.product.name}',
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 29,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.shopping_bag_sharp),
              iconSize: 30,
            ),
          ])),
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
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            16, 6, 16, 16),
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
                            'Kicks details',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                            ),
                          )),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            16, 4, 0, 0),
                        child: Text(
                          '\$${widget.product.price}',
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                              color: Colors.white70, fontSize: 25),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 8, 16, 8),
                        child: Text(
                          'Name: \nSizes: \n\nColors: \nDescription:  \n',
                          style: TextStyle(
                            color: Colors.teal,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ],
                  )))
        ],
      ),
      bottomNavigationBar: BottomAppBar(),
    );
  }
}
