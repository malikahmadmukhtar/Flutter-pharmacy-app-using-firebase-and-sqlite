import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'login.dart';
import 'medmodal.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MedDetail extends StatelessWidget {
  final MedDataModel medDataModel;

  MedDetail({Key? key, required this.medDataModel}) : super(key: key);
  @override
  static String name = "nn";

  Widget build(BuildContext context) {
    void createToast(String msg) {
      Fluttertoast.showToast(
          msg: msg,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 2,
          textColor: Colors.white,
          fontSize: 16.0);
    }

    void addCart() async {
      for (int i = 0; i < 2; i++) {
        name = Next.sendName();
      }
      final databaseRef = FirebaseDatabase.instance
          .ref('users')
          .child(name)
          .child(medDataModel.name);
      databaseRef.update({'state': 'Ordered', 'product': medDataModel.name});
      createToast('Ordered Successfully');

      CollectionReference users = FirebaseFirestore.instance.collection('cart');
      users.add({
        'name': name,
        'product': medDataModel.name,
        'state': 'cart',
      });
    }

    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF0024FC),
          toolbarHeight: 70,
          centerTitle: true,
          title: Text(medDataModel.name,
              style:
                  const TextStyle(fontSize: 25, fontWeight: FontWeight.w400)),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(medDataModel.ImageUrl),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Description',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: SingleChildScrollView(
                  child: SizedBox(
                      width: double.infinity,
                      height: 250,
                      child: SingleChildScrollView(
                        child: Text(
                          medDataModel.desc,
                          style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 20,
                              height: 1.4),
                        ),
                      )),
                ),
              ),
              SizedBox(
                width: 180,
                height: 50,
                child: ElevatedButton.icon(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Color(0xFF0024FC)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    )),
                  ),
                  onPressed: () {
                    showAlertDialog(BuildContext context) {
                      // set up the buttons
                      Widget cancelButton = ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                          MaterialStateProperty.all(Color(0xFF0024FC)),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              )),
                        ),
                        child: const Text("Cancel"),
                        onPressed: () {
                          Navigator.of(context, rootNavigator: true).pop();
                        },
                      );
                      Widget yesButton = ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                          MaterialStateProperty.all(Color(0xFF0024FC)),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              )),
                        ),
                        child: const Text("Yes"),
                        onPressed: () async {
                          addCart();
                          Navigator.of(context, rootNavigator: true).pop();
                        },
                      );
                      // set up the AlertDialog
                      AlertDialog alert = AlertDialog(
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30.0))
                        ),
                        title: const Text("Confirm Order"),
                        content: const Text(
                            "Would you like to Order this Item?"),
                        actions: [
                          cancelButton,
                          yesButton,
                        ],
                      );
                      // show the dialog
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return alert;
                        },
                      );
                    }
                    showAlertDialog(context);
                    // On Pressed
                  },
                  icon: Icon(Icons.add_shopping_cart_rounded),
                  label: const Text(
                    'Order Now',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
