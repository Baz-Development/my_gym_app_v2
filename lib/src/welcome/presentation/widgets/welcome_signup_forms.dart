import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:my_gym_app_v2/src/signup/presentation/views/signup_screen.dart';

class WelcomeSignupForms extends StatefulWidget {
  const WelcomeSignupForms({super.key});

  @override
  State<WelcomeSignupForms> createState() => _WelcomeSignupFormsState();
}

class _WelcomeSignupFormsState extends State<WelcomeSignupForms> {
  bool _passwordVisible = false;
  bool _passwordAgainVisible = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromRGBO(28, 28, 30, 0.5),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                children: [
                  Form(
                    autovalidateMode: AutovalidateMode.always,
                    child: TextFormField(
                      validator: (value) => EmailValidator.validate(value!) ? null : "Please enter a valid email",
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        label: Text(
                          "Email",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  TextField(
                    style: const TextStyle(color: Colors.white),
                    obscureText: !_passwordVisible,
                    decoration: InputDecoration(
                      label: const Text(
                        "Password",
                        style: TextStyle(color: Colors.white),
                      ),
                      suffixIcon: IconButton(
                        key: const Key('password_toggle'),
                        icon: Icon(
                          // Based on passwordVisible state choose the icon
                          _passwordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          setState(() {
                            _passwordVisible = !_passwordVisible;
                          });
                        },
                      ),
                    ),
                  ),
                  TextField(
                    style: const TextStyle(color: Colors.white),
                    obscureText: !_passwordAgainVisible,
                    decoration: InputDecoration(
                      label: const Text(
                        "Password Again",
                        style: TextStyle(color: Colors.white),
                      ),
                      suffixIcon: IconButton(
                        key: const Key('password_again_toggle'),
                        icon: Icon(
                          // Based on passwordVisible state choose the icon
                          _passwordAgainVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          setState(() {
                            _passwordAgainVisible = !_passwordAgainVisible;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 48),
              Padding(
                padding: const EdgeInsets.only(left: 32, right: 32),
                child: Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                        backgroundColor:
                        const Color.fromRGBO(58, 58, 60, 1),
                      ),
                      child: const Icon(
                        Icons.apple,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                        backgroundColor:
                        const Color.fromRGBO(58, 58, 60, 1),
                      ),
                      child: const Icon(
                        Icons.g_mobiledata_rounded,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                    const Spacer(),
                    ElevatedButton(
                      key: const Key('signup_button'),
                      onPressed: () {
                        // signup logic
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return const SignupScreen();
                        }));
                      },
                      child: const Row(
                        children: [
                          Text('Sign up'),
                          Icon(Icons.arrow_forward_ios),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
