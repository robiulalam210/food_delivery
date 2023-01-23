import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../const/AppColors.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  TextEditingController? _nameController;
  TextEditingController? _phoneController;
  TextEditingController? _ageController;
  TextEditingController? _dobController;

  setDataToTextField(data) {
    return Container(
      width: double.infinity,
      child: Container(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [  SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
            TextFormField(
              decoration: InputDecoration(border: OutlineInputBorder()),
              controller: _nameController =
                  TextEditingController(text: data['name']),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            TextFormField(
              decoration: InputDecoration(border: OutlineInputBorder()),
              controller: _phoneController =
                  TextEditingController(text: data['phone']),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            TextFormField(
              decoration: InputDecoration(border: OutlineInputBorder()),
              controller: _ageController =
                  TextEditingController(text: data['age']),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            TextFormField(
              decoration: InputDecoration(border: OutlineInputBorder()),
              controller: _ageController =
                  TextEditingController(text: data['dob']),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            Center(
              child: MaterialButton(

                minWidth: 250,
                height: 50,
                onPressed: () {
                  updateData();
                },
                color: AppColors.deep_orange,
                child: Text(
                  "Update",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  updateData() {
    CollectionReference _collectionRef =
        FirebaseFirestore.instance.collection("users-form-data");
    return _collectionRef.doc(FirebaseAuth.instance.currentUser!.email).update({
      "name": _nameController!.text,
      "phone": _phoneController!.text,
      "age": _ageController!.text,
      "dob": _dobController!.text,
    }).then((value) => print("Updated Successfully"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection("users-form-data")
                .doc(FirebaseAuth.instance.currentUser!.email)
                .snapshots(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              var data = snapshot.data;
              if (data == null) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              return setDataToTextField(data);
            },
          ),
        ),
      )),
    );
  }
}
