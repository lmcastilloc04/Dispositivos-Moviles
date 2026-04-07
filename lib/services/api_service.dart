import 'dart:convert'; // Permite convertir JSON a Map y viceversa
import 'package:http/http.dart' as http; // Paquete para hacer peticiones HTTP
import '../models/product.dart'; // Importamos el modelo Product

class ApiService {
  // URL base de la API
  static const String baseUrl = 'https://fakestoreapi.com';

  // Método para obtener todos los productos
  static Future<List<Product>> getProducts() async {
    try {
      // Hacemos la petición GET al endpoint /products
      final response = await http.get(Uri.parse('$baseUrl/products'));

      // Si la respuesta es exitosa
      if (response.statusCode == 200) {
        // Decodificamos el body JSON a una lista dinámica
        final List<dynamic> data = jsonDecode(response.body);

        // Convertimos cada elemento JSON en un objeto Product
        return data.map((json) => Product.fromJson(json)).toList();
      } else {
        // Si el servidor responde con error
        throw Exception('Error al cargar los productos');
      }
    } catch (e) {
      // Si ocurre un error de red o de otro tipo
      throw Exception('No se pudo conectar con la API: $e');
    }
  }

  // Método para crear un producto
  static Future<Product> createProduct(Product product) async {
    try {
      // Hacemos la petición POST al endpoint /products
      final response = await http.post(
        Uri.parse('$baseUrl/products'),
        headers: {
          'Content-Type': 'application/json', // Indicamos que enviamos JSON
        },
        body: jsonEncode(product.toJson()), // Convertimos el objeto Product a JSON
      );

      // Si la creación fue exitosa
      if (response.statusCode == 200 || response.statusCode == 201) {
        // Decodificamos la respuesta y la convertimos a Product
        final Map<String, dynamic> data = jsonDecode(response.body);
        return Product.fromJson(data);
      } else {
        throw Exception('Error al crear el producto');
      }
    } catch (e) {
      throw Exception('No se pudo crear el producto: $e');
    }
  }
}