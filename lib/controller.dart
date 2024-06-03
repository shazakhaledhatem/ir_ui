import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class CallApi {
  var serverUrl = "http://192.168.14.9:5000";

  chooseDataSet(String dataSet, String query) async {
    String myUrl = "${serverUrl}/search";
    var response;
    try {
      print("sobhi");
      response = await http.post(
        Uri.parse(myUrl),
        body: { 
          "query": query,
          "dataset": dataSet,
        },
      );
    } catch (error) {
      print("the error is " + "$error");
    }
  }

  Future<List<String>> getDocuments() async {
    var myUrl = "${serverUrl}/search";

    var response = await http.get(
      Uri.parse(myUrl),
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);
      if (data['results'] != null) {
        List<String> documents = List<String>.from(
            data['results'] as List<dynamic>);
        print("helo");
        return documents;
      } else {
        print('empty');
        return []; // Return an empty list or handle it as needed
      }
    } else {
      throw Exception('Failed to get documents');
    }
  }
}
