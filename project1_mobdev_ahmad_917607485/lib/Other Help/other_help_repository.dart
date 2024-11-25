import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:project1_mobdev_ahmad_917607485/Other%20Help/help_request.dart';

class OtherHelpRepository 
{
  Future<HelpRequest> logHelpRequest(HelpRequest helpRequest) async {
    try {
      var url = Uri.parse("http://10.0.2.2:8080/api/v1/help");
      var response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Accept': 'application/json'
        },
        body: jsonEncode(helpRequest.toJson()),
      );

      if (response.statusCode == 200) {
        log("Success");
        return HelpRequest.fromJson(jsonDecode(response.body));
      }
    } catch (e) {
      log("Help Request Error: $e");
    }

    return HelpRequest();
  }
}