import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../widgets/trip_list_card.dart';

class MyTripView extends StatefulWidget {
  const MyTripView({Key? key}) : super(key: key);

  @override
  State<MyTripView> createState() => _MyTripViewState();
}

class _MyTripViewState extends State<MyTripView> {
  TextEditingController firstDate = TextEditingController();
  TextEditingController lastDate = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          elevation: 2,
          color: Colors.white,
          child: ExpansionTile(
            title: const Text('Filtros'),
            leading: const Icon(Icons.filter_list),
            childrenPadding:
                const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            children: [
              myTripDateField(firstDate, 'Data de inicio', true),
              myTripDateField(lastDate, 'Data de fim', false),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  filterButton('Resetar Filtros', const Color(0xFF316762)),
                  const SizedBox(width: 10),
                  filterButton('Pesquisar', const Color(0xFF0d2b28)),
                ],
              )
            ],
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Expanded(
          child: ListView.builder(
            itemCount: 8,
            itemBuilder: (context, index) {
              return tripListTile(index);
            },
            shrinkWrap: true,
          ),
        ),
      ],
    );
  }

  Widget tripListTile(int index) {
    return const TripListCard();
  }

  Widget filterButton(String msg, Color color) {
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
      onPressed: () {},
    );
  }

  Widget myTripDateField(inputDate, label, bool firstField) {
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
            setState(() {
              firstDate.text = DateFormat('dd / MM / yyyy').format(pickeddate);
            });
          } else if (pickeddate != null && firstField == false) {
            setState(() {
              lastDate.text = DateFormat('dd / MM / yyyy').format(pickeddate);
            });
          }
        },
      ),
    );
  }
}
