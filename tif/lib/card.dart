import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:intl/intl.dart';
import 'package:tif/EventModel.dart';
import 'package:tif/EventPage.dart';

class EventSmall extends StatelessWidget {
  String photolink;
  String datetime;
  String title;
  String venue_name;
  String venue_city;
  String venue_country;
  event SelectedEvent;

   EventSmall(this.photolink,this.datetime,this.title,this.venue_name,this.venue_city,this.venue_country,this.SelectedEvent,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime dateTime = DateTime.parse(datetime);
    String formattedDate = DateFormat('E,MMMM d * hh:mm a').format(dateTime);
    String formattedTime = DateFormat('HH:mm').format(dateTime);
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => eventPage(SelectedEvent)));
      },
    child: Container(
      
       height: 115, 
       //106/MediaQuery.of(context).devicePixelRatio,
      width: 327,
      child:Column(
        children: [

        

      Expanded(
        child: Card(
          child:Column(
            children: [
              Container(
                

              
              
                 
          child:Row(
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(9,0,4,0),
                    child: SizedBox(height:107,width: 107,
                    child: 
                    
                    Image.network(photolink,alignment: Alignment.center,fit: BoxFit.cover,)),
                  ),
                ],
                
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      
                        //rheight:16/MediaQuery.of(context).devicePixelRatio,
                      Text(
                        formattedDate,
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 13
                            ),
                          )
                        
        
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(width:205,child: Text(title,style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold,),textAlign: TextAlign.justify,))
        
                    ],
                  ),
                  
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.location_on_sharp,weight:400,color: Color(0xFF747688),),
                        SizedBox(width: 205,child:
                         Text(venue_name+'*'+venue_city+', '+venue_country,style:TextStyle(color: Color(0xFF747688),fontSize: 13,fontWeight: FontWeight.w400),textAlign: TextAlign.justify,))
                  
                      ],
                    ),
                  
                ],
              )
            ],
          ),
              )
          
            ],)
       
        ),
        
      ),
      
],
      )
    ));
    
  }
}