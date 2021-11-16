import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

/// Form for the Sign In screen.
class SignInForm extends StatefulWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  // Set fields controllers.
  final _emailFieldController = TextEditingController();
  final _passwordFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          'Sign In',
          style: Theme.of(context).textTheme.headline4,
        ),
        const SizedBox(height: 24),
        TextFormField(
          controller: _emailFieldController,
          keyboardType: TextInputType.emailAddress,
          decoration: const InputDecoration(
            labelText: 'Enter your email address',
            prefixIcon: Icon(CupertinoIcons.at),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(16.0)),
            ),
          ),
        ),
        const SizedBox(height: 16),
        TextFormField(
          controller: _passwordFieldController,
          keyboardType: TextInputType.visiblePassword,
          obscureText: true,
          autocorrect: false,
          decoration: const InputDecoration(
            labelText: 'Enter your password',
            prefixIcon: Icon(CupertinoIcons.lock),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(16.0)),
            ),
          ),
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          child: const Text('Sign In', style: TextStyle(fontSize: 16)),
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            padding: const EdgeInsets.symmetric(
              vertical: 20.0,
              horizontal: 28.0,
            ),
          ),
          onPressed: () {},
        ),
      ],
    );
  }
}
