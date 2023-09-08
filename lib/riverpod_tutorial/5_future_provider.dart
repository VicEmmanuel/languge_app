// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:language_app/riverpod_tutorial/api_services/api_service.dart';
// import 'package:language_app/riverpod_tutorial/api_services/user_model.dart';
//
//
// ///Api Pprovider
// final apiProvider =Provider<ApiService>((ref) => ApiService());
//
// final userDataProvider = FutureProvider<List<UserModel>>((ref){
//   return ref.read(apiProvider).getUser();
// });
//
//
// class FutureProvider extends ConsumerWidget {
//   const FutureProvider({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return Container();
//   }
// }
