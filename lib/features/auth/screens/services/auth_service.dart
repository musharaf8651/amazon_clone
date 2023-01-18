import 'package:amazon_clone/constants/error_handling.dart';
import 'package:amazon_clone/constants/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:amazon_clone/models/user.dart';
import 'package:http/http.dart' as http;
import 'package:amazon_clone/constants/Global_variables.dart';

class AuthService {
  //signup

  void signupUser(
      {required BuildContext context,
      required String email,
      required String password,
      required String name}) async {
    try {
      User user = User(
          email: email,
          id: '',
          name: name,
          password: password,
          address: '',
          type: '',
          token: '');
      http.Response res = await http.post(
        Uri.parse('$uri/api/signup'),
        body: user.toJson(),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      httpErrorHAndling(
        response: res,
        context: context,
        onSuccess: () {
          showSnackBar(
            context,
            'Account created succesull ',
          );
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
