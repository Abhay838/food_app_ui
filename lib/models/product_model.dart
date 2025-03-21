class MyProductModel {
  final String image, name, category;
  final double price, rate, distance;

  MyProductModel({
    required this.image,
    required this.name,
    required this.price,
    required this.rate,
    required this.category,
    required this.distance,
  });
}

//For ramen
List<MyProductModel> myProductModel = [
  MyProductModel(
      image: 'assets/ramen/sapporo_miso_ramen.png',
      name: "Sapporo Miso",
      price: 3.9,
      rate: 5,
      category: 'Ramen',
      distance: 150),
  MyProductModel(
      image: 'assets/ramen/fullset_ramen.png',
      name: "Fullset Ramen",
      price: 5.9,
      rate: 4.7,
      category: 'Ramen',
      distance: 400),
  MyProductModel(
      image: 'assets/ramen/kurume_ramen.png',
      name: "Kurume Ramen",
      price: 4.3,
      rate: 4.9,
      category: 'Ramen',
      distance: 600),
  MyProductModel(
      image: 'assets/ramen/hakata_ramen.png',
      name: "Hakata Ramen",
      price: 3.9,
      rate: 4.8,
      category: 'Ramen',
      distance: 400),
  MyProductModel(
      image: 'assets/ramen/shrimp_fried_rice.png',
      name: "Shrimp Fried Rice",
      price: 4.9,
      rate: 4.5,
      category: 'Ramen',
      distance: 800),
  MyProductModel(
      image: 'assets/burger/grilled-beef-burger.png',
      name: "Grilled beef burger",
      price: 33.5,
      rate: 5,
      category: 'Burger',
      distance: 150),
  MyProductModel(
      image: 'assets/burger/fried-chicken-burger.png',
      name: "Fried chicken burger",
      price: 23.0,
      rate: 1.7,
      category: 'Burger',
      distance: 150),
  MyProductModel(
      image: 'assets/burger/cheese-burger.png',
      name: "Cheese burger",
      price: 40.5,
      rate: 4.5,
      category: 'Burger',
      distance: 100),
  MyProductModel(
      image: 'assets/burger/beef-burger.png',
      name: "Beef burger",
      price: 18.5,
      rate: 5,
      category: 'Burger',
      distance: 200),
];
