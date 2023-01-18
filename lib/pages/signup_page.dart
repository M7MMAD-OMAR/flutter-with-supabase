import 'package:flutter/material.dart';
import 'package:supabase/supabase.dart';

import '../utils/constant.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isLoading = false;

  // [createUser]
  Future<bool?> createUser({
    required final String email,
    required final String password,
  }) async {
    try {
      final AuthResponse res = await supabase.auth.signUp(
        email: email,
        password: password,
      );
      final Session? session = res.session;
      final User? user = res.user;
      print("--------------------${user?.email}");
    } on AuthException catch (e) {
      context.showErrorSnackBar(message: e.message.toString());
      print(e);
    } on Exception catch (e) {
      context.showErrorSnackBar(message: e.toString());
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Email TextInput
            TextFormField(
              controller: _emailController,
            ),
            smallGap,

            // Password TextInput
            TextFormField(
              controller: _passwordController,
              obscureText: true,
            ),
            largeGap,

            // Signin Button
            isLoading
                ? Container(
                    height: 30,
                    width: 30,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
                : OutlinedButton(
                    child: Text("Sign Up"),
                    onPressed: () async {
                      final userVal = await createUser(
                        email: _emailController.text,
                        password: _passwordController.text,
                      );

                      if (userVal == true) {
                        Navigator.pushNamed(context, '/signin');
                        context.showErrorSnackBar(message: "Success");
                      }
                    },
                  ),
          ],
        ),
      ),
    );
  }
}
