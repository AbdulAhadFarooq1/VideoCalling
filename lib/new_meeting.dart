import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:uuid/uuid.dart';
import 'package:videocalling_withagora/video_caliing.dart';

class NewMettingScreen extends StatefulWidget {
  const NewMettingScreen({super.key});

  @override
  State<NewMettingScreen> createState() => _NewMettingScreenState();
}

class _NewMettingScreenState extends State<NewMettingScreen> {
    late String _meetingCode;

  @override
  void initState() {
    super.initState();
    var uuid = const Uuid();
    _meetingCode = uuid.v4().substring(0, 8);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: InkWell(
                  onTap: () => Get.back(),
                  child: const Icon(Icons.arrow_back_ios_new_sharp),
                ),
              ),
            ),
            const SizedBox(height: 50),
            Image.asset(
              "assets/videocalling3.png",
              fit: BoxFit.cover,
              height: 100,
            ),
            const SizedBox(height: 20),
            const Text(
              "Enter meeting code below",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 20, 15, 0),
              child: Card(
                color: Colors.grey[300],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                child: ListTile(
                  leading: const Icon(Icons.link),
                  title: SelectableText(
                    _meetingCode,
                    style: const TextStyle(fontWeight: FontWeight.w300),
                  ),
                  trailing: const Icon(Icons.copy),
                ),
              ),
            ),
            const Divider(thickness: 1, height: 40, indent: 20, endIndent: 20),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {
                    Share.share("Meeting Code: $_meetingCode");
                  },
                  icon: const Icon(Icons.arrow_drop_down, color: Colors.white),
                  label: const Text("Share invite", style: TextStyle(color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigo,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: SizedBox(
                width: double.infinity,
                child: OutlinedButton.icon(
                  onPressed: () {
                    Get.to(() => VideoCalling(channelName: _meetingCode));
                  },
                  icon: const Icon(Icons.video_call),
                  label: const Text("Start call"),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.indigo,
                    side: const BorderSide(color: Colors.indigo),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}