// class Product {
//   final String name;
//   final String description;
//    String? productImage;
//   final double sellingPrice;

//   Product({
//     required this.name,
//     required this.description,
//     this.productImage,
//     required this.sellingPrice,
//   });

//   factory Product.fromJson(Map<String, dynamic> json) {
//     // Extract the first photo URL if available
//     String? photoUrl;
//     if (json['photos'] != null && (json['photos'] as List).isNotEmpty) {
//       photoUrl = json['photos'][0]['url'];
//     } else {
//       photoUrl = null; // Use null if no photo is available
//     }

//     return Product(
//       name: json['name'] ?? '',
//       description: json['description'] ?? '',
//       productImage: photoUrl,
//       sellingPrice: (json['current_price']?[0]?['NGN']?[0] ?? 0.0) as double,
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'name': name,
//       'description': description,
//       'productImage': productImage,
//       'sellingPrice': sellingPrice,
//     };
//   }
// }


class Category {
  final String id;
  final String name;

  Category({
    required this.id,
    required this.name,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}

class Product {
  final String name;
  final String description;
  String? productImage;
  final double sellingPrice;
  final List<Category> categories;

  Product({
    required this.name,
    required this.description,
    this.productImage,
    required this.sellingPrice,
    required this.categories,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    // Extract the first photo URL if available
    String? photoUrl;
    if (json['photos'] != null && (json['photos'] as List).isNotEmpty) {
      photoUrl = json['photos'][0]['url'];
    } else {
      photoUrl = null; // Use null if no photo is available
    }

    // Parse categories
    List<Category> categories = [];
    if (json['categories'] != null) {
      categories = (json['categories'] as List)
          .map((categoryJson) => Category.fromJson(categoryJson))
          .toList();
    }

    return Product(
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      productImage: photoUrl,
      sellingPrice: (json['current_price'][0]['NGN']?[0] ?? 0.0) as double,
      categories: categories,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'productImage': productImage,
      'sellingPrice': sellingPrice,
      'categories': categories.map((category) => category.toJson()).toList(),
    };
  }
}