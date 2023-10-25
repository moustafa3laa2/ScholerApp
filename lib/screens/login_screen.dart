import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:schooler_app/constants.dart';
import 'package:schooler_app/helper/show_snack_bar.dart';
import 'package:schooler_app/screens/register_screen.dart';
import 'package:schooler_app/widgets/custom_button.dart';
import 'package:schooler_app/widgets/custom_text_field.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});
  static String id = 'LoginScreen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isLoading = false;

  GlobalKey<FormState> formKey = GlobalKey();

  String? email, password;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        backgroundColor: kPrimaaryColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Form(
            key: formKey,
            child: ListView(
              children: [
                const SizedBox(
                  height: 50,
                ),
                const Image(
                  image: AssetImage('assets/images/scholar.png'),
                  height: 100,
                ),
                const Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Scholar Chat',
                    style: TextStyle(
                        fontSize: 32,
                        fontFamily: 'Pacifico-Regular',
                        color: Colors.white),
                  ),
                ),
                const SizedBox(
                  height: 60,
                ),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'LOGIN',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  hintText: 'Email',
                  onChanged: (data) {
                    email = data;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  hintText: 'Password',
                  onChanged: (data) {
                    password = data;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomButton(
                  buttonName: 'LOGIN',
                  onTap: () async {
                    if (formKey.currentState!.validate()) {

                      isLoading = true;
                      setState(() {});
                      try {
                        await loginUser();
                        showSnackBar(context, 'Login Success');
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'user-not-found') {
                          showSnackBar(
                              context, 'No user found for that email.');
                        } else if (e.code == 'wrong-password') {
                          showSnackBar(context,
                              'Wrong password provided for that user.');
                        }
                      } catch (e) {
                        showSnackBar(context, e.toString());
                      }
                      
                      isLoading = false;
                      setState(() {});
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'don\'t have an account? ',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, RegisterScreen.id);
                      },
                      child: const Text(
                        '  Register',
                        style: TextStyle(
                          color: Color(0xffC7EDE6),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> loginUser() async {
     UserCredential userCredential = await FirebaseAuth
        .instance
        .signInWithEmailAndPassword(
            email: email!, password: password!);
  }

 
}
