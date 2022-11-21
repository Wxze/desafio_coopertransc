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
                      width: 16,
                    ),
                    Expanded(
                      child: Text(
                        tripData.nome,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF000D0C),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      fit: FlexFit.tight,
                      flex: 2,
                      child: CardField(
                          label: "Veículo", value: tripData.descricao),
                    ),
                    const SizedBox(width: 6),
                    Flexible(
                      fit: FlexFit.tight,
                      child: CardField(label: "Placa", value: tripData.placa),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      flex: 2,
                      fit: FlexFit.tight,
                      child: CardField(
                          label: "Data marcação:",
                          value: tripData.dataMarcacao),
                    ),
                    const SizedBox(width: 6),
                    Flexible(
                      fit: FlexFit.tight,
                      child: CardField(
                          label: "Data retorno:",
                          value: tripData.dataRetorno ?? '-'),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: CardIconField(
                        label: "Rota:",
                        fontSize: 12,
                        icon: Icons.arrow_forward_ios,
                        firstValue: tripData.cidadeOrigem,
                        secondValue: tripData.cidadeDestino,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      fit: FlexFit.tight,
                      child: CardField(
                        label: "Observação:",
                        value: tripData.obs,
                      ),
                    ),
                  ],
                ),
              ],
            )),
      ),
    );
  }
}
