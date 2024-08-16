import 'package:benmore_amos/features/posts/presentation/pages/post_page.dart';
import 'package:benmore_amos/features/shared/presentation/widgets/custom_button.dart';
import 'package:benmore_amos/features/shared/presentation/widgets/custom_text_field.dart';
import 'package:benmore_amos/utilities/utilities.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
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
            children:  [
              Image.asset('assets/logo.png', height: 100,),
              const SizedBox(height: 48,),
              const Text(
                'SignUp to Benmore Social',
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
                hintText: 'Username',
                prefixIcon: 'assets/user.svg',
              ),
              const SizedBox(height: 48,),
              CustomTextField(
                controller: TextEditingController(),
                hintText: 'Email',
                prefixIcon: 'assets/mail.svg',
              ),
              const SizedBox(height: 48,),
              CustomTextField(
                controller: TextEditingController(),
                hintText: 'Password',
                prefixIcon: 'assets/lock.svg',
              ),
              const SizedBox(height: 48,),
              CustomButton(
                title: 'Register',
                onTap: () {
                  Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (BuildContext context) => const PostPage()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
