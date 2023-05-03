import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import 'package:tif/EventModel.dart';

class eventPage extends ConsumerWidget {
  event SelectedEvent;
  eventPage(this.SelectedEvent,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context,WidgetRef ref) {
     DateTime dateTime = DateTime.parse(SelectedEvent.date_time);
    String formattedDate = DateFormat('dd MMMM, yyyy').format(dateTime);
    String formatDateTime(String datetime) {
  DateTime parsedDate = DateTime.parse(SelectedEvent.date_time);
  String formattedDatex = DateFormat('EEEE,').format(parsedDate);
  String formattedStartTime = DateFormat('h:mm a').format(parsedDate);
  String formattedEndTime = DateFormat('h:mm a').format(parsedDate.add(Duration(hours: 2)));
  return formattedDatex + ' - ' + formattedStartTime + ' - ' + formattedEndTime;
}

    print(SelectedEvent.title);
    return Scaffold(
      body: Stack(
        children: [
          Positioned(

            child: Image.network(
              height: 244,
              
              SelectedEvent.banner_image,
              fit: BoxFit.fitHeight,
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 20,
            child: AppBar(
              title: Text('Event Details',style: TextStyle(fontSize: 24),),
              backgroundColor: Colors.transparent,
              elevation: 0,
              actions: [
                Icon(Icons.save_rounded)
              ],
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.3,
            left: 10,
            right: 0,
            bottom: 0,
            child: Center(
              
              child: Column(
                children: [
                  Row(
                    children: [
                      
                      SizedBox(width: 95.w,child: Text(SelectedEvent.title,style: TextStyle(fontSize: 35,backgroundColor: Colors.transparent,),textAlign: TextAlign.justify,))
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(22,16,0,14),
                        child: Column(
                          children: [
                            SizedBox(width: 54,height: 52,child: Image.network(SelectedEvent.organiser_icon,fit: BoxFit.cover,))
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                  Text(SelectedEvent.organiser_name,style: TextStyle(fontSize: 15,color: Color(0XFF0D0C26)),)
                              ],
                            ),
                            Row(
                              children: [
                                Text('Organizer',style: TextStyle(fontSize: 12,color: Color(0XFF706E8F)),)
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(22,12,0,14),
                        child: Column(
                          children: [
                            SizedBox(width: 54,height: 52,child:Icon(Icons.calendar_month)),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                  Text(formattedDate,style: TextStyle(fontSize: 15,color: Color(0XFF0D0C26)),)
                              ],
                            ),
                            Row(
                              children: [
                                Text(formatDateTime(SelectedEvent.date_time),style: TextStyle(fontSize: 12,color: Color(0XFF706E8F)),)
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(22,0,0,14),
                        child: Column(
                          children: [
                            SizedBox(width: 54,height: 52,child: Icon(Icons.location_on_rounded),)
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                  Text(SelectedEvent.venue_name,style: TextStyle(fontSize: 15,color: Color(0XFF0D0C26)),)
                              ],
                            ),
                            Row(
                              children: [
                                Text(SelectedEvent.venue_city+','+SelectedEvent.venue_country,style: TextStyle(fontSize: 12,color: Color(0XFF706E8F)),)
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8.0,8,8,0),
                        child: Text('About Event',
                          style: TextStyle(
                            fontSize: 18,
                            color: Color(0xFF120D26),
                          ),
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        SizedBox(
                          width:90.w,
                          child: Text(
                            SelectedEvent.description,
                            style: TextStyle(
                              fontSize: 16,
                              color: Color(0XFF120D26)
                            ),
                            textAlign: TextAlign.justify,
                            ),
                            ),

                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                     
                        padding: EdgeInsets.symmetric(vertical: 25),
                        width: 271,
                        child:  ElevatedButton(
                          onPressed: (){},
                          style: ButtonStyle(
                            elevation: const MaterialStatePropertyAll(5),
                            padding: const MaterialStatePropertyAll(EdgeInsets.all(10)),
                            shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)
                              ),
                            ),
                            backgroundColor: const MaterialStatePropertyAll(Colors.blue),

                          ),
                          child: Row(
                            
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(85,0,0,0),
                                child: Text('Book Now',),
                              ),
                              
                              Padding(
                                padding: const EdgeInsets.fromLTRB(45,0,14,0),
                                child: Icon(Icons.arrow_forward_rounded),
                              )
                            ],
                          )
                        ),
                      ),
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