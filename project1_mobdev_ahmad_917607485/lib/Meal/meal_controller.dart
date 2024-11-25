

import 'dart:developer';

import 'combo.dart';
import 'meal.dart';
import 'meal_repository.dart';
import 'meal_type.dart';

class MealController 
{
  MealController();
  final MealRepository _mealRepo = MealRepository();

  Future<Meal> getAllCombos(MealType type) {
    var name = type.name;
    log("User MealType passed: $name");
    return _mealRepo.getAllCombos(type);
  }

  Future<Combo?> getComboById(MealType type, int id) {
    var name = type.name;
    log("User MealType, ID passed: $name, $id");
    return _mealRepo.getComboById(type, id);
  }

  Future<String> placeOrder(MealType type, int id) {
    var name = type.name;
    log("User MealType, ID passed: $name, $id");
    return _mealRepo.placeOrder(type, id);
  }
}