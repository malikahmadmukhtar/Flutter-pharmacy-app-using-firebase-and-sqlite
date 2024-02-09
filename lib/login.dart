import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pharma/signup.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'databasehelper.dart';
import 'home.dart';

class Next extends StatelessWidget {
  Next({super.key});

  @override
  final logintext = TextEditingController();
  final passtext = TextEditingController();

  void createToast(String msg) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  static String user = '';
  static String sendName() {
    String name = user;
    return name;
  }

  Widget build(BuildContext context) {
    logintext.text = 'Ahmad Malik';
    passtext.text = '1141';

    Future<void> _login() async {
      var imm = await SQLHelper.getLogin(logintext.text, passtext.text);
      if (imm == 1) {
        user = logintext.text;
        sendName();
        createToast("Welcome");
        Navigator.pushReplacement(
          context,
          CupertinoPageRoute(builder: (context) => const homepage()),
        );
        // Navigator.of(context).push(
        //   MaterialPageRoute(
        //     builder: (BuildContext context) {
        //       return homepage();
        //     },
        //   ),
        // );
      } else {
        createToast("Wrong Info");
      }
    }

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
                    'User Login',
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
                const SizedBox(height: 90),
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
                const SizedBox(height: 30),
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
                const SizedBox(height: 40),
                SizedBox(
                  width: 240,
                  height: 50,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(const Color(0xff8e24aa)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      )),
                    ),
                    onPressed: () {
                      _login();
                      //createToast("Login");
                    },
                    child: const Text(
                      'Login',
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
                      Navigator.of(context).push(
                        CupertinoPageRoute(
                          fullscreenDialog: true,
                          builder: (BuildContext context) {
                            return const Signup();
                          },
                        ),
                      );
                    },
                    child: const Text(
                      'Sign-Up',
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
