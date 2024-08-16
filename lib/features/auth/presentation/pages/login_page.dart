import 'package:benmore_amos/features/auth/presentation/pages/sign_up_page.dart';
import 'package:benmore_amos/features/posts/presentation/pages/post_page.dart';
import 'package:benmore_amos/features/shared/presentation/widgets/custom_button.dart';
import 'package:benmore_amos/features/shared/presentation/widgets/custom_text_field.dart';
import 'package:benmore_amos/utilities/app_colors.dart';
import 'package:benmore_amos/utilities/utilities.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SizedBox(
          height: height(context),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                'assets/logo.png',
                height: 100,
              ),
              const SizedBox(
                height: 48,
              ),
              const Text(
                'Login to Benmore Social',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(
                height: 48,
              ),
              CustomTextField(
                controller: TextEditingController(),
                hintText: 'Email',
                prefixIcon: 'assets/mail.svg',
              ),
              const SizedBox(
                height: 48,
              ),
              CustomTextField(
                controller: TextEditingController(),
                hintText: 'Password',
                prefixIcon: 'assets/lock.svg',
              ),
              const SizedBox(
                height: 24,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Forgot Password?',
                    style: TextStyle(
                      color: ebonyClay,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 48,
              ),
              CustomButton(
                title: 'Login',
                onTap: () {
                  Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (BuildContext context) => const PostPage()));
                },
              ),
              const SizedBox(
                height: 48,
              ),
              InkWell(
                onTap: () {
                  Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (BuildContext context) => const SignUpPage()));
                },
                child: const Center(
                  child: Text(
                    'Don\'t have an account? Sign up',
                    style: TextStyle(
                      fontSize: 16,
                      color: ebonyClay,
                      fontWeight: FontWeight.w700
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
