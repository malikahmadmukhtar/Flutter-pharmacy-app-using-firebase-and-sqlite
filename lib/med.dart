import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pharma/injection.dart';
import 'package:flutter_pharma/syrups.dart';
import 'package:flutter_pharma/tablets.dart';
import 'package:flutter_pharma/tubes.dart';

import 'help.dart';

class med extends StatelessWidget {
  const med({super.key});

  @override
  Widget build(BuildContext context) {
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
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    width: 130,
                  ),
                  Image.asset(
                    "images/medicine.png",
                    width: 130,
                  ),
                  const SizedBox(
                    width: 35,
                  ),
                  RawMaterialButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        CupertinoPageRoute(
                          builder: (BuildContext context) {
                            return const Help();
                          },
                        ),
                      );
                    },
                    child: const Icon(
                      Icons.question_mark_outlined,size: 30,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              const Text(
                "Medicine",
                style: TextStyle(fontSize: 32, color: Colors.white),
              ),
              const SizedBox(
                height: 80,
              ),
              Container(
                // color: Colors.lightBlue,
                width: 360,
                height: 400,
                child: Row(
                  children: [
                    Container(
                      //First Container
                      height: 400,
                      width: 177,
                      //color: Colors.red,
                      child: Column(
                        children: [
                          Column(
                            children: [
                              GestureDetector(
                                child: Image.asset(
                                  "images/syrup.png",
                                  width: 140,
                                ),
                                onTap: () {
                                  Navigator.of(context).push(
                                    CupertinoPageRoute(
                                      builder: (BuildContext context) {
                                        return  Syrups();
                                      },
                                    ),
                                  );
                                },
                              ),
                              const SizedBox(height: 8),
                              const Text("Syrups",
                                  style: TextStyle(fontSize: 22)),
                              const Divider(
                                color: Colors.black,
                                height: 25,
                                thickness: 2,
                                indent: 5,
                                endIndent: 5,
                              ),
                              GestureDetector(
                                child: Image.asset(
                                  "images/tubes.png",
                                  width: 140,
                                ),
                                onTap: () {
                                  Navigator.of(context).push(
                                    CupertinoPageRoute(
                                      builder: (BuildContext context) {
                                        return Tubes();
                                      },
                                    ),
                                  );
                                },
                              ),
                              const SizedBox(height: 8),
                              const Text("Ointments",
                                  style: TextStyle(fontSize: 22)),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const VerticalDivider(
                      color: Colors.black87,
                      thickness: 2,
                      width: 5,
                      indent: 60,
                      endIndent: 50,
                    ),
                    Container(
                      // Second Container
                      height: 400,
                      width: 178,
                      //color: Colors.brown,
                      child: Column(
                        children: [
                          GestureDetector(
                            child: Image.asset(
                              "images/tablets.png",
                              width: 140,
                            ),
                            onTap: () {
                              Navigator.of(context).push(
                                CupertinoPageRoute(
                                  builder: (BuildContext context) {
                                    return  Tablets();
                                  },
                                ),
                              );
                            },
                          ),
                          const SizedBox(height: 8),
                          const Text("Tablets", style: TextStyle(fontSize: 22)),
                          const Divider(
                            color: Colors.black,
                            height: 25,
                            thickness: 2,
                            indent: 5,
                            endIndent: 5,
                          ),
                          GestureDetector(
                            child: Image.asset(
                              "images/injection.png",
                              width: 140,
                            ),
                            onTap: () {
                              Navigator.of(context).push(
                                CupertinoPageRoute(
                                  builder: (BuildContext context) {
                                    return  Injection();
                                  },
                                ),
                              );
                            },
                          ),
                          const SizedBox(height: 8),
                          const Text("Injectables",
                              style: TextStyle(fontSize: 22)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ]);
  }
}
