import 'dart:convert';

import 'package:amazon_clone/constants/utils.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

Future<void> httpErrorHAndling({
  required http.Response response,
  required BuildContext context,
  required VoidCallback onSuccess,
}) async {
  switch (response.statusCode) {
    case 200:
      onSuccess();
      break;
    case 400:
      showSnackBar(
        context,
        jsonDecode(response.body)['msg'],
      );
      break;
    case 500:
      showSnackBar(
        context,
        jsonDecode(response.body)['error'],
      );
      break;
    default:
      showSnackBar(
        context,
        jsonDecode(response.body),
      );
  }
}
