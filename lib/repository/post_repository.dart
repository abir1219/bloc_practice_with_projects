import 'dart:convert';
import 'dart:io';

import 'package:bloc_practice/model/post_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PostRepository{

  Future<List<PostModel>> fetchPostApiCall() async{
    String url = "https://jsonplaceholder.typicode.com/posts";
    List<PostModel> postList = [];
    try{
      final response = await http.get(Uri.parse(url));
      debugPrint("Response==>${response.body}");
      if(response.statusCode == 200){
        final List<dynamic> body = json.decode(response.body);
        postList = body.map((dynamic item) => PostModel.fromJson(item)).toList();
        return postList;
      }else{
        throw Exception("Failed to load post");
      }
    }on SocketException{
      throw Exception("No Internet");
    }
  }
}