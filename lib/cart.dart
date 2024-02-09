import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'login.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';

class cart extends StatelessWidget {
  const cart({super.key});

  @override
  Widget build(BuildContext context) {
    String name = Next.sendName();
    final databaseRef = FirebaseDatabase.instance.ref('users').child(name);

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
                "images/trolley.png",
                width: 130,
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Orders",
                style: TextStyle(fontSize: 32, color: Colors.white),
              ),
              const SizedBox(
                height: 37,
              ),
              Container(
                // color: Colors.lightBlue,
                width: 380,
                height: 480,
                child: Column(
                  children: [
                    Expanded(
                        child: FirebaseAnimatedList(
                            defaultChild: const Center(
                                child: CircularProgressIndicator()),
                            query: databaseRef,
                            itemBuilder: (context, snapshot, animation, index) {
                              return Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  //set border radius more than 50% of height and width to make circle
                                ),
                                elevation: 2,
                                color: Colors.white.withOpacity(0.5),
                                child: ListTile(
                                  title: Text(
                                    snapshot.child('product').value.toString(),
                                    style: const TextStyle(fontSize: 22),
                                    textAlign: TextAlign.center,
                                  ),
                                  subtitle: Text(
                                    snapshot.child('state').value.toString(),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              );
                            })),
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
