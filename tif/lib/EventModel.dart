import 'dart:ffi';

import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class event{
  event({
    required this.id,
    required this.title,
    required this.description,
    required this.banner_image,
    required this.date_time,
    required this.organiser_name,
    required this.organiser_icon,
    required this.venue_name,
    required this.venue_city,
    required this.venue_country,



  });


factory event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);

 


  final int id;
  final String title;
  final String description;
  final String banner_image;
  final String date_time;
  final String organiser_name;
  final String organiser_icon;
  final String venue_name;
  final String venue_city;
  final String venue_country;




}

event _$EventFromJson(Map<String, dynamic> json) => event(
      id: json['_id'] as int? ?? 0,
      title: json['title'] as String,
      description: json['description'] as String,
      banner_image: json['banner_image'] as String,
      date_time: json['date_time'] as String,
      organiser_name: json['organiser_name'] as String,
      organiser_icon: json['organiser_icon'] as String,
      venue_name: json['venue_name'] as String,
      venue_city: json['venue_city'] as String,
      venue_country: json['venue_country'] as String,
      
    );

