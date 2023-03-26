
import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:video_call/vide_conferenc_page.dart';


final String localUserID = math.Random().nextInt(1000000).toString();

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var nameTextCtrl = TextEditingController(text: 'Guest');

  var conferenceidTextCtrl = TextEditingController(text: localUserID);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TextField(
                          controller: nameTextCtrl,
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 1, color: Colors.blue),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              labelText: "Enter your Name"),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextField(
                          controller: conferenceidTextCtrl,
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 1, color: Colors.blue),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              labelText: "Share Room Id with Friends to Join"),
                        )
                      ])),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return VideoConferencePage(
                          conferenceID: conferenceidTextCtrl.text,
                          name: nameTextCtrl.text,
                        );
                      }
                      ),
                    );
                  },
                  child: const Text("     join    "))
            ],
          ),
        ),
      ),
    );
  }
}
