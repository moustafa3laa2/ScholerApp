import 'package:flutter/material.dart';
import 'package:schooler_app/constants.dart';
import 'package:schooler_app/screens/register_screen.dart';
import 'package:schooler_app/widgets/custom_button.dart';
import 'package:schooler_app/widgets/custom_text_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  static String id = 'LoginScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaaryColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
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
             CustomTextField(hintText: 'Email'),
            const SizedBox(
              height: 10,
            ),
             CustomTextField(hintText: 'Password'),
            const SizedBox(
              height: 10,
            ),
             CustomButton(
              buttonName: 'LOGIN',
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
    );
  }
}
