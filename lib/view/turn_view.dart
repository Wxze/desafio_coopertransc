import 'package:flutter/material.dart';

class TurnView extends StatefulWidget {
  const TurnView({Key? key}) : super(key: key);

  @override
  State<TurnView> createState() => _TurnViewState();
}

class _TurnViewState extends State<TurnView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: 15,
        itemBuilder: (context, index) {
          return turnListTile();
        },
      ),
    );
  }

  Widget turnListTile() {
    return Card(
      elevation: 1,
      child: ListTile(
        leading: const Icon(Icons.woman),
        trailing: const Icon(Icons.arrow_drop_down_circle),
        title: const Text('Título'),
        subtitle: const Text('Subtítulo'),
        hoverColor: const Color(0xFFd9dddd),
        onTap: () => {} ,
      ),
    );
  }
}
