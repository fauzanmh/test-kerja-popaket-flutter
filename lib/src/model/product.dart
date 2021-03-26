class Product {
  int id;
  String name;
  String disc;
  String description;
  String image;
  double price;
  double rating;
  bool isliked;
  bool isSelected;
  Product(
      {this.id,
      this.name,
      this.description,
      this.price,
      this.isliked,
      this.isSelected = false,
      this.image,
      this.disc = '',
      this.rating = 0});
}
