import 'package:flutter/material.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            height: 300,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      'https://static-uc.olist.ng/upload/20200613/y9kzb0afu2p.jpg'),
                  fit: BoxFit.cover),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'Product Name',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text('Product Description: shoes',
                style: TextStyle(fontSize: 16)),
          ),
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'price: N12,000',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.green),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'in stock',
                  style: TextStyle(fontSize: 18, color: Colors.green),
                ),
                Text(
                  'Rating:4.5/5',
                  style: TextStyle(fontSize: 18),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 16)),
              child: const Text(
                'Add to cart',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
