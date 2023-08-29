import 'dart:convert';
import 'package:http/http.dart';
import 'package:bhavnagar_darbar_bording/Extra/Constant.dart';

// https://mobikul.com/http-api-calling-in-flutter/
// https://www.loginradius.com/blog/engineering/guest-post/authenticating-flutter-apps/
// https://www.tutorialspoint.com/flutter/flutter_accessing_rest_api.htm
// https://axiftaj.medium.com/flutter-implement-login-with-rest-apis-6857b356d08c
// https://medium.com/@rajajawahar77/create-your-first-api-call-in-flutter-a04d023ebd50

class HttpService {
//   final String postsURL = "https://jsonplaceholder.typicode.com/posts";
//   Future<List<User>> getPosts() async {
//     Response res = await get(Uri.parse(postsURL));
//
//     if (res.statusCode == 200) {
//       List<dynamic> body = jsonDecode(res.body);
//
//       List<User> posts = body
//           .map(
//             (dynamic item) => User.fromJson(item),
//           )
//           .toList();
//
//       return posts;
//     } else {
//       throw "Unable to retrieve posts.";
//     }
//   }

  //final Dio _dio = Dio();

  // final Response res;

  //final HttpService _apiClient = HttpService();
  Future<Response> loginWithPhoneNumber(String mobileNumber) async {
    Response response = await post(
      Uri.parse(BaseURL.login), //ENDPONT URL
      body: {
        'mobile': mobileNumber,
      },
    );
    //returns the successful json object
    print('Login Call API Return');
    return response;

    // try {
    //
    // } catch (e) {
    //   //returns the error object if there is
    //   return
    // }
  }

  /*Future<void> loginWithPhoneNumber(String mobileNumber) async {
    try {
      Response response = await post(
        Uri.parse(BaseURL.login),
        body: {
          'mobile': mobileNumber,
        },
      );

      if (response.statusCode == 200) {
        String jsonsDataString = response.body.toString();
        var loginResponseData = jsonDecode(jsonsDataString);

        print('Call back');
        return loginResponseData;
      } else {
        print('Failed');
      }
    } catch (e) {
      print(e.toString());
    }
  }*/
  /*void loginWithPhoneNumber(String mobileNumber) async {
    try {
      Response response = await post(
        Uri.parse(BaseURL.login),
        body: {
          'mobile': mobileNumber,
        },
      );

      if (response.statusCode == 200) {
        print('Login Succes');

        String jsonsDataString = response.body.toString();
        var loginResponseData = jsonDecode(jsonsDataString);

        print('Response: $loginResponseData');
        print(loginResponseData['message']);
      } else {
        print('Failed');
      }
    } catch (e) {
      print(e.toString());
    }
  }*/
}
