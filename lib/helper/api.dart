// ignore_for_file: avoid_print

import 'package:dio/dio.dart';

class Api {
  final Dio dio;
  Api(this.dio);

//get request
  Future<dynamic> get({required String url, dynamic token}) async {
    Map<String, String> headers = {};
    if (token != null) {
      headers.addAll(
        {
          'Authorization': 'Bearer $token',
        },
      );
    }
    Response response = await dio.get(
      url,
      options: Options(headers: headers),
    );

    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception(
        'There is an error with status code ${response.statusCode}',
      );
    }
  }

//post request
  Future<dynamic> post(
      {required String url, dynamic body, dynamic token}) async {
    Map<String, String> headers = {};
    if (token != null) {
      headers.addAll(
        {
          'Authorization': 'Bearer $token',
        },
      );
    }
    print('url =$url,body = $body,token = $token');
    Response response = await Dio().post(
      url,
      data: body,
      options: Options(
        headers: headers,
      ),
    );
    if (response.statusCode == 201) {
      Map<String, dynamic> data = response.data;
      print(data);

      return data;
    } else {
      throw Exception(
        'There is an error with status code ${response.statusCode}, with body ${response.data}',
      );
    }
  }

  //put request
  Future<dynamic> put(
      {required String url, dynamic body, dynamic token}) async {
    Map<String, String> headers = {
      "Content-Type": "application/x-www-form-urlencoded",
    };
    if (token != null) {
      headers.addAll(
        {
          'Authorization': 'Bearer $token',
        },
      );
    }
    print('url =$url,body = $body,token = $token');
    Response response = await Dio().put(
      url,
      data: body,
      options: Options(
        headers: headers,
      ),
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> data = response.data;
      print(data);
      return data;
    } else {
      throw Exception(
        'There is an error with status code ${response.statusCode}, with body ${response.data}',
      );
    }
  }
}
