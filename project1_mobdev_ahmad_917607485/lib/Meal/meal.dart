import 'dart:convert';

import 'combo.dart';
import 'meal_type.dart';

class Meal {
  late MealType type;
  late List<Combo> combos = [];
  Meal();

  Meal.fromJson(Map<String, dynamic> json) {
    var typeAsString = json['type'];
    type = parseStringToMealType(typeAsString);
    
    Iterable combosJson = jsonDecode(jsonEncode(json['combos']));

    combos = List<Combo>.from(combosJson.map((data) => Combo.fromJson(data)));
  }

  Map<String, dynamic> toJson() => {
    'type': parseMealTypeToString(type),
    'combos': combos
  };

  String parseMealTypeToString(MealType mealType) {
    switch (mealType) {
      case MealType.breakfast:
        return 'breakfast';
      case MealType.lunch:
        return 'lunch';
      case MealType.dinner:
        return 'dinner';
    }
  }

  MealType parseStringToMealType(String mealType) {
    switch (mealType) {
      case "lunch":
        return MealType.lunch;
      case "breakfast":
        return MealType.breakfast;
      case "dinner":
        return MealType.dinner;
    }
      
    throw Exception;
  }

  MealType getType() {
		return type;
	}

	void setType(MealType type) {
		this.type = type;
	}

	List<Combo> getCombos() {
		return combos;
	}

	void setCombos(List<Combo> combos) {
		this.combos = combos;
	}
}