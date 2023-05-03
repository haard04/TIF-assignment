import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sizer/sizer.dart';
import 'package:tif/EventModel.dart';
import 'package:tif/Service.dart';
// import 'package:searchfield/searchfield.dart';
import 'package:tif/card.dart';

class Home extends ConsumerWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    
    AsyncValue<List<event>> Eventss = ref.watch(EventsProvider);
    //List<event>? eventList = [];



    return Container(
      color: Colors.white,
      child: Column(
        children: [

          Padding(
            padding: const EdgeInsets.fromLTRB(31,48,10,0),
            
              child: Row(
              
              children:<Widget> [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Events',style: TextStyle(fontSize: 24.sp,color: Colors.black),),
                  ],
                ),
                Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                  onTap: (){},
                  child: Icon(
                      Icons.search
                  ),
               ),
               
               Padding(
                 padding: const EdgeInsets.fromLTRB(31,8,34,8),
                 child: GestureDetector(
                    onTap: (){},
                    child: Icon(
                        Icons.search
                    ),
                 ),
               )
                      ],
                    ),
                    
                  ],
                ),
                
                
                // ElevatedButton.icon(onPressed: (){}, icon: Icon(Icons.search), label:Text('')),
               // ElevatedButton.icon(onPressed: (){}, icon: Icon(Icons.more), label:Text('')),
              ],
            ),
            ),
         
            // Container(
            //   height: 10.h,
            //   decoration: BoxDecoration(
            //             color: Colors.white,
            //             borderRadius: BorderRadius.circular(10),
            //             boxShadow: [
            //               BoxShadow(
            //                   color: Colors.grey.withOpacity(0.2),
            //                   blurRadius: 10,
            //                   offset: Offset(0,10)
            //               )
            //             ]
            //         ),
            //         child: SearchField<event>(
            //           hint: 'Select Event',

            //           searchInputDecoration: InputDecoration(
            //               enabledBorder: OutlineInputBorder(borderSide: BorderSide(
            //                   color: Colors.blueGrey.shade200,
            //                   width: 1
            //               ),
            //                   borderRadius: BorderRadius.circular(10)
            //               ),
            //               focusedBorder: OutlineInputBorder(borderSide: BorderSide(
            //                   color: Colors.blue.withOpacity(0.8),
            //                   width: 2
            //               ),
            //                   borderRadius: BorderRadius.circular(10)
            //               )
            //           ),
            //           itemHeight: 8.h,
            //           maxSuggestionsInViewPort: 6,
            //           suggestionsDecoration: BoxDecoration(
            //             color: Colors.white,
            //             borderRadius: BorderRadius.circular(10),
            //           ),
            //           onSuggestionTap: (productValue) {
            //            // Navigator.push(context,MaterialPageRoute(builder: (context) =>  ProductPage(productValue.item!)),);
            //           },
            //           //initialValue: ref.watch(selectedProductProvider)!=ref.watch(emptyProductProvider)? SearchFieldListItem<Product>(ref.watch(selectedProductProvider).name, item: ref.watch(selectedProductProvider), child: Text(ref.watch(selectedProductProvider).name)) : null,
            //           suggestions: eventList?.map((e) => SearchFieldListItem<event>(e.title, item: e, child: Text(e.title))).toList() ?? [],
            //         ),
            // ),
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

            
          
        ],
      ),
        
      
          
        
      );
    
  }
}