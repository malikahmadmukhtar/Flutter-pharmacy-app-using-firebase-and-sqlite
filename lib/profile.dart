import 'package:flutter/material.dart';
import 'databasehelper.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'login.dart';

class profile extends StatefulWidget {
  const profile({super.key});

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {

  @override
  static String name = "nn";
  static double bmi = 0;
  static double bmi2 = 0;

  final Next ani = new Next();
  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 2; i++) {
      _getdata();
      name = Next.sendName();
      //getBmi();
    }
    // Or call your function here
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

  static String height = "";
  static String age = "";
  static String weight = "";
  static String gender = "";
  static String height2 = "";
  static String weight2 = "";
  static String age2 = "";

  Future<void> _getdata() async {
    var im1 = await SQLHelper.getHeight(name);
    height = im1.toString();
    height2 = height.replaceAll(RegExp(r'[^0-9]'), '');
    var im2 = await SQLHelper.getWeight(name);
    weight = im2.toString();
    weight2 = weight.replaceAll(RegExp(r'[^0-9]'), '');
    var im3 = await SQLHelper.getAge(name);
    age = im3.toString();
    age2 = age.replaceAll(RegExp(r'[^0-9]'), '');
    var im4 = await SQLHelper.getGender(name);
    gender = im4.toString();
    setState(() {});
  }
  void getBmi()
  {
    double hm = double.parse(height2)/3.281;
    double hm2 = hm*hm;
    bmi = (double.parse(weight2)/hm2);
    bmi2 = double.parse(bmi.toStringAsFixed(2));
  }

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
              GestureDetector(
                onTap: () {
                  _getdata();
                  // createToast(hh);
                  setState(() {});
                  //createToast(gender);
                  getBmi();
                  //createToast(bmi2.toString());
                },
                child: Image.asset(
                  "images/me.png",
                  width: 130,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                name,
                style: const TextStyle(fontSize: 32, color: Colors.white),
              ),
              const SizedBox(
                height: 60,
              ),
              Container(
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
                              const SizedBox(
                                height: 75,
                              ),
                              const Text(
                                "Age",
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.w500),
                              ),
                              const SizedBox(height: 15),
                              Text(age2 + " Yr",
                                  style: TextStyle(fontSize: 22)),
                              const SizedBox(height: 30),
                              const Divider(
                                color: Colors.black,
                                height: 25,
                                thickness: 2,
                                indent: 5,
                                endIndent: 5,
                              ),
                              const SizedBox(
                                height: 40,
                              ),
                              const Text(
                                "Height",
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.w500),
                              ),
                              const SizedBox(height: 15),
                              Text(height2 + " ft",
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
                          const SizedBox(
                            height: 75,
                          ),
                          const Text(
                            "BMI",
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.w500),
                          ),
                          SizedBox(height: 15),
                          Text(bmi2.toString(), style: TextStyle(fontSize: 22)),
                          SizedBox(height: 30),
                          const Divider(
                            color: Colors.black,
                            height: 25,
                            thickness: 2,
                            indent: 5,
                            endIndent: 5,
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          const Text(
                            "Weight",
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.w500),
                          ),
                          SizedBox(height: 15),
                          Text(weight2 + " Kg", style: TextStyle(fontSize: 22))
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
