import 'package:flutter/material.dart';
import 'bluetooth_chat.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BlueChat',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // 🔹 Cambia isServer a true o false según el teléfono
      home: const BluetoothChatPage(isServer: false),
    );
  }
}
