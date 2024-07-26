import 'package:flutter/material.dart';

class MyGesture extends StatefulWidget {
  const MyGesture({super.key});


  @override
  State<MyGesture> createState() => _MyGestureState();
}

class _MyGestureState extends State<MyGesture> {
  int counter=0;
  void _increment (){
    setState(() {
      counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ElevatedButton(
          onPressed: _increment,
          child: const Text('Increment'),
        ),
        const SizedBox(width: 16),
        Text('Count: $counter'),
      ],
    );
  }
}
