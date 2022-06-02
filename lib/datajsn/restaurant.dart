import 'dart:convert';

Restaurants restaurantsFromJson(String? str) =>
    Restaurants.fromJson(json.decode(str!));

class Restaurants {
  Restaurants({
    required this.restaurants,
  });

  List<Restaurant> restaurants;

  factory Restaurants.fromJson(Map<String, dynamic> json) => Restaurants(
    restaurants: List<Restaurant>.from(
        json["restaurants"].map((json) => Restaurant.fromJson(json))),
  );
}

class Restaurant {
  Restaurant({
    required this.id,
    required this.name,
    required this.description,
    required this.pictureId,
    required this.city,
    required this.rating,
    required this.menus,
  });

  String id;
  String name;
  String description;
  String pictureId;
  String city;
  double rating;
  Menus menus;

  factory Restaurant.fromJson(Map<String, dynamic> json) => Restaurant(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    pictureId: json["pictureId"],
    city: json["city"],
    rating: json["rating"].toDouble(),
    menus: Menus.fromJson(json["menus"]),
  );
}

class Menus {
  Menus({
    required this.foods,
    required this.drinks,
  });

  List<Drink> foods;
  List<Drink> drinks;

  factory Menus.fromJson(Map<String, dynamic> json) => Menus(
    foods:
    List<Drink>.from(json["foods"].map((json) => Drink.fromJson(json))),
    drinks: List<Drink>.from(
        json["drinks"].map((json) => Drink.fromJson(json))),
  );
}

class Drink {
  Drink({
    required this.name,
  });

  String name;

  factory Drink.fromJson(Map<String, dynamic> json) => Drink(
    name: json["name"],
  );
}
