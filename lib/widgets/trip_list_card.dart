import 'package:desafio_coopertransc/models/trip.dart';
import 'package:desafio_coopertransc/widgets/card_field.dart';
import 'package:flutter/material.dart';

import 'card_icon_field.dart';

class TripListCard extends StatelessWidget {
  final Trip tripData;

  const TripListCard(this.tripData, {Key? key}) : super(key: key);

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
                      color: const Color(0xFF1A5650).withOpacity(0.75),
                      width: 5)),
              color: Colors.white,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 35,
                      backgroundColor: Colors.grey.shade500,
                    ),
                    const SizedBox(
                      width: 25,
                    ),
                    Expanded(
                        child: CardField(
                      label: 'Nome',
                      value: tripData.nome,
                      fontSize: 20,
                    ))
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: CardField(
                          label: 'Veículo', value: tripData.descricao),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: CardIconField(
                        label: 'Rota',
                        firstValue: tripData.cidadeOrigem,
                        secondValue: tripData.cidadeDestino,
                        icon: Icons.arrow_forward_ios,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Flexible(
                      child: Row(
                        children: [
                          Flexible(
                              child: CardField(
                                  label: 'Marcou em:',
                                  value: tripData.dataMarcacao)),
                          const SizedBox(
                            width: 50,
                          ),
                          Flexible(
                            child: CardField(
                                label: 'Viajou em:',
                                value: tripData.dataRetorno ?? '-'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child:
                          CardField(label: 'Observação', value: tripData.obs),
                    ),
                  ],
                ),
              ],
            )),
      ),
    );
  }
}
