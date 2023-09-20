import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:my_gym_app_v2/src/home/presentation/views/home_screen.dart';
import 'package:my_gym_app_v2/src/welcome/presentation/views/welcome_forget_password_screen.dart';

class WelcomeLoginForms extends StatefulWidget {
  const WelcomeLoginForms({super.key});

  @override
  State<WelcomeLoginForms> createState() => _WelcomeLoginFormsState();
}

class _WelcomeLoginFormsState extends State<WelcomeLoginForms> {
  bool _passwordVisible = false;

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
                  const SizedBox(height: 7),
                  Row(
                    children: [
                      const Spacer(),
                      GestureDetector(
                        key: const Key('forgot_password_button_in_login'),
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return const WelcomeForgetPasswordScreen();
                          }));
                        },
                        child: const Text(
                          'Forgot Password',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
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
                      key: const Key('login_button'),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return const HomeScreen();
                        }));
                      },
                      child: const Row(
                        children: [
                          Text('Login'),
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
