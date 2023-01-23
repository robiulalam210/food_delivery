
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../const/AppColors.dart';
import '../../provider/auth_provider.dart';
import 'login_screen.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _obscureText = true;

  signUp() async {
    // Navigator.of(context)
    //     .push(MaterialPageRoute(builder: (context) => UserForm()));
    // try {
    //   UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
    //       email: _emailController.text,
    //       password: _passwordController.text
    //   );
    //   var authCredential = userCredential.user;
    //   print(authCredential!.uid);
    //   if(authCredential.uid.isNotEmpty){
    //     //Navigator.push(context, CupertinoPageRoute(builder: (_)=>UserForm()));
    //   }
    //   else{
    //     Fluttertoast.showToast(msg: "Something is wrong");
    //   }
    //
    // } on FirebaseAuthException catch (e) {
    //   if (e.code == 'weak-password') {
    //     Fluttertoast.showToast(msg: "The password provided is too weak.");
    //
    //   } else if (e.code == 'email-already-in-use') {
    //     Fluttertoast.showToast(msg: "The account already exists for that email.");
    //
    //   }
    // } catch (e) {
    //   print(e);
    // }
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      backgroundColor:AppColors.deep_orange,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.20,
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.only(left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: null,
                      icon: Icon(
                        Icons.light,
                        color: Colors.transparent,
                      ),
                    ),
                    Text(
                      "Registration",
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(28),
                    topRight: Radius.circular(28),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.05,
                        ),
                        Text(
                          "Welcome Buddy!",
                          style: TextStyle(
                              fontSize: 20, color:AppColors.deep_orange),
                        ),
                        Text(
                          "Glad to see you back my buddy.",
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xFFBBBBBB),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        Row(
                          children: [
                            Container(
                              height: 48,
                              width: 41,
                              decoration: BoxDecoration(
                                  color: AppColors.deep_orange,
                                  borderRadius: BorderRadius.circular(12)),
                              child: Center(
                                child: Icon(
                                  Icons.email_outlined,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ),
                            ),
                            SizedBox(
                              width:MediaQuery.of(context).size.width * 0.03,
                            ),
                            Expanded(
                              child: TextField(
                                keyboardType: TextInputType.emailAddress,
                                controller: _emailController,
                                decoration: InputDecoration(
                                  hintText: "thed9954@gmail.com",
                                  hintStyle: TextStyle(
                                    fontSize: 12,
                                    color: Color(0xFF414041),
                                  ),
                                  labelText: 'EMAIL',
                                  labelStyle: TextStyle(
                                    fontSize: 12,
                                    color: AppColors.deep_orange,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        Row(
                          children: [
                            Container(
                              height: 48,
                              width: 41,
                              decoration: BoxDecoration(
                                  color: AppColors.deep_orange,
                                  borderRadius: BorderRadius.circular(12)),
                              child: Center(
                                child: Icon(
                                  Icons.lock_outline,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.03,
                            ),
                            Expanded(
                              child: TextField(
                                controller: _passwordController,
                                obscureText: _obscureText,
                                keyboardType: TextInputType.text,

                                decoration: InputDecoration(
                                  hintText: "password must be 6 character",
                                  hintStyle: TextStyle(
                                    fontSize: 12,
                                    color: Color(0xFF414041),
                                  ),
                                  labelText: 'PASSWORD',
                                  labelStyle: TextStyle(
                                    fontSize: 12,
                                    color: AppColors.deep_orange,
                                  ),
                                  suffixIcon: _obscureText == true
                                      ? IconButton(
                                          onPressed: () {
                                            setState(() {
                                              _obscureText = false;
                                            });
                                          },
                                          icon: Icon(
                                            Icons.remove_red_eye,
                                            size: 20,
                                          ))
                                      : IconButton(
                                          onPressed: () {
                                            setState(() {
                                              _obscureText = true;
                                            });
                                          },
                                          icon: Icon(
                                            Icons.visibility_off,
                                            size: 20,
                                          )),
                                ),
                              ),
                            ),
                          ],
                        ),

                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.05,
                        ),
                        // elevated button
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {
                              var email = _emailController.text.toString();
                              var password =
                                  _passwordController.text.toString();
                              authProvider.auth_signup(
                                  email, password, context);
                            },
                            child: authProvider.loding
                                ? CircularProgressIndicator()
                                : Text(
                                    "Continue",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18),
                                  ),
                            style: ElevatedButton.styleFrom(
                              primary: AppColors.deep_orange,
                              elevation: 3,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Wrap(
                          children: [
                            Text(
                              "Don't have an account?",
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFFBBBBBB),
                              ),
                            ),
                            GestureDetector(
                              child: Text(
                                " Sign In",
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.deep_orange,
                                ),
                              ),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                        builder: (context) => LoginScreen()));
                              },
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
