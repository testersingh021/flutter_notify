import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' show json;




class SocialLoginScreen extends StatefulWidget {
  const SocialLoginScreen({Key? key}) : super(key: key);

  @override
  _SocialLoginScreenState createState() => _SocialLoginScreenState();
}

class _SocialLoginScreenState extends State<SocialLoginScreen>
    with SingleTickerProviderStateMixin {


  @override
  void initState() {
    super.initState();
    login();
  }

  void login() async {
    GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: [
        'email',
        // you can add extras if you require
      ],
    );

    try {
      _googleSignIn.signIn().then((GoogleSignInAccount? acc) async {
        GoogleSignInAuthentication? auth = await acc!.authentication;
        print(acc.id);
        print(acc.email);
        print(acc.displayName);
        print(acc.photoUrl);
        Fluttertoast.showToast(
            msg: "${acc.displayName}",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black,
            textColor: Colors.white,
            fontSize: 16.0);

        acc.authentication.then((GoogleSignInAuthentication auth) async {
          print(auth.idToken);
          print(auth.accessToken);
        });
      });
    }catch(e){
      print(e);
      Fluttertoast.showToast(
          msg: "${e}",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0);

    }
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Welcome'),
      ),
      body: const Center(child:Text('Hello World') ,)
    );

  }

}

