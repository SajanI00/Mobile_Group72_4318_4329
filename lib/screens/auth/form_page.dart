// import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class FormPage extends StatefulWidget {
//   const FormPage({Key? key}) : super(key: key);

//   @override
//   State<FormPage> createState() => _FormPageState();
// }

// class _FormPageState extends State<FormPage> {
//   final nameController = TextEditingController();
//   final contactController = TextEditingController();
//   final dateController = TextEditingController();
//   final locationController = TextEditingController();
//   final typeController = TextEditingController();
//   final descriptionController = TextEditingController();

//   FirebaseFirestore firestore = FirebaseFirestore.instance;

//   String name = '';
//   String contactNumber = '';
//   DateTime date = DateTime(0);
//   String location = '';
//   String type = '';
//   String description = '';

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.green,
//         elevation: 8,
//         title: Text("Information Form"),
//       ),
//       body: Container(
//         padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
//         child: new Form(
//             child: Column(
//           children: [
//             TextFormField(
//               controller: nameController,
//               onChanged: (val) => setState(() {
//                 name = val;
//               }),
//               decoration: InputDecoration(labelText: 'Name'),
//             ),
//             TextFormField(
//               controller: contactController,
//               onChanged: (val) => setState(() {
//                 contactNumber = val;
//               }),
//             ),
//             TextFormField(
//               controller: locationController,
//               onChanged: (val) => setState(() {
//                 location = val;
//               }),
//             ),
//             TextFormField(
//               controller: typeController,
//               onChanged: (val) => setState(() {
//                 type = val;
//               }),
//             ),
//             TextFormField(
//               controller: descriptionController,
//               onChanged: (val) => setState(() {
//                 description = val;
//               }),
//             ),
//             ElevatedButton(
//               onPressed: () async {
//                 name = nameController.text;
//                 contactNumber = contactController.text;
//                 location = locationController.text;
//                 type = typeController.text;
//                 description = descriptionController.text;

//                 // Map<String, dynamic> recordData = {
//                 //   'name': name,
//                 //   'contactNumber': contactNumber,
//                 //   'date': Timestamp.fromDate(DateTime.now()),
//                 //   'location': location,
//                 //   'type': type,
//                 //   'description': description,
//                 // };

//                 createRecord(
//                     name: name,
//                     contactNumber: contactNumber,
//                     location: location,
//                     type: type,
//                     description: description);

//                 // CollectionReference records =
//                 //     FirebaseFirestore.instance.collection('records');

//                 // await records.add(recordData);

//                 // controller.clear();
//                 // setState(() {
//                 //   name = '';
//                 //   contactNumber = '';
//                 //   location = '';
//                 //   type = '';
//                 //   description = '';
//                 // });
//               },
//               child: Text('Submit'),
//             )
//           ],
//         )),
//       ),
//     );
//   }

//   Future createRecord(
//       {required String name,
//       required String contactNumber,
//       String location = '',
//       required String type,
//       required String description}) async {
//     final docRecord = FirebaseFirestore.instance.collection('records').doc();

//     final record = Record(
//       id: docRecord.id,
//       name: name,
//       contactNumber: contactNumber,
//       //date: Timestamp.fromDate(DateTime.now()),
//       location: location,
//       type: type,
//       description: description,
//     );

//     final json = record.toJson();

//     await docRecord.set(json);
//   }
// }

// class Record {
//   String id;
//   final String name;
//   final String contactNumber;
//   //final DateTime date;
//   final String location;
//   final String type;
//   final String description;

//   Record({
//     this.id = '',
//     required this.name,
//     required this.contactNumber,
//     //required this.date,
//     this.location = '',
//     required this.type,
//     required this.description,
//   });

//   Map<String, dynamic> toJson() => {
//         'id': id,
//         'name': name,
//         'contactNumber': contactNumber,
//         'location': location,
//         'type': type,
//         'description': description,
//       };
// }
