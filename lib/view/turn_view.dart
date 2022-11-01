import 'package:desafio_coopertransc/repository/turn_repository.dart';
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
            child: Text('Não foi possível exibir dos dados.'),
          );
        } else if (snapshot.hasData) {
          var turnData = snapshot.data;
          return ListView.builder(
            itemCount: turnData!.length,
            itemBuilder: (context, index) {
              return turnListTile(index, turnData);
            },
          );
        }

        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  Widget turnListTile(int index, var turnData) {
    return TurnListCard(turnData[index]);
  }
}
