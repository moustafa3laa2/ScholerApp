import 'package:flutter/material.dart';
import 'package:schooler_app/widgets/custom_button.dart';
import 'package:schooler_app/widgets/custom_text_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xff2B475E),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          children: [
            Spacer(flex: 1,),
            Image(
              image: AssetImage('assets/images/scholar.png'),
            ),
            Text(
              'Scholar Chat',
              style: TextStyle(
                  fontSize: 32,
                  fontFamily: 'Pacifico-Regular',
                  color: Colors.white),
            ),
            Spacer(flex: 2,),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                'LOGIN',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 20,),
            CustomTextField(hintText: 'Email'),
            SizedBox(height: 10,),
            CustomTextField(hintText: 'Password'),
            SizedBox(height: 10,),
            CustomButton(
              buttonName: 'LOGIN',
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'don\'t have an account? ',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                Text(
                  '  Register',
                  style: TextStyle(
                    color: Color(0xffC7EDE6),
                  ),
                ),

              ],
            ),
          Spacer(flex: 3,),
          ],
        ),
      ),
    );
  }
}
