import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tasking/pages/sign_in.dart';

import 'firebase_auth_methods.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  @override
   void dispose(){
    super.dispose();
    emailcontroller.dispose();
    passwordcontroller.dispose();
  }

  void signUpUser()async{
    FirebaseAuthMethods(FirebaseAuth.instance).signUpWithEmail(
      email: emailcontroller.text,
      password: passwordcontroller.text,
      context: context,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Account'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 40,
              ),
              SvgPicture.asset(
                'assets/svg/undraw_launching_re_tomg.svg',
                height: 250,
                allowDrawingOutsideViewBox: true,
              ),
              TextFormField(
                controller: emailcontroller,
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.mail), label: Text('Email')),
              ),
              TextFormField(
                controller: passwordcontroller,
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.lock), label: Text('Password')),
              ),
              SizedBox(height: 20,),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton.icon(
                onPressed: () {
                   signUpUser();
                   Navigator.push(context, MaterialPageRoute(builder: (context)=>SignIn()));
                },
                icon: const Icon(Icons.login),
                label: const Text('Sign Up'),
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0)),
                    minimumSize: const Size(double.infinity, 50)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}