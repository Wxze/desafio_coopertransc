import 'package:desafio_coopertransc/widgets/card_field.dart';
import 'package:flutter/material.dart';

import 'card_icon_field.dart';

class TripListCard extends StatefulWidget {
  const TripListCard({Key? key}) : super(key: key);

  @override
  State<TripListCard> createState() => _TripListCardState();
}

class _TripListCardState extends State<TripListCard> {
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
                      radius: 30,
                      backgroundColor: Colors.grey.shade500,
                    ),
                    const SizedBox(
                      width: 25,
                    ),
                    const Expanded(
                        child: CardField(
                      label: 'Nome',
                      value: 'Gabriel Toledo',
                      fontSize: 20,
                    ))
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: const [
                    Expanded(
                      child:
                          CardField(label: 'Veículo', value: 'Mercedes L-1113'),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Flexible(
                      child: CardIconField(
                        label: 'Rota',
                        firstValue: 'Serrana SP',
                        secondValue: 'Ribeirão Preto SP',
                        icon: Icons.arrow_forward_ios,
                      ),
                    ),
                    Flexible(
                      child: Row(
                        children: const [
                          Flexible(
                              child: CardField(
                                  label: 'Marcou em:', value: '28/09/2022')),
                          SizedBox(
                            width: 15,
                          ),
                          Flexible(
                              child: CardField(
                                  label: 'Viajou em:', value: '28/09/2022')),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: const [
                    Expanded(
                      child:
                      CardField(label: 'Observação', value: 'Sou lolli'),
                    ),
                  ],
                ),
              ],
            )),
      ),
    );
  }
}
