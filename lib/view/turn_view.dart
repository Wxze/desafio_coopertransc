import 'package:desafio_coopertransc/repository/turn_repository.dart';
import 'package:desafio_coopertransc/widgets/defaul_card_message.dart';
import 'package:flutter/material.dart';
import 'package:desafio_coopertransc/widgets/turn_list_card.dart';
import 'package:desafio_coopertransc/models/turn.dart';

class TurnView extends StatefulWidget {
  const TurnView({Key? key}) : super(key: key);

  @override
  State<TurnView> createState() => _TurnViewState();
}

class _TurnViewState extends State<TurnView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Turn>>(
      future: TurnRepository().getTurnList(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          Future.delayed(Duration.zero, () {
            showSnackBar(snapshot.error.toString());
          });
        } else if (snapshot.hasData) {
          List<Turn>? turnData = snapshot.data;
          return turnData!.isNotEmpty
              ? ListView.builder(
                  itemCount: turnData.length,
                  itemBuilder: (context, index) {
                    return turnListTile(turnData[index]);
                  },
                )
              : const DefaultCardMessage(message: 'Nenhuma vez encontrada');
        }

        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  Widget turnListTile(Turn turnData) {
    return TurnListCard(turnData);
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
