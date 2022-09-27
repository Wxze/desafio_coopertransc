import 'package:flutter/cupertino.dart';

class MyTripView extends StatefulWidget {
  const MyTripView({Key? key}) : super(key: key);

  @override
  State<MyTripView> createState() => _MyTripViewState();
}

class _MyTripViewState extends State<MyTripView> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Minhas viagens'),
    );
  }
}