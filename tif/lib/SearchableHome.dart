import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sizer/sizer.dart';
import 'package:tif/EventModel.dart';
import 'package:tif/EventPage.dart';
import 'package:tif/Service.dart';
import 'package:searchfield/searchfield.dart';
import 'package:tif/card.dart';

class searchableHome extends ConsumerWidget {
  const searchableHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    
    AsyncValue<List<event>> Eventss = ref.watch(EventsProvider);
    List<event>? eventList = [];
    eventList=ref.watch(EventsProvider).value;



    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
    color: Colors.black, //change your color here
  ),
        title: 
           Text('Search',style: TextStyle(fontSize: 24,color: Colors.black),),
        backgroundColor: Colors.white),
    body:Container(
          child: Column(
          children: [
           
            Container(
              height: 10.h,
              decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              blurRadius: 10,
                              offset: Offset(0,10)
                          )
                        ]
                    ),
                    child: SearchField<event>(
                      hint: 'Type Event Name',

                      searchInputDecoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(borderSide: BorderSide(
                              color: Colors.blueGrey.shade200,
                              width: 1
                          ),
                              borderRadius: BorderRadius.circular(10)
                          ),
                          focusedBorder: OutlineInputBorder(borderSide: BorderSide(
                              color: Colors.blue.withOpacity(0.8),
                              width: 2
                          ),
                              borderRadius: BorderRadius.circular(10)
                          )
                      ),
                      itemHeight: 6.h,
                      maxSuggestionsInViewPort: 6,
                      suggestionsDecoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      onSuggestionTap: (productValue) {
                        Navigator.push(context,MaterialPageRoute(builder: (context) =>  eventPage(productValue.item!)),);
                      },
                      //initialValue: ref.watch(selectedProductProvider)!=ref.watch(emptyProductProvider)? SearchFieldListItem<Product>(ref.watch(selectedProductProvider).name, item: ref.watch(selectedProductProvider), child: Text(ref.watch(selectedProductProvider).name)) : null,
                      suggestions: eventList?.map((e) => SearchFieldListItem<event>(e.title, item: e, child: Text(e.title))).toList() ?? [],
                    ),
            ),
            Container(
              child: 
                  Eventss.when(
                    data:(Event){
                      return  Expanded(
                        child: ListView(
                          children: [
                            for(int index=0;index<Event.length;index++)EventSmall(Event[index].banner_image,Event[index].date_time,Event[index].title,Event[index].venue_name,Event[index].venue_city,Event[index].venue_country,Event[index])
                          ]
                        
                      ));
                  },
                  error: (err, stack) => Text('Error: $err'),
                  loading: () => const CircularProgressIndicator()
                  )
                  
            ),

          ]
      ),
        ));
    
  }
}