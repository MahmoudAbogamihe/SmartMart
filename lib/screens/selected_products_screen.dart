import 'package:flutter/material.dart';

import '../providers/products_provider.dart';
import '../widgets/cache_image.dart';
import '../widgets/delete_product.dart';

// ignore: depend_on_referenced_packages
import 'package:provider/provider.dart';

class SelectedProductsScreen extends StatelessWidget {
  const SelectedProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedProducts = Provider.of<ProductsProvider>(
      context,
    ).selectedItems;

    return Scaffold(
      appBar: AppBar(
        title: selectedProducts.isEmpty
            ? Text('')
            : Text('${selectedProducts.length} Product Selected'),
        centerTitle: true,
      ),
      body: selectedProducts.isEmpty
          ? const Center(child: Text('No products selected yet'))
          : ListView.builder(
              itemCount: selectedProducts.length,
              itemBuilder: (ctx, i) {
                final product = selectedProducts[i];
                return Card(
                  margin: const EdgeInsets.all(8),
                  child: ListTile(
                    leading: CacheImage(product: product),
                    title: Text(product.title),
                    subtitle: Text("${product.price} ج.م"),
                    trailing: DeleteProduct(product: product),
                  ),
                );
              },
            ),
    );
  }
}
