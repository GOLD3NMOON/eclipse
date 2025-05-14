import 'package:eclipse/app/components/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(title: Text(''), centerTitle: true),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: size.height / 20),
            Container(
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Hi, Welcome Back! ",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  Icon(Icons.waving_hand_outlined, size: 35),
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: Text(
                "Sign In to Continue",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(height: size.height / 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                spacing: 15,
                children: [
                  CustomTextFormField(hintText: "Email"),
                  CustomTextFormField(hintText: "Password"),
                  OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      maximumSize: Size(double.infinity, 50),
                      minimumSize: Size(double.infinity, 50),
                      alignment: Alignment.center,
                    ),
                    child: Text("Login"),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an account?"),
                TextButton(
                  onPressed: () {},
                  child: Text("Sign Up"),
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    overlayColor: Color.fromRGBO(0, 0, 0, 0),
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
