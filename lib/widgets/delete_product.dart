import 'package:flutter/material.dart';
import '../models/cart_item.dart';
import '../providers/products_provider.dart';
// ignore: depend_on_referenced_packages
import 'package:provider/provider.dart';

class DeleteProduct extends StatelessWidget {
  const DeleteProduct({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.delete, color: Colors.red),
      onPressed: () {
        showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: const Text('تأكيد الحذف'),
            content: const Text('هل أنت متأكد أنك تريد حذف هذا المنتج؟'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(ctx).pop(),
                child: const Text('إلغاء'),
              ),
              TextButton(
                onPressed: () {
                  Provider.of<ProductsProvider>(
                    context,
                    listen: false,
                  ).toggleSelect(product);
                  Navigator.of(ctx).pop();
                },
                child: const Text('حذف', style: TextStyle(color: Colors.red)),
              ),
            ],
          ),
        );
      },
    );
  }
}
