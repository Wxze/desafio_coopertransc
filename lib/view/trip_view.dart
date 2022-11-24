import 'package:desafio_coopertransc/models/trip.dart';
import 'package:desafio_coopertransc/repository/trip_repository.dart';
import 'package:desafio_coopertransc/widgets/defaul_card_message.dart';
import 'package:desafio_coopertransc/widgets/list_empty_message.dart';
import 'package:desafio_coopertransc/widgets/trip_list_card.dart';
import 'package:flutter/material.dart';

class TripView extends StatefulWidget {
  const TripView({Key? key}) : super(key: key);

  @override
  State<TripView> createState() => _TripViewState();
}

class _TripViewState extends State<TripView> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Trip>>(
      future: TripRepository().trip(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          Future.delayed(Duration.zero, () {
            showSnackBar(snapshot.error.toString());
          });
        } else if (snapshot.hasData) {
          List<Trip>? turnData = snapshot.data;
          return turnData!.isNotEmpty
              ? ListView.builder(
                  itemCount: turnData.length,
                  itemBuilder: (context, index) {
                    return tripListTile(turnData[index]);
                  },
                )
              : const DefaultCardMessage(message: 'Nenhuma viagem encontrada');
        }

        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  Widget tripListTile(Trip turnData) {
    return TripListCard(turnData);
  }

  void showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
        const Icon(
          Icons.error,
          color: Colors.white,
        ),
        const SizedBox(width: 10),
        Flexible(child: Text(message))
      ]),
      backgroundColor: Colors.red,
    ));
  }
}
