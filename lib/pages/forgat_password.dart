import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';




class ForgatPassword extends StatefulWidget {
  const ForgatPassword({Key? key}) : super(key: key);

  @override
  State<ForgatPassword> createState() => _ForgatPasswordState();
}

class _ForgatPasswordState extends State<ForgatPassword> {
var _emailcontroller = TextEditingController();
GlobalKey<FormState>formkey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forget Password'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: formkey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 40,
                ),
                SvgPicture.asset(
                  'assets/svg/undraw_forgot_password_re_hxwm.svg',
                  height: 250,
                  allowDrawingOutsideViewBox: true,
                ),
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: _emailcontroller,
                  validator: (email){
                    if(email!.isEmpty) {
                      return "Please Enter The Email Id";
                    } else if (
                    !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email)) {
                      return "please Enter the valid Email ID";
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.mail), label: Text('Email')),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.all(5),
                  child: ElevatedButton.icon(
                    onPressed: () {
                      if(formkey.currentState!.validate()){
                        formkey.currentState!.save();

                      }
                    },
                    icon: const Icon(Icons.mail_outline),
                    label: const Text('Send Email'),
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0)),
                        minimumSize: const Size(double.infinity, 50)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}