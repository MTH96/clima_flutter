import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';

class NetworkHelper {
  final String url;

  NetworkHelper({@required this.url});

  Future getData() async {
    http.Response response = await http.get(url);
//TODO handel SocketException: Failed host lookup: no enternet(pop up an exit)

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      print(response.statusCode);
    }
  }
}
