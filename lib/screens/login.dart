import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:yatek/screens/profile.dart';
import 'package:yatek/widgets/login_fields.dart';
import 'package:yatek/widgets/login_padding.dart';
import 'package:yatek/widgets/logo.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MaterialApp(debugShowCheckedModeBanner: false, home: Login()));
}

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  onNavigatetoProfile() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const Profile()));
  }

  onLogin() async {
    var email = emailController.text;
    var password = passwordController.text;
    if (email.isEmpty || password.isEmpty) {
      print('Please enter all form fields');
    } else {
      try {
        final credential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password);
        if (credential.user != null) {
          onNavigatetoProfile();
        }
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          print('No user found for that email.');
        } else if (e.code == 'wrong-password') {
          print('Wrong password provided for that user.');
        }
      } catch (e) {
        onNavigatetoProfile();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Material(
        child: Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: SizedBox(
          width: screenWidth,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              returnLogo(context),
              returnPadding(context),
              emailField(context, emailController),
              returnPadding(context),
              passwordField(context, passwordController),
              returnPadding(context),
              InkWell(
                  onTap: () {
                    onLogin();
                  },
                  child: Container(
                    width: screenWidth * 0.6,
                    height: screenHeight * 0.07,
                    color: Colors.black,
                    alignment: Alignment.center,
                    child: Text(
                      "Continue",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: screenWidth * 0.04,
                          fontWeight: FontWeight.bold),
                    ),
                  ))
            ],
          )),
    ));
  }
}
