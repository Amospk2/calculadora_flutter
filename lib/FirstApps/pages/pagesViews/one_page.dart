import 'package:flutter/material.dart';

class OnePage extends StatelessWidget {
  const OnePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
          height: 200,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            color: Colors.grey,
          ),
          child: const Center(
            child: Text('Ola Mundo!',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                )),
          )),
      Row(
        children: [
          Container(
            color: Colors.red,
            height: 100,
            width: 100,
            child: const Center(child: Text('Container 01')),
          ),
          Container(
              color: Colors.purple,
              height: 100,
              width: 100,
              child: const Center(child: Text('Container 02'))),
        ],
      )
    ]);
  }
}
