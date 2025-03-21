import 'dart:developer';

import 'package:cvcar_mobile/app/api/api_routes.dart';
import 'package:cvcar_mobile/app/routes/app_pages.dart';
import 'package:cvcar_mobile/app/utils/handle_error.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:get_storage/get_storage.dart';

class ApiClient extends GetConnect implements GetxService {
  late String token; // token

  FormData? form;

  String? appBaseUrl; // url
  final box = GetStorage();
  // GetStorage help you to store app data in memory

  get apiBaseUrl {
    ApiRoutes.PROD_BASE_URL;
    return appBaseUrl;
  }

  ApiClient({this.appBaseUrl}) {
    httpClient.baseUrl = apiBaseUrl;
    // httpClient it is to make the https request to the server

    httpClient.addRequestModifier((Request request) {
      // when we make a request to the server we interfere with a RequestModifier
      //we show our token
      final token = box.read('access_token');
      if (ApiRoutes.API_PATH + ApiRoutes.LOGIN_PATH != request.url.path) {
        request.headers['Authorization'] = "Bearer $token";
        request.headers['accept'] = "text/plain";
        request.headers['Accept-Encoding'] = "gzip, deflate, br";
        request.headers['Accept-Language'] = "en-US,en;q=0.9";
        request.headers['Connection'] = "keep-alive";
      }

      //give access to the bearer of this token.
      return request;
    });

    httpClient.addAuthenticator((Request request) async {
      try {
        final token = box.read('access_token');
        // Set the header
        request.headers['Authorization'] = "Bearer $token";
      } catch (e, stackTrace) {
        handleError(e, stackTrace);
        box.remove('access_token');
        Get.offNamed(Routes.LOGIN);
      }

      return request;
    });

    //Authenticator will be called 3 times if HttpStatus is
    //HttpStatus.unauthorized
    httpClient.timeout = const Duration(seconds: 20);
    httpClient.maxAuthRetries = 3;
  }

//method get
  Future<Response> getData(
      //parameters
      String uri,
      {Map<String, dynamic>? query,
      String? contenType,
      Map<String, String>? headers,
      Function? decoder}) async {
    Response? response;

    try {
      response = await get(
        uri,
        contentType: contenType,
        query: query,
        headers: headers,
      );

      return response;
    } catch (e, stackTrace) {
      handleError(e, stackTrace);
      rethrow;
    }
  }

//method post

  Future<Response> postData(url, [body]) async {
    Response? response;
    try {
      print("url: $url");
      response = await post(url, body);
      return response;
    } catch (e, stackTrace) {
      handleError(e, stackTrace);
      rethrow;
    }
  }

  Future<Response> postMultiPartData(url, body, images) async {
    Response? response;
    Map<String, dynamic> imagesCollection = {};

    for (var imageFile in images) {
      MultipartFile f = MultipartFile(await imageFile['content'],
          filename: imageFile['filename'], contentType: "image/png");
      imagesCollection[imageFile['form_name']] = f;
    }

    form = FormData({
      ...body,
      ...imagesCollection,
    });

    try {
      response = await post(url, form);

      return response;
    } catch (e, stackTrace) {
      handleError(e, stackTrace);
      rethrow;
    }
  }

  //method deleted
  Future<Response> deleteData(url) async {
    Response? response;
    try {
      response = await delete(url);

      return response;
    } catch (e, stackTrace) {
      handleError(e, stackTrace);
      rethrow;
    }
  }

  //method put
  Future<Response> putData(
    String url, {
    Map<String, String>? headers,
    Object? body,
  }) async {
    Response? response;

    try {
      response = await put(url, body);

      return response;
    } catch (e, stackTrace) {
      handleError(e, stackTrace);
      rethrow;
    }
  }

  //method patch
  Future<Response> patchData(url, body) async {
    Response? response;
    try {
      response = await patch(url, body);
      return response;
    } catch (e, stackTrace) {
      handleError(e, stackTrace);
      rethrow;
    }
  }

  Future<Response> login(String email, String pass) async {
    print({"email": email, "password": pass});
    Response? response;
    try {
      response =
          await post("${ApiRoutes.PROD_BASE_URL}${ApiRoutes.LOGIN_PATH}", {
        "email": email,
        "password": pass,
      });

      box.write('access_token', response.body['token']);
      log("object: ${response.body}");

      return response;
    } catch (e, stackTrace) {
      handleError(e, stackTrace);
      rethrow;
    }
  }

  //   print({"email": email, "password": pass});
  // Response? response;
  // try {
  //   final response = await http.post(
  //     Uri.parse("${ApiRoutes.PROD_BASE_URL}${ApiRoutes.LOGIN_PATH}"),
  //     body: {
  //       "email": email,
  //       "password": pass,
  //     },
  //   );
  //   final Map<String, dynamic> responseData = json.decode(response.body);
  //   print("Respuesta exitosa: ${response.body}");
  //   // box.write('access_token', response.body['token']);
  //   // print("object: ${response.body}");

  //   return response;

  Future<void> logout() async {
    box.remove('access_token');
    Get.offAndToNamed(Routes.LOGIN);
  }
}
