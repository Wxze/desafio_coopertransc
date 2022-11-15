import 'package:flutter/material.dart';

import '../widgets/trip_list_card.dart';

class TripView extends StatefulWidget {
  const TripView({Key? key}) : super(key: key);

  @override
  State<TripView> createState() => _TripViewState();
}

class _TripViewState extends State<TripView> {
  @override
  Widget build(BuildContext context) {
    return const Text('teste');
    // ListView.builder(
    //   //itemCount: turnData.length,
    //   itemCount: 8,
    //   itemBuilder: (context, index) {
    //     return tripListTile(index);
    //   },
    // );
  }

  // Widget tripListTile(int index) {
  //   //return TripListCard(turnData[index]);
  //   return const TripListCard();
  // }
}