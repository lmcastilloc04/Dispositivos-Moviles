import 'package:flutter/material.dart';
import '../models/product.dart';
import '../services/api_service.dart';
import '../widgets/product_card.dart';
import 'create_product_screen.dart';
import 'product_detail_screen.dart';

// Pantalla principal donde se listan los productos
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Future que almacenará la consulta de productos
  late Future<List<Product>> _productsFuture;

  @override
  void initState() {
    super.initState();
    // Cargamos los productos al iniciar la pantalla
    _productsFuture = ApiService.getProducts();
  }

  // Método para recargar los productos
  void _reloadProducts() {
    setState(() {
      _productsFuture = ApiService.getProducts();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Barra superior
      appBar: AppBar(
        title: const Text('Tienda Flutter'),
        centerTitle: true,
      ),

      // FutureBuilder construye la interfaz según el estado del Future
      body: FutureBuilder<List<Product>>(
        future: _productsFuture,
        builder: (context, snapshot) {
          // Mientras carga la información
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          // Si ocurre un error
          if (snapshot.hasError) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.error_outline,
                      size: 60,
                      color: Colors.red,
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      'Ocurrió un error al cargar los productos.',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: _reloadProducts,
                      child: const Text('Reintentar'),
                    ),
                  ],
                ),
              ),
            );
          }

          // Si no hay datos
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Text('No hay productos disponibles'),
            );
          }

          // Lista de productos obtenidos
          final products = snapshot.data!;

          // Mostrar productos en cuadrícula
          return Padding(
            padding: const EdgeInsets.all(10),
            child: GridView.builder(
              itemCount: products.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.68,
              ),
              itemBuilder: (context, index) {
                final product = products[index];

                return GestureDetector(
                  onTap: () {
                    // Navegación al detalle
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ProductDetailScreen(product: product),
                      ),
                    );
                  },
                  child: ProductCard(product: product),
                );
              },
            ),
          );
        },
      ),

      // Botón flotante para crear producto
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // Esperamos a que la pantalla de crear producto se cierre
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CreateProductScreen(),
            ),
          );

          // Al volver, recargamos la lista
          _reloadProducts();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}