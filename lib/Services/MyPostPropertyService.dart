// import 'package:http/http.dart' as http;
// import 'dart:convert';
//
//
//
// class MyPostPropertyService {
//   static Future<List<MyPostList>> fetchMyPostList(String userId) async {
//     // Replace URL with your API endpoint
//     String apiUrl = 'https://your-api-endpoint.com/my_post_list';
//
//     final response = await http.post(Uri.parse(apiUrl), body: {
//       'user_id': userId,
//     });
//
//     if (response.statusCode == 200) {
//       final jsonData = jsonDecode(response.body);
//       List<dynamic> data = jsonData['my_post_list'];
//       List<MyPostList> postList = data.map((item) => MyPostList.fromJson(item)).toList();
//       return postList;
//     } else {
//       throw Exception('Failed to load post list');
//     }
//   }
// }
