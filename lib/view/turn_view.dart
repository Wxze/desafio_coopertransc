import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class TurnView extends StatefulWidget {
  const TurnView({Key? key}) : super(key: key);

  @override
  State<TurnView> createState() => _TurnViewState();
}

class _TurnViewState extends State<TurnView> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Vez'),
    );
  }
}