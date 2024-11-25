import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

import 'combo.dart';
import 'meal.dart';
import 'meal_type.dart';

class MealRepository
{
  Future<Meal> getAllCombos(MealType type) async {
    Meal meal = Meal();

    try {
      String mealName = type.toString().split('.').last;

      var url = Uri.parse("http://10.0.2.2:8080/api/v1/meal/$mealName");
      var response = await http.get(url);
      
      if (response.statusCode == 200) {
        meal = Meal.fromJson(jsonDecode(response.body));
        return meal;
      }
      
    } catch (e) {
        log("Error: $e, Method Call: getAllCombos");
    }

    return meal;
  }

  Future<Combo?> getComboById(MealType type, int id) async {
    Combo? combo = Combo();

    try {
      String mealName = type.toString().split('.').last;


      var url = Uri.parse("http://10.0.2.2:8080/api/v1/meal/$mealName/$id");
      var response = await http.get(url);

      if (response.statusCode == 200) {
        combo = Combo.fromJson(jsonDecode(response.body));
        return combo;
      }
    } catch (e) {
      log("Error: $e, Method Call: getComboById");
    }

    return combo;
  }

  Future<String> placeOrder(MealType type, int id) async {
    String msg = "";

    try {
      String mealName = type.toString().split('.').last;


      var url = Uri.parse("http://10.0.2.2:8080/api/v1/meal/$mealName/$id");
      var response = await http.post(url);

      if (response.statusCode == 200) {
        msg = response.body;
        return msg;
      }
    } catch (e) {
      log("Error: $e, Method Call: placeOrder");
    }

    return msg;
  }
}