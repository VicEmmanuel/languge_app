
import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart';
import 'package:http/http.dart' as client;
import 'package:language_app/riverpod_tutorial/api_services/response_model.dart';
import 'package:language_app/riverpod_tutorial/api_services/user_model.dart';

class ApiService{
  String endPoint = 'https://reqres.in/api/users?page=1';

  Future<List<UserModel>> getUser() async{
    Response response = await get(Uri.parse(endPoint));
    log( response.body);
    log( response.body);
    log( response.statusCode.toString());
    if(response.statusCode ==200){
      final List result = jsonDecode(response.body)['data'];
      return result.map(((e)=> UserModel.fromJson(e))).toList();
    }else{
      throw Exception(response.reasonPhrase);
    }
  }

  Future<void> getUserTwo() async {
    const url = 'https://reqres.in/api/users?page=1';
    // logger.i(url);
    log("get Events");


    try {
      final httpConnectionApi = await client.get(
        Uri.parse(url),
             ).timeout(const Duration(seconds: 60));

      log(httpConnectionApi.body);
      log(httpConnectionApi.body);
      log(httpConnectionApi.statusCode.toString());

      if (httpConnectionApi.statusCode == 200) {
        var resBody = jsonDecode(httpConnectionApi.body.toString());
        ResponseData.userModel = UserModel.fromJson(resBody);

      } else {
        var resBody = jsonDecode(httpConnectionApi.body.toString());
        // ResponseData.failureResponse = FailureResponseModel.fromJson(resBody);

        // showErrorAlert(context,
        //     message: ResponseData.registrationResponseModel!.message.toString());
      }
    } on Exception catch (e) {
      // showErrorAlert(context, message: somethingWentWrongText);
      log('Error');
      log(e.toString());
      rethrow;
    }
  }

}








// class UserModel {
//   UserModel({
//     required this.id,
//     required this.email,
//     required this.firstName,
//     required  this.lastName,
//     required  this.avatar,});
//
//   factory UserModel.fromJson(Map<String, dynamic> json) {
//     return UserModel(
//         id : json['id'],
//         email : json['email'],
//         firstName : json['first_name'],
//         lastName : json['last_name'],
//         avatar : json['avatar']
//     );
//   }
//   num id;
//   String email;
//   String firstName;
//   String lastName;
//   String avatar;
// }
