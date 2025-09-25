import 'package:e_commerce_app/models/cart_item.dart';
import 'package:flutter/material.dart';
import '../widgets/buy_button_form.dart';
import '../widgets/cache_image.dart';
import '../widgets/product_info.dart';

class ProductDetalesScreen extends StatelessWidget {
  final Product product;

  const ProductDetalesScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[100],
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.45,
            width: double.infinity,
            child: CacheImage(product: product),
          ),

          // Product information
          ProductInfo(product: product),
          // Buy button
          BuyButtonForm(product: product),

          // Back button on the image
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                backgroundColor: Colors.white.withOpacity(0.8),
                child: IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.black),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
