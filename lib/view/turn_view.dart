import 'package:desafio_coopertransc/repository/turn_repository.dart';
import 'package:desafio_coopertransc/widgets/defaul_card_message.dart';
import 'package:desafio_coopertransc/widgets/list_empty_message.dart';
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
          return const Center(
            child: Text('Não foi possível exibir os dados.'),
          );
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
}
