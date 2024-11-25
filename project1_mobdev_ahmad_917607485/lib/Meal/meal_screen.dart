

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:project1_mobdev_ahmad_917607485/Meal/meal_controller.dart';

import '../Home/home_screen.dart';
import '../main.dart';
import 'combo.dart';
import 'meal.dart';
import 'meal_type.dart';

class MealScreen extends StatefulWidget {
  final String username;

  const MealScreen({super.key, required this.username});

  @override
  MealScreenState createState() => MealScreenState();
}

class MealScreenState extends State<MealScreen> {
  final MealController _mealController = MealController();
  MealType currentMenu = MealType.lunch;
  List<bool> mealSelections = List.generate(3, (_) => false);
  List<Widget> mealTypes = <Widget>[
    const Text(
      'Breakfast',
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    ),
    const Text(
      'Lunch',
      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
    ),
    const Text(
      'Dinner',
      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
    )
  ];

  @override
  void initState() {
    super.initState();
    mealSelections[1] = true;
  }

  @override
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: Colors.white,
    appBar: createAppBar(context),
    drawer: createDrawer(context, widget.username),
    body: Column(
      children: [
        createUsernameSection(widget.username),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ToggleButtons(
                isSelected: mealSelections,
                borderRadius: BorderRadius.circular(12),
                selectedBorderColor: Colors.red[900],
                borderWidth: 7,
                color: Colors.red,
                selectedColor: Colors.white,
                fillColor: Colors.red,
                constraints: const BoxConstraints(
                  minHeight: 100,
                  minWidth: 100,
                ),
                children: mealTypes,
                onPressed: (int index) {
                  setState(() {
                    for (int i = 0; i < mealSelections.length; i++) {
                      mealSelections[i] = (i == index);
                    }

                    if (index == 0) {
                      currentMenu = MealType.breakfast;
                    } else if (index == 1) {
                      currentMenu = MealType.lunch;
                    } else if (index == 2) {
                      currentMenu = MealType.dinner;
                    }
                  });
                },
              ),
            ],
          ),
        ),
        Expanded(
          child: displayMenu(), 
        ),
        Row(
          children: [
            const SizedBox(width: 90),
            createBackWidget(context),
            const SizedBox(width: 90),
            createImage('assets/images/CareMateLogo.png', 75, 70)
          ],
        ),
      ],
    ),
  );
}

  Widget displayMenu() {
  return FutureBuilder<Column>(
    future: createMenu(), 
    builder: (BuildContext context, AsyncSnapshot<Column> snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return const Center(child: CircularProgressIndicator());
      } else if (snapshot.hasError) {
        return Center(child: Text("Error: ${snapshot.error}"));
      } else if (snapshot.hasData) {
        return snapshot.data!;
      } else {
        return const Center(child: Text("No menu available"));
      }
    },
  );
}

  Future<Column> createMenu() async {
  switch (currentMenu) {
    case MealType.breakfast:
      return createBreakfastMenu();
    case MealType.lunch:
      return createLunchMenu();
    case MealType.dinner:
      return createDinnerMenu();
    default:
      return const Column(
        children: [Text('No menu selected')],
      );
  }
}

  ElevatedButton createMealTypeButton(
      String text, VoidCallback onPressed, double width, double height) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          fixedSize: Size(width, height),
          backgroundColor: Colors.red,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(7))),
      child: Text(
        text,
        style: const TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 22),
        textAlign: TextAlign.center,
      ),
    );
  }

  Future<Column> createBreakfastMenu() async {
    Meal meal = await _mealController.getAllCombos(MealType.breakfast);
    List<Combo> combos = meal.getCombos();

    return Column(
      children: [
        createMeal(combos[0], 'assets/images/breakfast_burrito_meal.jpg', 100, 100, 150),
        const SizedBox(height: 10),
        createMeal(combos[1],
            'assets/images/french_toast_meal.jpg', 100, 100, 150),
        const SizedBox(height: 10),
        createMeal(combos[2], 'assets/images/omelette_meal.jpg',
            100, 100, 150),
        const SizedBox(height: 10),
        createMeal(
            combos[3], 'assets/images/pancakes_meal.png', 100, 100, 150)
      ],
    );
  }

  Future<Column> createLunchMenu() async {
    Meal meal = await _mealController.getAllCombos(MealType.lunch);
    List<Combo> combos = meal.getCombos();

    return Column(
      children: [
        createMeal(combos[0], 'assets/images/fillet_meal.jpeg', 100,
            100, 150),
        const SizedBox(height: 12),
        createMeal(combos[1], 'assets/images/pizza_meal.jpg', 100, 100, 150),
        const SizedBox(height: 12),
        createMeal(
            combos[2], 'assets/images/sub_meal.JPG', 100, 100, 150),
        const SizedBox(height: 12),
        createMeal(combos[3], 'assets/images/pasta_meal.jpg', 100, 100, 150)
      ],
    );
  }

  Future<Column> createDinnerMenu() async {
    Meal meal = await _mealController.getAllCombos(MealType.dinner);
    List<Combo> combos = meal.getCombos();

    return Column(
      children: [
        createMeal(combos[0],
            'assets/images/salmon_meal.jpg', 100, 100, 150),
        const SizedBox(height: 10),
        createMeal(combos[1], 'assets/images/shrimp_spaghetti.jpg',
            100, 100, 150),
        createMeal(combos[2], 'assets/images/steak_meal.jpeg',
            100, 100, 150),
        createMeal(
            combos[3], 'assets/images/taco_meal.jpg', 100, 100, 150),
      ],
    );
  }

    Row createMeal(Combo combo, String path, double imageWidth,
      double imageHeight, double textBoxWidth) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: createMenuImage(path, imageWidth, imageHeight),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 15),
          child: Column(
            children: [
              SizedBox(
                width: textBoxWidth,
                child: Text(
                  textAlign: TextAlign.center,
                  combo.name,
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.red[900]),
                ),
              ),
              const SizedBox(height: 0),
              createButton('Order', 
              () async {
                  var response = await _mealController.placeOrder(currentMenu, combo.id);
                  log(response);

                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Order Status'),
                        content: const Text(
                                  'Successfully ordered!',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold, 
                                    color: Colors.red,           
                                    fontSize: 18,                
                                  ),
                        ),
                        actions: [
                          TextButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(Colors.red),
                            ),
                            onPressed: () {
                              Navigator.of(context).pop(); 
                            },
                            child: const Text(
                              'OK',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  );
                },
               100)
            ],
          ),
        ),
      ],
    );
  }

  Container createMenuImage(String path, double width, double height) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.red, width: 5),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Image(
        image: AssetImage(path),
        width: width,
        height: height,
        fit: BoxFit.fill,
      ),
    );
  }

  Column createBackWidget(BuildContext context) {
    return Column(
      children: [
        IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_circle_left,
              size: 50,
              color: Colors.red,
            )),
        const Text(
          'Back',
          style: TextStyle(
            color: Colors.red,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  ElevatedButton createButton(String text, VoidCallback onPressed, double width_size) {
  return ElevatedButton(
    onPressed: onPressed,
    style: ElevatedButton.styleFrom(
        fixedSize: Size.fromWidth(width_size),
        backgroundColor: Colors.red,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7))),
    child: Text(
      text,
      style: const TextStyle(color: Colors.white),
      textAlign: TextAlign.center,
    ),
  );
}
}
