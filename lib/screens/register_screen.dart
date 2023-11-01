import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:schooler_app/constants.dart';
import 'package:schooler_app/helper/show_snack_bar.dart';
import 'package:schooler_app/screens/chat_screen.dart';
import 'package:schooler_app/widgets/custom_button.dart';
import 'package:schooler_app/widgets/custom_text_field.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({super.key});
  static String id = 'RegisterScreen';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String? email, password;

  bool isLoading = false;

  GlobalKey<FormState> formKey = GlobalKey();

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
                  image: AssetImage(kLogo),
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
                    'REGISTER',
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
                  obscureText: true,
                  hintText: 'Password',
                  onChanged: (data) {
                    password = data;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomButton(
                  onTap: () async {
                    if (formKey.currentState!.validate()) {
                      isLoading = true;
                      setState(() {});
                      try {
                        await userRegister();
                        // showSnackBar(context, 'Success');
                        Navigator.pushNamed(context, ChatScreen.id,arguments: email);
                      } on FirebaseAuthException catch (ex) {
                        if (ex.code == 'weak-password') {
                          showSnackBar(context, 'Weak Password');
                        } else if (ex.code == 'email-already-in-use') {
                          showSnackBar(context, 'email already in use');
                        }
                      } catch (ex) {
                        showSnackBar(context, ex.toString());
                      }

                      isLoading = false;
                      setState(() {});
                    }
                  },
                  buttonName: 'REGISTER',
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'alreay have account  ',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        '  Login',
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

  Future<void> userRegister() async {
    UserCredential userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email!, password: password!);
  }
}
