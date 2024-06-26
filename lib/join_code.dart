import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:videocalling_withagora/video_caliing.dart';

class JoinVideoScreen extends StatefulWidget {
  const JoinVideoScreen({super.key});

  @override
  State<JoinVideoScreen> createState() => _JoinVideoScreenState();
}

class _JoinVideoScreenState extends State<JoinVideoScreen> {
   final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: InkWell(
                  onTap: () => Get.back(),
                  child: const Icon(Icons.arrow_back_ios_new_sharp),
                ),
              ),
            ),
            const SizedBox(height: 50),
            Image.asset(
              "assets/videocalling2.png",
              fit: BoxFit.cover,
              height: 100,
            ),
            const SizedBox(height: 20),
            const Text(
              "Enter meeting code below",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 20, 15, 20),
              child: Card(
                color: Colors.grey[300],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                child: TextFormField(
                  controller: _controller,
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "Example: abc-efg-dhi",
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    String channelName = _controller.text.trim();
                    if (channelName.isNotEmpty) {
                      Get.to(() => VideoCalling(channelName: channelName));
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigo,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  child: const Text("Join", style: TextStyle(color: Colors.white)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}