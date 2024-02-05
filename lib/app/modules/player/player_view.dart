import 'package:flutter/material.dart';

class PlayerPage extends StatelessWidget {
  final PlayerController controller = Get.put(PlayerController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PlayerPage'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'PlayerPage is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
