import 'package:test_kerja_popaket_flutter/src/model/category.dart';
import 'package:test_kerja_popaket_flutter/src/model/product.dart';

class AppData {
  static List<Product> productList = [
    Product(
        id: 1,
        name: 'Nike Air Max 200',
        description: "Built for natural motion, the Nike Flex Shoes",
        price: 240.00,
        isSelected: true,
        isliked: true,
        image: 'assets/shooe_tilt_1.png',
        disc: "40%",
        rating: 4.5),
    Product(
        id: 2,
        name: 'Nike Air Max 97',
        description: "Built for natural motion, the Nike Flex Shoes",
        price: 260.00,
        isliked: false,
        image: 'assets/shoe_tilt_2.png',
        rating: 3.5),
    Product(
        id: 3,
        name: 'Nike Air Max 200',
        description: "Built for natural motion, the Nike Flex Shoes",
        price: 290.00,
        isSelected: true,
        isliked: true,
        image: 'assets/shooe_tilt_1.png',
        disc: "30%",
        rating: 4.0),
    Product(
        id: 4,
        name: 'Nike Air Max 97',
        description: "Built for natural motion, the Nike Flex Shoes",
        price: 270.00,
        isliked: false,
        image: 'assets/shoe_tilt_2.png',
        rating: 3.0),
  ];

  static List<Category> categoryList = [
    Category(
        id: 1,
        name: "Sneakers",
        image: 'assets/shoe_thumb_2.png',
        isSelected: true),
    Category(id: 2, name: "Backpack", image: 'assets/backpack.png'),
    Category(id: 3, name: "Watch", image: 'assets/watch.png'),
  ];
}
