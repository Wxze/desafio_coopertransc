import 'package:flutter/material.dart';
import 'package:desafio_coopertransc/widgets/turn_list_card.dart';

class TurnView extends StatefulWidget {
  const TurnView({Key? key}) : super(key: key);

  @override
  State<TurnView> createState() => _TurnViewState();
}

class _TurnViewState extends State<TurnView> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 15,
      itemBuilder: (context, index) {
        return turnListTile();
      },
    );
  }

  Widget turnListTile() {
    return const TurnListCard();
  }
}
