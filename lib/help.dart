import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Help extends StatelessWidget {
  const Help({super.key});

  @override
  Widget build(BuildContext context) {
    String img = '';
    return Stack(// <-- STACK AS THE SCAFFOLD PARENT
        children: [
      Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/bg2.png"), // <-- BACKGROUND IMAGE
            fit: BoxFit.cover,
          ),
        ),
      ),
      Scaffold(
        backgroundColor: Colors.transparent, // <-- APPBAR WITH TRANSPARENT BG
        //  elevation: 0,
        body: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 80,
              ),
              Image.asset(
                "images/appicon.png",
                width: 130,
              ),
              const SizedBox(
                height: 25,
              ),
              const Text(
                "AM Pharma",
                style: TextStyle(fontSize: 32, color: Colors.white),
              ),
              const Text(
                "Flutter Version",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              const SizedBox(
                height: 60,
              ),
              Container(
                padding: const EdgeInsets.only(
                  bottom: 5, // Space between underline and text
                ),
                decoration: const BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                  color: Colors.black,
                  width: 2.5, // Underline thickness
                ))),
                child: const Text(
                  "Developed By",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
              ),
              const Text(
                "Ahmad Malik",
                style: TextStyle(
                    fontSize: 32,
                    color: Colors.black,
                    height: 1.5,
                    fontWeight: FontWeight.w300),
              ),
              const SizedBox(
                height: 40,
              ),
              Container(
                padding: const EdgeInsets.only(
                  bottom: 5, // Space between underline and text
                ),
                decoration: const BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                  color: Colors.black,
                  width: 2.5, // Underline thickness
                ))),
                child: const Text(
                  "Developer Contact",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      var url =
                          Uri.parse("https://facebook.com/yourcontacthere");
                      launchUrl(url);
                    },
                    child: Image.asset(
                      "images/facebook.png",
                      width: 90,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      var url = Uri.parse("https://wa.me/yourcontacthere");
                      launchUrl(url);
                    },
                    child: Image.asset(
                      "images/whatsapp.png",
                      width: 90,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      var url =
                          Uri.parse("https://instagram.com/yourcontacthere/");
                      launchUrl(url);
                    },
                    child: Image.asset(
                      "images/instagram.png",
                      width: 90,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              RawMaterialButton(
                onPressed: () {
                  Navigator.pop(context, true);
                },
                elevation: 0.0,
                fillColor: Colors.deepPurpleAccent,
                padding: EdgeInsets.all(30.0),
                shape: const CircleBorder(),
                child: const Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.white,
                  size: 30.0,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text('Back', style: TextStyle(fontSize: 20)),
            ],
          ),
        ),
      ),
    ]);
  }
}
