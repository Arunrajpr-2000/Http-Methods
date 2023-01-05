import 'dart:convert';

import 'package:http/http.dart' as http;

const String baseUrl = 'https://63b65f1c58084a7af3b0471d.mockapi.io/api/';

class BaseClient {
  var Client = http.Client();

  //Get Method------------>
  Future<dynamic> get(String api) async {
    var uri = Uri.parse(baseUrl + api);
    var header = {
      'Authorization': 'Bearer sfie328370428387=',
      'api_key': 'ief873fj38uf38uf83u839898989',
    };

    var response = await Client.get(uri, headers: header);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      //Throw an exception in UI
    }
  }

  //Post Method------------>
  Future<dynamic> post(String api, dynamic object) async {
    var uri = Uri.parse(baseUrl + api);
    var header = {
      'Authorization': 'Bearer sfie328370428387=',
      'api_key': 'ief873fj38uf38uf83u839898989',
      'Content-Type': 'application/json'
    };
    var _payload = json.encode(object);
    var response = await Client.post(uri, body: _payload, headers: header);
    if (response.statusCode == 201) {
      return response.body;
    } else {
      //Throw an exception in UI
    }
  }
  //
  //Put Method------------>

  Future<dynamic> put(String api, dynamic object) async {
    var uri = Uri.parse(baseUrl + api);
    var header = {
      'Authorization': 'Bearer sfie328370428387=',
      'api_key': 'ief873fj38uf38uf83u839898989',
      'Content-Type': 'application/json'
    };
    var _payload = json.encode(object);
    var response = await Client.put(uri, body: _payload, headers: header);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      //Throw an exception in UI
    }
  }

  //Delete Method------------>

  Future<dynamic> delete(String api) async {
    var uri = Uri.parse(baseUrl + api);
    // var header = {
    //   'Authorization': 'Bearer sfie328370428387=',
    //   'api_key': 'ief873fj38uf38uf83u839898989',
    // };

    var response = await Client.delete(
      uri,
    );
    if (response.statusCode == 200) {
      return response.body;
    } else {
      //Throw an exception in UI
    }
  }
}
