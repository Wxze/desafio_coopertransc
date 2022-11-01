import 'package:desafio_coopertransc/models/turn.dart';
import 'package:desafio_coopertransc/view/turn_view.dart';
import 'package:flutter/material.dart';

import 'card_field.dart';

class _DateTimeSection extends StatelessWidget {
  final Turn turnData;

  const _DateTimeSection({
    Key? key,
    required this.turnData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.grey.shade500,
          ),
          Text(turnData.veiculo,
              style: TextStyle(
                fontSize: 18,
                color: getCardColor(turnData.veiculo.toLowerCase()),
                fontWeight: FontWeight.bold,
              )),
          Text(turnData.dataMarcacao,
              style: const TextStyle(
                fontSize: 14,
                color: Color(0xFF000D0C),
              )),
          Text(turnData.horaMarcacao,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF000D0C),
              )),
        ]),
        const SizedBox(height: 10),
        Column(children: [
          const Text("Data chegada",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 10,
                color: Color(0xFF000D0C),
              )),
          Text(turnData.chegada ?? '-',
              style: const TextStyle(
                fontSize: 10,
                color: Color(0xFF000D0C),
              )),
        ]),
      ],
    );
  }
}

class _ContentSection extends StatelessWidget {
  final Turn turnData;

  const _ContentSection({
    Key? key,
    required this.turnData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(left: 16),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                    flex: 1,
                    child: CardField(
                      label: 'Posição',
                      value: turnData.id.toString(),
                    )),
                Flexible(
                    flex: 1,
                    child: CardField(
                      label: 'Nome',
                      value: turnData.cooperado,
                    )),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                    child: CardField(
                  label: 'Veículo',
                  value: turnData.veiculo,
                ))
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                    child: CardField(
                  label: 'Estados',
                  value: turnData.estados,
                ))
              ],
            ),
          ],
        ));
  }
}

class TurnListCard extends StatelessWidget {
  final Turn turnData;
  const TurnListCard(this.turnData, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      elevation: 3,
      child: ClipPath(
        clipper: ShapeBorderClipper(
            shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        )),
        child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              border: Border(
                  left: BorderSide(
                      color: getCardColor(turnData.tipoVeiculo.toLowerCase()),
                      width: 5)),
              color: Colors.white,
            ),
            child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Flexible(
                  child: _DateTimeSection(
                turnData: turnData,
              )),
              const SizedBox(width: 8),
              Flexible(
                  flex: 3,
                  child: _ContentSection(
                    turnData: turnData,
                  ))
            ])),
      ),
    );
  }
}

Color getCardColor(String truckType) {
  switch (truckType) {
    case 'truck':
      return const Color(0xFF1FE059).withOpacity(0.75);
    case 'bitrem':
      return const Color(0xFF591FE0).withOpacity(0.75);
    case 'carreta':
      return const Color(0xFFE0591F).withOpacity(0.75);
    default:
      return const Color(0xFF1FE059).withOpacity(0.75);
  }
}
