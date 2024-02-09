import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'databasehelper.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

void createToast(String msg) {
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      textColor: Colors.white,
      fontSize: 16.0);
}

void createUser(String name, String address, String contact, String product) {
  final databaseRef = FirebaseDatabase.instance.ref('addresses').child(name);

  databaseRef.set({
    'address': address,
    'contact': contact,
  });

  CollectionReference users = FirebaseFirestore.instance.collection('users');
  users.add({
    'name': name,
    'address': address,
    'contact': contact,
  });
}

final logintext = TextEditingController();
final passtext = TextEditingController();
final agetext = TextEditingController();
final addresstext = TextEditingController();
final heighttext = TextEditingController();
final weighttext = TextEditingController();
final gendertext = TextEditingController();

Future<void> _addItem() async {
  await SQLHelper.createItem(
      logintext.text.trim(),
      passtext.text.trim(),
      agetext.text.trim(),
      addresstext.text.trim(),
      heighttext.text.trim(),
      weighttext.text.trim(),
      gendertext.text.trim());
  createToast("Sign-up\nSucessfull");
}

class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    gendertext.text = '+92';
    return Stack(
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
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SizedBox(
                  height: 70,
                  width: double.infinity,
                ),
                const Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 35,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                  width: double.infinity,
                ),
                Image.asset(
                  'images/user.png',
                  height: 150,
                  width: 150,
                ),
                const SizedBox(height: 60),
                Container(
                    //color: Colors.blue,
                    width: 300,
                    height: 250,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                            width: 300,
                            child: TextField(
                              controller: logintext,
                              decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.person),
                                labelText: 'Username',
                                contentPadding: EdgeInsets.all(15),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(30.0),
                                  ),
                                ),
                              ),
                              style: const TextStyle(fontSize: 18),
                              maxLines: 1,
                              minLines: 1,
                            ),
                          ),
                          const SizedBox(height: 20),
                          SizedBox(
                            width: 300,
                            child: TextField(
                              obscureText: true,
                              controller: passtext,
                              decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.key),
                                labelText: 'Password',
                                contentPadding: EdgeInsets.all(15),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(30.0),
                                  ),
                                ),
                              ),
                              style: const TextStyle(fontSize: 18),
                              maxLines: 1,
                              minLines: 1,
                            ),
                          ),
                          const SizedBox(height: 20),
                          SizedBox(
                            width: 300,
                            child: TextField(
                              keyboardType: TextInputType.number,
                              obscureText: false,
                              controller: agetext,
                              decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.person_3_sharp),
                                labelText: 'Age',
                                contentPadding: EdgeInsets.all(15),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(30.0),
                                  ),
                                ),
                              ),
                              style: const TextStyle(fontSize: 18),
                              maxLines: 1,
                              minLines: 1,
                            ),
                          ),
                          const SizedBox(height: 20),
                          SizedBox(
                            width: 300,
                            child: TextField(
                              obscureText: false,
                              controller: addresstext,
                              decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.add_location_sharp),
                                labelText: 'Address',
                                contentPadding: EdgeInsets.all(15),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(30.0),
                                  ),
                                ),
                              ),
                              style: const TextStyle(fontSize: 18),
                              maxLines: 1,
                              minLines: 1,
                            ),
                          ),
                          const SizedBox(height: 20),
                          SizedBox(
                            width: 300,
                            child: TextField(
                              keyboardType: TextInputType.number,
                              obscureText: false,
                              controller: heighttext,
                              decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.linear_scale_outlined),
                                labelText: 'Height',
                                contentPadding: EdgeInsets.all(15),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(30.0),
                                  ),
                                ),
                              ),
                              style: const TextStyle(fontSize: 18),
                              maxLines: 1,
                              minLines: 1,
                            ),
                          ),
                          const SizedBox(height: 20),
                          SizedBox(
                            width: 300,
                            child: TextField(
                              keyboardType: TextInputType.number,
                              obscureText: false,
                              controller: weighttext,
                              decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.monitor_weight_outlined),
                                labelText: 'Weight',
                                contentPadding: EdgeInsets.all(15),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(30.0),
                                  ),
                                ),
                              ),
                              style: const TextStyle(fontSize: 18),
                              maxLines: 1,
                              minLines: 1,
                            ),
                          ),
                          const SizedBox(height: 20),
                          SizedBox(
                            width: 300,
                            child: TextField(
                              keyboardType: TextInputType.number,
                              obscureText: false,
                              controller: gendertext,
                              decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.contact_mail),
                                labelText: 'Contact#',
                                contentPadding: EdgeInsets.all(15),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(30.0),
                                  ),
                                ),
                              ),
                              style: const TextStyle(fontSize: 18),
                              maxLines: 1,
                              minLines: 1,
                            ),
                          ),
                        ],
                      ),
                    )),

                // const SizedBox(height: 10),
                SizedBox(
                  width: 240,
                  height: 50,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Color(0xff8e24aa)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      )),
                    ),
                    onPressed: () {
                      _addItem();
                      createUser(logintext.text, addresstext.text,
                          gendertext.text, 'none');
                      createToast('Upload');
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Sign-Up',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                SizedBox(
                  width: 240,
                  height: 50,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Color(0xff1e88e5)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      )),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Back',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
