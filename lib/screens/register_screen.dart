import 'package:flutter/material.dart';
import 'package:schooler_app/screens/login_screen.dart';
import 'package:schooler_app/widgets/custom_button.dart';
import 'package:schooler_app/widgets/custom_text_field.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff2B475E),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          children: [
            const Spacer(
              flex: 1,
            ),
            const Image(
              image: AssetImage('assets/images/scholar.png'),
            ),
            const Text(
              'Scholar Chat',
              style: TextStyle(
                  fontSize: 32,
                  fontFamily: 'Pacifico-Regular',
                  color: Colors.white),
            ),
            const Spacer(
              flex: 2,
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
            const CustomTextField(hintText: 'Email'),
            const SizedBox(
              height: 10,
            ),
            const CustomTextField(hintText: 'Password'),
            const SizedBox(
              height: 10,
            ),
            const CustomButton(
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
                    Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => const LoginScreen(),
                      ),
                    );
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
            const Spacer(
              flex: 3,
            ),
          ],
        ),
      ),
    );
  }
}
