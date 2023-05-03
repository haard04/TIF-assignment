import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tif/EventModel.dart';

class eventPage extends ConsumerWidget {
  event SelectedEvent;
  eventPage(this.SelectedEvent,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: Text('Event Details')),
      extendBodyBehindAppBar: true,
      extendBody: true,
      
      body: Container(
      width: 375,
      color: Colors.white,
      child: Column(
        children: [
          Row(
            children: [
              Container(
                height: 244,
                width: 375,
                child: Image.network(SelectedEvent.banner_image,fit: BoxFit.fill),

              )
            ],
          )
        ],
      ),
    )
    );
    
  }
}