import 'package:flutter/material.dart';
import '../models/product.dart';

// Pantalla que muestra la información completa de un producto
class ProductDetailScreen extends StatelessWidget {
  final Product product;

  const ProductDetailScreen({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalle del producto'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 280,
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Image.network(
                product.image,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  return const Center(
                    child: Icon(
                      Icons.image_not_supported,
                      size: 80,
                      color: Colors.grey,
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            Text(
              product.title,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              '\$${product.price.toStringAsFixed(2)}',
              style: const TextStyle(
                fontSize: 24,
                color: Colors.green,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Categoría: ${product.category}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            Text(
              product.rating != null
                  ? 'Rating: ${product.rating!.rate} (${product.rating!.count} opiniones)'
                  : 'Sin calificación',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            const Text(
              'Descripción',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              product.description,
              style: const TextStyle(
                fontSize: 16,
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}