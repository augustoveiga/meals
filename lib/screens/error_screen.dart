import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vamos Cozinhar'),
      ),
      body: Center(
        child: Text('404 - ROTA NAO EXISTE'),
      ),
    );
  }
}
