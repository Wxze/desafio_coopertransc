import 'package:desafio_coopertransc/models/warning.dart';
import 'package:desafio_coopertransc/repository/warning_repository.dart';
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
          return const Center(
            child: Text('Não foi possível exibir os dados.'),
          );
        } else if (snapshot.hasData) {
          List<Warning>? warningData = snapshot.data;
          return ListView.builder(
            itemCount: warningData!.length,
            itemBuilder: (context, index) {
              return warningListTile(warningData[index]);
            },
          );
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
        removeHtmlTags(warningData.mensagem));
  }

  static String removeHtmlTags(String text) {
    text = text.replaceAll(RegExp('&lt;'), '<');
    text = text.replaceAll(RegExp('&gt;'), '>');
    text = text.replaceAll(RegExp('&amp;'), '&');
    text = text.replaceAll(RegExp('&aacute;'), 'á');
    text = text.replaceAll(RegExp('&acirc;'), 'â');
    text = text.replaceAll(RegExp('&agrave;'), 'à');
    text = text.replaceAll(RegExp('&atilde;'), 'ã');
    text = text.replaceAll(RegExp('&ccedil;'), 'ç');
    text = text.replaceAll(RegExp('&eacute;'), 'é');
    text = text.replaceAll(RegExp('&ecirc;'), 'ê');
    text = text.replaceAll(RegExp('&iacute;'), 'í');
    text = text.replaceAll(RegExp('&oacute;'), 'ó');
    text = text.replaceAll(RegExp('&ocirc;'), 'ô');
    text = text.replaceAll(RegExp('&otilde;'), 'õ');
    text = text.replaceAll(RegExp('&uacute;'), 'ú');
    text = text.replaceAll(RegExp('&uuml;'), 'ü');
    text = text.replaceAll(RegExp('&Aacute;'), 'Á');
    text = text.replaceAll(RegExp('&Acirc;'), 'Â');
    text = text.replaceAll(RegExp('&Agrave;'), 'À');
    text = text.replaceAll(RegExp('&Atilde;'), 'Ã');
    text = text.replaceAll(RegExp('&Ccedil;'), 'Ç');
    text = text.replaceAll(RegExp('&Eacute;'), 'É');
    text = text.replaceAll(RegExp('&Ecirc;'), 'Ê');
    text = text.replaceAll(RegExp('&Iacute;'), 'Í');
    text = text.replaceAll(RegExp('&Oacute;'), 'Ó');
    text = text.replaceAll(RegExp('&Ocirc;'), 'Ô');
    text = text.replaceAll(RegExp('&Otilde;'), 'Õ');
    text = text.replaceAll(RegExp('&Uacute;	'), 'Ú');
    text = text.replaceAll(RegExp('&Uuml;'), 'Ü');
    text = text.replaceAll(RegExp('&nbsp;'), ' ');

    text = text.replaceAll(RegExp('\\r\\n\\t'), '');
    return text.replaceAll(RegExp(r'<[^>]*>|&[^;]+;'), '');
  }
}
