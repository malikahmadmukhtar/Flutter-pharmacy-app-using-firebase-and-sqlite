import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'medDetail.dart';
import 'medmodal.dart';

class Tubes extends StatelessWidget {
  Tubes({super.key});

  static List<String> medname = [
    'Dermovate',
    'Clobevate',
    'Betnovate',
    'Quench Cream',
    'Lignocaine Gel',
    'Revomet Gel',
  ];
  static List url = [
    'medimage/tubedermovate.png',
    'medimage/tubeclobevate.png',
    'medimage/tubebetnovate.png',
    'medimage/tubequench.png',
    'medimage/tubelignocaine.png',
    'medimage/tuberevomet.png'
  ];
  static List desc = [
    'Most immunizations that prevent you from catching diseases like measles, whooping cough, and chickenpox are given by injection. \nNo one thinks shots are fun. But the diseases they prevent can be very serious and cause symptoms that last much longer than the temporary discomfort of the shot. \nTo make life easier, now you can get immunizations at many pharmacies.',
    'Most immunizations that prevent you from catching diseases like measles, whooping cough, and chickenpox are given by injection. \nNo one thinks shots are fun. But the diseases they prevent can be very serious and cause symptoms that last much longer than the temporary discomfort of the shot. \nTo make life easier, now you can get immunizations at many pharmacies.',
    'Most immunizations that prevent you from catching diseases like measles, whooping cough, and chickenpox are given by injection. \nNo one thinks shots are fun. But the diseases they prevent can be very serious and cause symptoms that last much longer than the temporary discomfort of the shot. \nTo make life easier, now you can get immunizations at many pharmacies.',
    'Most immunizations that prevent you from catching diseases like measles, whooping cough, and chickenpox are given by injection. \nNo one thinks shots are fun. But the diseases they prevent can be very serious and cause symptoms that last much longer than the temporary discomfort of the shot. \nTo make life easier, now you can get immunizations at many pharmacies.',
    'Most immunizations that prevent you from catching diseases like measles, whooping cough, and chickenpox are given by injection. \nNo one thinks shots are fun. But the diseases they prevent can be very serious and cause symptoms that last much longer than the temporary discomfort of the shot. \nTo make life easier, now you can get immunizations at many pharmacies.',
    'Most immunizations that prevent you from catching diseases like measles, whooping cough, and chickenpox are given by injection. \nNo one thinks shots are fun. But the diseases they prevent can be very serious and cause symptoms that last much longer than the temporary discomfort of the shot. \nTo make life easier, now you can get immunizations at many pharmacies.'
  ];
  final List<MedDataModel> Meddata = List.generate(
      medname.length,
          (index) =>
          MedDataModel('${medname[index]}', '${url[index]}', '${desc[index]}'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: const Color(0xFF0024FC),
          toolbarHeight: 70,
          title: const Text('Ointments & Gels',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400)),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 30.0),
          child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10),
              itemCount: Meddata.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(CupertinoPageRoute(
                            builder: (context) => MedDetail(
                              medDataModel: Meddata[index],
                            )));
                      },
                      child: Container(
                        width: 170,
                        height: 149,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                              color: Colors.black26,
                            ),
                            image: DecorationImage(
                                image: AssetImage(Meddata[index].ImageUrl),
                                fit: BoxFit.cover)),
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Text(Meddata[index].name),
                  ],
                );
              }),
        ));
  }
}
