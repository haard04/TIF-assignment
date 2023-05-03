
import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:tif/BASE_URL.dart';
import 'package:tif/EventModel.dart';



Future<List<event>> getEvents() async {
  http.Response response = await http.get(Uri.parse(Base_URL().base_url+ '/v1/event/'));
  if(response.statusCode!=200){
    //return [];
  }
  
 var json = jsonDecode(response.body);

  // newjson(Map<String, dynamic> json) => json(
  //     content: json['data'] as List,);
  var list = json['content']['data'] as List ;

 
  //print(list);
  return list.map((events) => event.fromJson(events)).toList();
}

final EventsProvider = FutureProvider((ref) => 
  getEvents()
);