import 'help_type.dart';

class HelpRequest 
{
  int id = 0;
  String requesterName = "";
  String description = "";
  late DateTime timestamp;
  late HelpType type;

  HelpRequest();

  HelpRequest.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    requesterName = json['requesterName'];
    description = json['description'];
    timestamp = DateTime.parse(json['timestamp']);
    type = parseStringToHelpType(json['type']);
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'requesterName': requesterName,
    'description': description,
    'timestamp': timestamp.toIso8601String(),
    'type': parseHelpTypeToString(type)
  };

  String parseHelpTypeToString(HelpType helpType) {
    switch (helpType) {
      case HelpType.feeding:
        return "feeding";
      case HelpType.medical:
        return "medical";
      case HelpType.other:
        return "other";
    }
  }

  HelpType parseStringToHelpType(String helpType) {
    switch (helpType) {
      case "feeding":
        return HelpType.feeding;
      case "medical":
        return HelpType.medical;
      case "other":
        return HelpType.other;
    }
      
    throw Exception;
  }

  int getId() {
		return id;
	}

	void setId(int id) {
		this.id = id;
	}

	String getRequesterName() {
		return requesterName;
	}

	void setRequesterName(String requesterName) {
		this.requesterName = requesterName;
	}

	DateTime getTimestamp() {
		return timestamp;
	}

	void setTimestamp(DateTime timestamp) {
		this.timestamp = timestamp;
	}

	HelpType getType() {
		return type;
	}

	void setType(HelpType type) {
		this.type = type;
	}

	String getDescription() {
		return description;
	}

	void setDescription(String description) {
		this.description = description;
	}
}