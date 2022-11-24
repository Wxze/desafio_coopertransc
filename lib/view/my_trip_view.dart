import 'package:desafio_coopertransc/models/trip.dart';
import 'package:desafio_coopertransc/repository/trip_repository.dart';
import 'package:desafio_coopertransc/widgets/defaul_card_message.dart';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../widgets/trip_list_card.dart';

class MyTripView extends StatefulWidget {
  const MyTripView({Key? key}) : super(key: key);

  @override
  State<MyTripView> createState() => _MyTripViewState();
}

class _MyTripViewState extends State<MyTripView> {
  TextEditingController initialDate = TextEditingController(text: '');
  TextEditingController finalDate = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      filterCard(),
      const SizedBox(height: 12),
      Expanded(
          child: FutureBuilder<List<Trip>>(
        future: TripRepository()
            .myTrip(initialDate: initialDate.text, finalDate: finalDate.text),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            Future.delayed(Duration.zero, () {
              showSnackBar(snapshot.error.toString());
            });
          } else if (snapshot.hasData) {
            List<Trip>? tripData = snapshot.data;
            return tripData!.isNotEmpty
                ? ListView.builder(
                    itemCount: tripData.length,
                    itemBuilder: (context, index) {
                      return tripListTile(tripData[index]);
                    },
                  )
                : const DefaultCardMessage(
                    message: 'Nenhuma viagem encontrada');
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ))
    ]);
  }

  Widget tripListTile(Trip tripData) {
    return TripListCard(tripData);
  }

  Widget filterCard() {
    return Card(
      elevation: 2,
      color: Colors.white,
      child: ExpansionTile(
        title: const Text('Filtros'),
        leading: const Icon(Icons.filter_list),
        childrenPadding:
            const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        children: [
          myTripDateField(initialDate, 'Data de inicio', true),
          myTripDateField(finalDate, 'Data de fim', false),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              filterButton('Resetar Filtros', const Color(0xFF316762),
                  () => resetDateValues()),
              const SizedBox(width: 10),
              filterButton(
                  'Pesquisar', const Color(0xFF0d2b28), () => setState(() {})),
            ],
          )
        ],
      ),
    );
  }

  Widget filterButton(String msg, Color color, Function handlePress) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(20),
        primary: color,
        shadowColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Text(
        msg,
        style: const TextStyle(fontSize: 14),
      ),
      onPressed: () {
        handlePress();
      },
    );
  }

  Widget myTripDateField(
      TextEditingController inputDate, String label, bool firstField) {
    return Container(
      margin: const EdgeInsets.only(top: 6),
      child: TextFormField(
        controller: inputDate,
        enableSuggestions: false,
        autocorrect: false,
        maxLength: 10,
        style: const TextStyle(
          fontSize: 15,
        ),
        cursorColor: const Color(0xFF487873).withOpacity(0.10),
        decoration: InputDecoration(
          counterText: '',
          filled: true,
          fillColor: Colors.white,
          isDense: true,
          contentPadding: const EdgeInsets.all(18),
          labelText: label,
          labelStyle: const TextStyle(fontSize: 16, color: Color(0xFF000D0C)),
          hintText: 'Informe o valor',
          hintStyle: const TextStyle(
            fontSize: 15,
            color: Color(0x77103430),
          ),
          prefixIcon: const Padding(
            padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
            child: Icon(
              Icons.calendar_month_outlined,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: const BorderSide(
              color: Color(0xFF487873),
              width: 2.4,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: const BorderSide(
              color: Color(0xFF103430),
              width: 1.7,
            ),
          ),
        ),
        onTap: () async {
          DateTime? pickeddate = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(2000),
              lastDate: DateTime(2222));

          if (pickeddate != null && firstField == true) {
            initialDate.text = DateFormat('dd/MM/yyyy').format(pickeddate);
          } else if (pickeddate != null && firstField == false) {
            finalDate.text = DateFormat('dd/MM/yyyy').format(pickeddate);
          }
        },
      ),
    );
  }

  void resetDateValues() {
    setState(() {
      initialDate.text = '';
      finalDate.text = '';
    });
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
