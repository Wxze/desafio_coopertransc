import 'package:desafio_coopertransc/widgets/warning_list_card.dart';
import 'package:flutter/cupertino.dart';

class WarningView extends StatefulWidget {
  const WarningView({Key? key}) : super(key: key);

  @override
  State<WarningView> createState() => _WarningViewState();
}

class _WarningViewState extends State<WarningView> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      //itemCount: turnData.length,
      itemCount: 8,
      itemBuilder: (context, index) {
        return tripListTile(index);
      },
    );
  }

  Widget tripListTile(int index) {
    //return TripListCard(turnData[index]);
    return const WarningListCard('Titulo do Aviso',
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut vestibulum quis elit iaculis pellentesque. In hac habitasse platea dictumst. Nam venenatis lacus eget commodo semper. Ut pharetra euismod urna vitae egestas. Proin ac ligula quis felis egestas euismod. Praesent vel velit efficitur, mollis dolor et, molestie massa. Vivamus et mi vehicula diam hendrerit vulputate nec eget urna. Vestibulum vestibulum est vitae libero auctor, eu euismod ligula imperdiet.');
  }
}
