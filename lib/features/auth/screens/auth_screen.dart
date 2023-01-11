import 'package:amazon_clone/constants/Global_variables.dart';
import 'package:amazon_clone/features/auth/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:amazon_clone/features/auth/widgets/custom_text_form.dart';

enum Auth {
  signin,
  signup,
}

class AuthScreen extends StatefulWidget {
  static const String routeName = '/auth-screen';
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  Auth _auth = Auth.signup;
  final _signupFormKey = GlobalKey<FormState>();
  final _signinFormKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalVariables.greyBackgroundCOlor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'WELCOME',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ListTile(
                tileColor: _auth == Auth.signup
                    ? GlobalVariables.backgroundColor
                    : GlobalVariables.greyBackgroundCOlor,
                title: const Text(
                  'Create Account',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                  ),
                ),
                leading: Radio(
                  value: Auth.signup,
                  groupValue: _auth,
                  onChanged: (Auth? val) {
                    setState(() {
                      _auth = val!;
                    });
                  },
                  activeColor: GlobalVariables.secondaryColor,
                ),
              ),
              if (_auth == Auth.signup)
                Container(
                  padding: const EdgeInsets.all(8.0),
                  color: GlobalVariables.backgroundColor,
                  child: Form(
                    key: _signupFormKey,
                    child: Column(
                      children: [
                        CustomTextFormField(
                          controller: _nameController,
                          textEditinLabel: 'Name',
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomTextFormField(
                          controller: _emailController,
                          textEditinLabel: 'Email',
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomTextFormField(
                          controller: _passwordController,
                          textEditinLabel: 'Password',
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomButton(buttonText: 'Signup', onTap: () {})
                      ],
                    ),
                  ),
                ),
              ListTile(
                title: const Text(
                  'Login',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                  ),
                ),
                leading: Radio(
                  value: Auth.signin,
                  groupValue: _auth,
                  onChanged: (Auth? val) {
                    setState(() {
                      _auth = val!;
                    });
                  },
                  activeColor: GlobalVariables.secondaryColor,
                ),
              ),
              if (_auth == Auth.signin)
                Container(
                  padding: const EdgeInsets.all(8.0),
                  color: GlobalVariables.backgroundColor,
                  child: Form(
                    key: _signinFormKey,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        CustomTextFormField(
                          controller: _emailController,
                          textEditinLabel: 'Email',
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomTextFormField(
                          controller: _passwordController,
                          textEditinLabel: 'Password',
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomButton(buttonText: 'Login', onTap: () {})
                      ],
                    ),
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
