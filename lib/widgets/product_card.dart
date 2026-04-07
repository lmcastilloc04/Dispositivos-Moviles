import 'package:flutter/material.dart';
import '../models/product.dart';

// Widget reutilizable para mostrar la información básica de un producto
class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3, // sombra de la tarjeta
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12), // bordes redondeados
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Imagen del producto
            Expanded(
              child: Center(
                child: Image.network(
                  product.image,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    // Si falla la imagen, mostramos un ícono
                    return const Icon(
                      Icons.image_not_supported,
                      size: 50,
                    );
                  },
                ),
              ),
            ),

            const SizedBox(height: 8),

            // Título del producto
            Text(
              product.title,
              maxLines: 2, // máximo 2 líneas
              overflow: TextOverflow.ellipsis, // recorta con ...
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 6),

            // Precio del producto
            Text(
              '\$${product.price.toStringAsFixed(2)}',
              style: const TextStyle(
                color: Colors.green,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}