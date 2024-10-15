import 'package:flutter/material.dart';
import 'package:project1_mobdev_ahmad_917607485/Login/login_screen.dart';

import '../Emergency/emergency_help_screen.dart';
import '../Home/home_screen.dart';
import '../main.dart';

enum MealType { breakfast, lunch, dinner }

class MealScreen extends StatefulWidget {
  final String username;

  const MealScreen({super.key, required this.username});

  @override
  MealScreenState createState() => MealScreenState();
}

class MealScreenState extends State<MealScreen> {
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
                        setState(() {
                          currentMenu = MealType.breakfast;
                        });
                      } else if (index == 1) {
                        setState(() {
                          currentMenu = MealType.lunch;
                        });
                      } else if (index == 2) {
                        setState(() {
                          currentMenu = MealType.dinner;
                        });
                      }
                    });
                  },
                ),
              ],
            ),
          ),
          displayMenu(),
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

  Column displayMenu() {
    if (currentMenu == MealType.breakfast) {
      return createBreakfastMenu();
    } else if (currentMenu == MealType.lunch) {
      return createLunchMenu();
    } else {
      return createDinnerMenu();
    }
  }

  Column createBreakfastMenu() {
    return Column(
      children: [
        createMeal('Breakfast Burrito',
            'assets/images/breakfast_burrito_meal.jpg', 100, 100, 150),
        const SizedBox(height: 10),
        createMeal('French toast with Berries',
            'assets/images/french_toast_meal.jpg', 100, 100, 150),
        const SizedBox(height: 10),
        createMeal('Omelette & Potatoes', 'assets/images/omelette_meal.jpg',
            100, 100, 150),
        const SizedBox(height: 10),
        createMeal(
            'Pancake platter', 'assets/images/pancakes_meal.png', 100, 100, 150)
      ],
    );
  }

  Column createLunchMenu() {
    return Column(
      children: [
        createMeal('Chicken Fillet Meal', 'assets/images/fillet_meal.jpeg', 100,
            100, 150),
        const SizedBox(height: 12),
        createMeal('Pizza', 'assets/images/pizza_meal.jpg', 100, 100, 150),
        const SizedBox(height: 12),
        createMeal(
            'Sandwich Meal', 'assets/images/sub_meal.JPG', 100, 100, 150),
        const SizedBox(height: 12),
        createMeal('Pasta', 'assets/images/pasta_meal.jpg', 100, 100, 150)
      ],
    );
  }

  Column createDinnerMenu() {
    return Column(
      children: [
        createMeal('Salmon, rice, and broccoli',
            'assets/images/salmon_meal.jpg', 100, 100, 150),
        const SizedBox(height: 10),
        createMeal('Shrimp Spaghetti', 'assets/images/shrimp_spaghetti.jpg',
            100, 100, 150),
        createMeal('Steak & Mashed Potatoes', 'assets/images/steak_meal.jpeg',
            100, 100, 150),
        createMeal(
            'Chicken Tacos', 'assets/images/taco_meal.jpg', 100, 100, 150),
      ],
    );
  }

  Row createMeal(String mealName, String path, double imageWidth,
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
                  mealName,
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.red[900]),
                ),
              ),
              const SizedBox(height: 0),
              createButton('Order', () {}, 100)
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
}
