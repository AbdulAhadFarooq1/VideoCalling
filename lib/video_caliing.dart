// ignore_for_file: must_be_immutable, unused_import, avoid_print

import 'package:agora_uikit/agora_uikit.dart';
import 'package:flutter/material.dart';

class VideoCalling extends StatefulWidget {
  String channelName;

  VideoCalling({super.key, required this.channelName});

  @override
  State<VideoCalling> createState() => _VideoCallingState();
}

class _VideoCallingState extends State<VideoCalling> {
  late final AgoraClient _client;

  @override
  void initState() {
    super.initState();
    _initializeAgora();
    setState(() {
      
    });
  }

  Future<void> _initializeAgora() async {
    try {
      print("Initializing Agora with channel: ${widget.channelName}");
      _client = AgoraClient(
        agoraConnectionData: AgoraConnectionData(
          appId: "c1d60238dbf54cb5941d3ca7c0b1d6df",
          tempToken: "007eJxTYPDaUB/6IiFD1dRPxfyYGuNCuYa4Q8zbxJNn7uFM6hYtNVNgSDZMMTMwMrZISUozNUlOMrU0MUwxTk40TzZIAsqkpCktqE5rCGRkOBy5moWRAQJBfBYGx4zEFAYGADxmHBg=",
          channelName: widget.channelName,
        ),
        enabledPermission: [Permission.camera, Permission.microphone],
      );
      await _client.initialize();
      setState(() {
        
      });
    } catch (e) {
      print("Error initializing Agora: $e");
    }
  }

  @override
  void dispose() {
    _client.release();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          AgoraVideoViewer(
            client: _client,
          ),
          AgoraVideoButtons(client: _client),
        ],
      ),
    );
  }
}