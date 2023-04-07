import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'dashboard.dart';



class SignIn extends StatefulWidget {
   SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  GlobalKey<FormState>formkey=GlobalKey<FormState>();
   late String _password, _email;


   void signIn(BuildContext context) async {
     await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password).catchError((onError){
       print(onError);
     }).then((authuser){
       if(authuser.user !=null)
         Navigator.push(context, MaterialPageRoute(builder: (context)=>Dashboard()));
     });
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(250, 250, 250, 1),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child:Form(
          key: formkey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/svg/undraw_welcome_cats_thqn.svg',
                height: 250,
                allowDrawingOutsideViewBox: true,
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: TextFormField(
                  onSaved: (value){
                    _email = value!;
                  },
                 validator: (email){
                   if(email!.isEmpty) {
                     return "Please Enter The Email Id";
                   } else if (
                   !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email))
                     return "please Enter the valid Email ID";
                     return null;
                 },
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.mail), label: Text('Email')),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: TextFormField(
                  onSaved: (value){
                    _password = value!;
                  },
                  validator: (password){
                    if(password!.isEmpty)
                      return "Input the Password";
                    else if (password.length<8)
                      return "Minimum 8 character";
                    return null;
                  },
                  obscureText: true,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.lock), label: Text('Password')),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton.icon(
                onPressed: () {
                  if(formkey.currentState!.validate()){
                    formkey.currentState!.save();
                    signIn(context);
                   if (_email == "erdeva@gmail.com" && _password == "12341234"){
                    //  Navigator.push(context, MaterialPageRoute(builder: (context)=> Dashboard()));
                    }
                    //else{
                     // print("Invalid login Details");
                    },
                 // }
               // },
                icon: const Icon(Icons.login),
                label: const Text('Sign In'),
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0)),
                    minimumSize: const Size(double.infinity, 50)),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/sign_up');
                      },
                      child: const Text('Create account?')),
                  TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/forget_password');
                      },
                      child: const Text('Forget password')),
                ],
              )
            ],
          ),
        ),
      ),
      ),
    );
  }
}