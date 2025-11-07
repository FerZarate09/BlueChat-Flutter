// ignore_for_file: avoid_print

import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

class BluetoothChatPage extends StatefulWidget {
  final bool isServer;
  const BluetoothChatPage({super.key, this.isServer = false});

  @override
  State<BluetoothChatPage> createState() => _BluetoothChatPageState();
}

class _BluetoothChatPageState extends State<BluetoothChatPage> {
  BluetoothState _bluetoothState = BluetoothState.UNKNOWN;
  BluetoothConnection? _connection;
  bool _isConnected = false;
  bool _isConnecting = false;

  final TextEditingController _messageController = TextEditingController();
  final List<String> _messages = [];

  @override
  void initState() {
    super.initState();
    _initBluetooth();

    if (widget.isServer) {
      _startServer();
    }
  }

  Future<void> _initBluetooth() async {
    _bluetoothState = await FlutterBluetoothSerial.instance.state;
    setState(() {});
    FlutterBluetoothSerial.instance.onStateChanged().listen((state) {
      setState(() {
        _bluetoothState = state;
      });
    });
  }

  Future<void> _startServer() async {
    try {
      print("Esperando conexiones entrantes...");
      final connection = await BluetoothConnection.toAddress(null); // experimental
      print('Cliente conectado');
      if (!mounted) return;
      setState(() {
        _connection = connection;
        _isConnected = true;
      });

      connection.input?.listen((Uint8List data) {
        final text = String.fromCharCodes(data);
        if (!mounted) return;
        setState(() {
          _messages.add("Amigo: $text");
        });
      }).onDone(() {
        print('⚠️ Conexión terminada');
        if (!mounted) return;
        setState(() {
          _isConnected = false;
        });
      });
    } catch (e) {
      print('❌ Error al aceptar conexión: $e');
    }
  }

  Future<void> _connectToDevice(BluetoothDevice device) async {
    try {
      setState(() {
        _isConnecting = true;
      });

      final connection = await BluetoothConnection.toAddress(device.address);
      print('✅ Conectado a ${device.name}');
      if (!mounted) return;
      setState(() {
        _connection = connection;
        _isConnected = true;
        _isConnecting = false;
      });

      connection.input?.listen((Uint8List data) {
        final receivedText = String.fromCharCodes(data);
        if (!mounted) return;
        setState(() {
          _messages.add("Amigo: $receivedText");
        });
      }).onDone(() {
        print('⚠️ Conexión terminada');
        if (!mounted) return;
        setState(() {
          _isConnected = false;
        });
      });
    } catch (error) {
      print('❌ Error al conectar: $error');
      if (!mounted) return;
      setState(() {
        _isConnecting = false;
      });
    }
  }

  void _sendMessage() {
    if (_connection != null && _isConnected) {
      final message = _messageController.text.trim();
      if (message.isNotEmpty) {
        _connection!.output.add(Uint8List.fromList(message.codeUnits));
        setState(() {
          _messages.add("Tú: $message");
          _messageController.clear();
        });
      }
    }
  }

  void _disconnect() {
    _connection?.finish();
    setState(() {
      _isConnected = false;
      _connection = null;
    });
  }

  Future<void> _showDeviceList(BuildContext context) async {
    final devices = await FlutterBluetoothSerial.instance.getBondedDevices();

    if (!mounted) return;
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Selecciona un dispositivo"),
        content: SingleChildScrollView(
          child: Column(
            children: devices
                .map(
                  (d) => ListTile(
                    title: Text(d.name ?? "Desconocido"),
                    subtitle: Text(d.address),
                    onTap: () {
                      if (!mounted) return;
                      Navigator.pop(context);
                      _connectToDevice(d);
                    },
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _connection?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BlueChat"),
        backgroundColor: Colors.blueAccent,
        actions: [
          if (!widget.isServer)
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () => _showDeviceList(context),
            ),
          if (_isConnected)
            IconButton(
              icon: const Icon(Icons.close),
              onPressed: _disconnect,
            ),
        ],
      ),
      body: _bluetoothState != BluetoothState.STATE_ON
          ? const Center(child: Text("⚠️ Activa el Bluetooth para continuar"))
          : Column(
              children: [
                if (_isConnecting) const LinearProgressIndicator(),
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(10),
                    itemCount: _messages.length,
                    itemBuilder: (context, index) {
                      final msg = _messages[index];
                      final isUser = msg.startsWith("Tú:");
                      return Align(
                        alignment: isUser
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 10),
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: isUser
                                ? Colors.blueAccent
                                : Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            msg,
                            style: TextStyle(
                              color: isUser ? Colors.white : Colors.black,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                if (_isConnected)
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _messageController,
                          decoration: const InputDecoration(
                            hintText: "Escribe un mensaje...",
                            contentPadding: EdgeInsets.all(10),
                          ),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.send, color: Colors.blue),
                        onPressed: _sendMessage,
                      ),
                    ],
                  ),
              ],
            ),
    );
  }
}
