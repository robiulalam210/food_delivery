import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../Utlis/utlis.dart';
import '../../const/AppColors.dart';


class DaliveryDetails extends StatefulWidget {
  var _product;

  DaliveryDetails(this._product);

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<DaliveryDetails> {

  bool loading = false;

  Future addToCart() async {
    // loading = true;
    // setState(() {});
    // final FirebaseAuth _auth = FirebaseAuth.instance;
    // var currentUser = _auth.currentUser;
    // CollectionReference _collectionRef =
    //     FirebaseFirestore.instance.collection("dalivery-cart-items");
    // return _collectionRef
    //     .doc(currentUser!.email)
    //     .collection("items")
    //     .doc()
    //     .set({
    //   "man_name": widget._product["name"],
    //   "man_phone": widget._product["phone"],
    //   "man_images": widget._product["profilePic"],
    //   "name": widget._product["product-name"],
    //   "price" :widget._product["price"],
    //   "images": widget._product["product-img"],
    // }).then((value) {
    //   loading = false;
    //   setState(() {});
    //   Utlis().toastMessage("Suessfully");
    //   // Navigator.push(
    //   //     context, MaterialPageRoute(builder: (context) => UserForm()));
    // }).onError((error, stackTrace) {
    //   loading = false;
    //   setState(() {});
    //   Utlis().toastMessage(error.toString());
    // });
  }

  TextEditingController? _nameController;

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


            Center(
              child: MaterialButton(

                minWidth: 250,
                height: 50,
                onPressed: () {

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: AppColors.deep_orange,
            child: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                )),
          ),
        ),

      ),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.only(left: 12, right: 12, top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Container(
                height: MediaQuery.of(context).size.height*0.3,
                decoration: BoxDecoration(
                    color: Colors.black,
                    image: DecorationImage(
                        image: NetworkImage(widget._product["profilePic"]),
                        fit: BoxFit.cover)),
              ),
            ),

            SizedBox(
              height:  MediaQuery.of(context).size.height*0.02,
            ),
            Text(
              widget._product['name'],
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            SizedBox(
              height:  MediaQuery.of(context).size.height*0.01,
            ),
            Text(widget._product['email'],
                maxLines: 4,
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14)),
            SizedBox(
              height:  MediaQuery.of(context).size.height*0.01,
            ),
            SizedBox(
              height:  MediaQuery.of(context).size.height*0.01,
            ),
            Text(
              " ${widget._product['phone']}",
              maxLines: 1,
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black),
            ),
            SizedBox(
              height:  MediaQuery.of(context).size.height*0.01,
            ),
            Expanded(
                child: Container(
                  child:  StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection("users-cart-items")
                        .doc(FirebaseAuth.instance.currentUser!.email)
                        .collection("items")
                        .snapshots(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      var data=snapshot.data;
                      if (data == null) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      return setDataToTextField(data);
    },
    ),


                )),
            Divider(),
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: () => addToCart(),
                child: loading
                    ? CircularProgressIndicator()
                    : Text(
                        "Add to cart",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                style: ElevatedButton.styleFrom(
                  primary: AppColors.deep_orange,
                  elevation: 3,
                ),
              ),
            ),
          ],
        ),
      )),
    );

  }

}
