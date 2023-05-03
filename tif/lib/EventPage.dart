import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tif/EventModel.dart';

class eventPage extends ConsumerWidget {
  event SelectedEvent;
  eventPage(this.SelectedEvent,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(

            child: Image.network(
              height: 244,
              
              SelectedEvent.banner_image,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 20,
            child: AppBar(
              title: Text('Event Details'),
              backgroundColor: Colors.transparent,
              elevation: 0,
              actions: [
                Icon(Icons.save_rounded)
              ],
            ),
          ),
          Positioned(
            top: 250,
            left: 10,
            right: 0,
            bottom: 0,
            child: Container(
              color: Colors.white,
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(SelectedEvent.title,style: TextStyle(fontSize: 35),)
                    ],
                  )
                ],
              )
            ),
          ),
        ],
      ),   );
    
  }
}