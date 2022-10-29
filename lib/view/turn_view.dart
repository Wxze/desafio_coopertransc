import 'package:flutter/material.dart';
import 'package:desafio_coopertransc/widgets/turn_list_card.dart';
import 'package:desafio_coopertransc/models/turn.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TurnView extends StatefulWidget {
  const TurnView({Key? key}) : super(key: key);

  @override
  State<TurnView> createState() => _TurnViewState();
}

List<Turn> turnData = <Turn>[
  Turn(
      'Truck',
      '31/02/2022',
      '01:00',
      '27/09',
      '002',
      'Gabriel Toledo',
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse vel diam sed enim laoreet lacinia.',
      'SP, RJ, MG, ES, AM, CE, PE, GO'),
  Turn(
      'Bitrem',
      '31/02/2022',
      '01:00',
      '27/09',
      '002',
      'Gabriel Toledo',
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse vel diam sed enim laoreet lacinia.',
      'SP, RJ, MG, ES, AM, CE, PE, GO'),
  Turn(
      'Carreta',
      '31/02/2022',
      '01:00',
      '27/09',
      '002',
      'Gabriel Toledo',
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse vel diam sed enim laoreet lacinia.',
      'SP, RJ, MG, ES, AM, CE, PE, GO')
];

class _TurnViewState extends State<TurnView> {
  @override
  void initState() {
    super.initState();
    teste();
  }

  void teste() async {
    print(await _getToken());
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: turnData.length,
      itemBuilder: (context, index) {
        return turnListTile(index);
      },
    );
  }

  Widget turnListTile(int index) {
    return TurnListCard(turnData[index]);
  }

  Future<String> _getToken() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    if (token != null) {
      return token;
    } else {
      return '';
    }
  }
}
