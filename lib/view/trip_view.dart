import 'package:flutter/cupertino.dart';

class TripView extends StatefulWidget {
  const TripView({Key? key}) : super(key: key);

  @override
  State<TripView> createState() => _TripViewState();
}

class _TripViewState extends State<TripView> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Viagens'),
    );
  }
}