import 'dart:convert';
import 'dart:developer';

class Combo {
  int id = 0;
  String name = "";
  List<String> items = [];
 
  Combo();

  Combo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    
    try {
      var itemsJson = jsonDecode(jsonEncode(json['items']));

      items = List<String>.from(itemsJson as List);
    } catch (e) {
      log("Error parsing items: $e");
    }
    
  }

  int getId() {
		return id;
	}

	void setId(int id) {
		this.id = id;
	}

	String getName() {
		return name;
	}

	void setName(String name) {
		this.name = name;
	}

	List<String> getItems() {
		return items;
	}

  void setItems(List<String> items) {
		this.items = items;
	}
}