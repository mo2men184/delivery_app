class FoodModel {
  final String name;
  final double price;
  final double weight;
  final double calory;
  final double protein;
  final String item;
  final String imgPath;

  FoodModel(
      {required this.name,
      required this.price,
      required this.weight,
      required this.calory,
      required this.protein,
      required this.item,
      required this.imgPath});

  static List<FoodModel> list = [
    FoodModel(
      name: "Tacos Nanchas Choco",
      price: 120,
      weight: 130,
      calory: 460,
      protein: 30,
      item:
          "#Chicken #Juicy BBQ #Vegetables #Potato Wedges #Coleslaw Salad #Healthy Yolk #Spicy Fries #Mushroom",
      imgPath: "1-2.png",
    ),
    FoodModel(
      name: "Porata Masala",
      price: 100,
      weight: 120,
      calory: 300,
      protein: 45,
      item:
          "#Chicken #Juicy BBQ #Vegetables #Potato Wedges #Coleslaw Salad #Healthy Yolk #Spicy Fries #Mushroom",
      imgPath: "2-2.png",
    ),
    FoodModel(
      name: "Taco Kebab",
      price: 90,
      weight: 100,
      calory: 320,
      protein: 150,
      item:
          "#Chicken #Juicy BBQ #Vegetables #Potato Wedges #Coleslaw Salad #Healthy Yolk #Spicy Fries #Mushroom",
      imgPath: "3-2.png",
    ),
    FoodModel(
      name: "Chicken Salad",
      price: 50,
      weight: 30,
      calory: 65,
      protein: 50,
      item:
          "#Chicken #Juicy BBQ #Vegetables #Potato Wedges #Coleslaw Salad #Healthy Yolk #Spicy Fries #Mushroom",
      imgPath: "4-2.png",
    ),
    FoodModel(
      name: "Chicken Eggs",
      price: 20,
      weight: 30,
      calory: 120,
      protein: 310,
      item:
          "#Chicken #Juicy BBQ #Vegetables #Potato Wedges #Coleslaw Salad #Healthy Yolk #Spicy Fries #Mushroom",
      imgPath: "5-2.png",
    ),
  ];
}
