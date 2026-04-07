// Clase que representa la calificación de un producto
class Rating {
  final double rate;
  final int count;

  Rating({
    required this.rate,
    required this.count,
  });

  // Convierte JSON en objeto Rating
  factory Rating.fromJson(Map<String, dynamic> json) {
    return Rating(
      rate: (json['rate'] as num).toDouble(),
      count: json['count'],
    );
  }

  // Convierte Rating a JSON
  Map<String, dynamic> toJson() {
    return {
      'rate': rate,
      'count': count,
    };
  }
}

// Clase principal del producto
class Product {
  final int? id; // opcional
  final String title;
  final double price;
  final String description;
  final String category;
  final String image;
  final Rating? rating; // opcional

  Product({
    this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    this.rating,
  });

  // Convierte JSON en Product
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      price: (json['price'] as num).toDouble(),
      description: json['description'],
      category: json['category'],
      image: json['image'] ?? '',
      rating: json['rating'] != null
          ? Rating.fromJson(json['rating'])
          : null,
    );
  }

  // Convierte Product a JSON
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'price': price,
      'description': description,
      'category': category,
      'image': image,
    };
  }
}