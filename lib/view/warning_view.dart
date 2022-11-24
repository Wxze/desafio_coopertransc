import 'package:desafio_coopertransc/models/warning.dart';
import 'package:desafio_coopertransc/repository/warning_repository.dart';
import 'package:desafio_coopertransc/utils/format_text.dart';
import 'package:desafio_coopertransc/widgets/defaul_card_message.dart';
import 'package:desafio_coopertransc/widgets/warning_list_card.dart';
import 'package:flutter/material.dart';

class WarningView extends StatefulWidget {
  const WarningView({Key? key}) : super(key: key);

  @override
  State<WarningView> createState() => _WarningViewState();
}

class _WarningViewState extends State<WarningView> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Warning>>(
      future: WarningRepository().getWarningList(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          Future.delayed(Duration.zero, () {
            showSnackBar(snapshot.error.toString());
          });
        } else if (snapshot.hasData) {
          List<Warning>? warningData = snapshot.data;
          return warningData!.isNotEmpty
              ? ListView.builder(
                  itemCount: warningData.length,
                  itemBuilder: (context, index) {
                    return warningListTile(warningData[index]);
                  },
                )
              : const DefaultCardMessage(message: 'Nenhum aviso encontrado');
        }

        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  Widget warningListTile(Warning warningData) {
    return WarningListCard(
        warningData.titulo == '' ? 'Aviso' : warningData.titulo,
        FormatText.removeHtmlTags(warningData.mensagem));
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
