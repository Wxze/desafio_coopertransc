import 'package:flutter/material.dart';

class _DateTimeSection extends StatelessWidget {
  final String truck;
  final String date;
  final String time;
  final String arrivalTime;

  const _DateTimeSection({
    Key? key,
    required this.truck,
    required this.date,
    required this.time,
    required this.arrivalTime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return 
      Column(
      children: [
        Column(children: [
          CircleAvatar(
            backgroundColor: Colors.grey.shade500,
          ),
          Text(truck,
              style: TextStyle(
                fontSize: 18,
                color: getCardColor(truck.toLowerCase()),
                fontWeight: FontWeight.bold,
              )),
          Text(date,
              style: const TextStyle(
                fontSize: 14,
                color: Color(0xFF000D0C),
              )),
          Text(time,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF000D0C),
              )),
        ]),
        const SizedBox(height: 10),
        Column(
          children: [
          const Text("Data chegada",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 10,
                color: Color(0xFF000D0C),
              )),
          Text(arrivalTime,
              style: const TextStyle(
                fontSize: 10,
                color: Color(0xFF000D0C),
              )),
        ]),
      ],
    );
  }
}

class _CardField extends StatelessWidget {
  final String label;
  final String value;

  const _CardField({
    Key? key,
    required this.label,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            )),
        Text(value,
            style: const TextStyle(
              color: Color(0xFF000D0C),
            ))
      ],
    );
  }
}

class _ContentSection extends StatelessWidget {
  final String position;
  final String name;
  final String vehicle;
  final String headquarter;

  const _ContentSection({
    Key? key,
    required this.position,
    required this.name,
    required this.vehicle,
    required this.headquarter,
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
                    child: _CardField(
                      label: 'Posição',
                      value: position,
                    )),
                Flexible(
                    flex: 1,
                    child: _CardField(
                      label: 'Nome',
                      value: name,
                    )),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                    child: _CardField(
                  label: 'Veículo',
                  value: vehicle,
                ))
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                    child: _CardField(
                  label: 'Matriz',
                  value: headquarter,
                ))
              ],
            ),
          ],
        ));
  }
}

class TurnListCard extends StatelessWidget {
  const TurnListCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      elevation: 1,
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
                      color: getCardColor("Bitrem".toLowerCase()),
                      width: 5)),
              color: Colors.white,
            ),
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Flexible(
                      child: _DateTimeSection(
                        truck: "Bitrem",
                        date: '31/02/2022',
                        time: '01:00',
                        arrivalTime: '27/09',
                      )),
                  Flexible(
                      flex: 3,
                      child: _ContentSection(
                        position: '002',
                        name: 'Gabriel Toledo',
                        vehicle:
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse vel diam sed enim laoreet lacinia. ',
                        headquarter: 'SP, RJ, MG, ES, AM, CE, PE, GO',
                      ))
                ])),
      ),
    );
  }
}

Color getCardColor(String truckType) {
    switch(truckType) {
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
