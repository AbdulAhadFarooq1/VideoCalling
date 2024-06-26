import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:videocalling_withagora/join_code.dart';
import 'package:videocalling_withagora/new_meeting.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: const Text("Video Conference"),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
            Padding(
          padding: const EdgeInsets.fromLTRB(20, 40, 20, 0),
          child: SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () {
                  Get.to(() => const NewMettingScreen());
              },
              icon: const Icon(Icons.add,color: Colors.white,),
              label: const Text("New Meeting",style: TextStyle(color: Colors.white),),
              style: ElevatedButton.styleFrom(
              backgroundColor: Colors.indigo,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)),
              ),
            ),
          ),
        ),
          const Divider(
          thickness: 1,
          height: 40,
          indent: 40,
          endIndent: 20,
        ),
          Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: SizedBox(
              width: double.infinity,
            child: OutlinedButton.icon(
              onPressed: () {
                  Get.to(() => const JoinVideoScreen());
              },
              icon: const Icon(Icons.margin),
              label: const Text("Join with a code"),
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.indigo, side: const BorderSide(color: Colors.indigo),
                
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)),
              ),
            ),
          ),
        ),
        const SizedBox(height: 150),
        Image.asset("assets/videocalling1.png"),
        ],
      ),
    );
  }
}