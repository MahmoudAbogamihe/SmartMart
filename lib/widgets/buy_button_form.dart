import 'package:flutter/material.dart';
import '../models/cart_item.dart';
import '../providers/products_provider.dart';

// ignore: depend_on_referenced_packages
import 'package:provider/provider.dart';

class BuyButtonForm extends StatelessWidget {
  const BuyButtonForm({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 20,
      left: 20,
      right: 20,
      child: Consumer<ProductsProvider>(
        builder: (ctx, provider, _) {
          final isSelected = provider.selectedItems.contains(product);
          return SizedBox(
            width: double.infinity,
            height: 55,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: isSelected ? Colors.green : Colors.blueAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              onPressed: () {
                provider.toggleSelect(product);
              },
              child: Text(
                isSelected ? "Cancel Select" : "Select Product",
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
