import 'package:benmore_amos/features/auth/data/bloc/auth_cubit.dart';
import 'package:benmore_amos/features/auth/data/models/login_request.dart';
import 'package:benmore_amos/features/auth/presentation/pages/sign_up_page.dart';
import 'package:benmore_amos/features/posts/presentation/pages/post_page.dart';
import 'package:benmore_amos/features/shared/presentation/widgets/custom_button.dart';
import 'package:benmore_amos/features/shared/presentation/widgets/custom_text_field.dart';
import 'package:benmore_amos/utilities/app_colors.dart';
import 'package:benmore_amos/utilities/form_mixin.dart';
import 'package:benmore_amos/utilities/snackbar_mixin.dart';
import 'package:benmore_amos/utilities/utilities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with FormMixin, SnackBarMixin {
  final ValueNotifier<bool> _isLoading = ValueNotifier(false);
  AuthCubit authCubit = AuthCubit();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final ValueNotifier<bool> _isPasswordVisible = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: BlocListener<AuthCubit, AuthState>(
        bloc: authCubit,
        listener: (context, state) {
          if (state is LoginLoading) {
            _isLoading.value = true;
          }
          if (state is LoginSuccess) {
            _isLoading.value = false;
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => const PostPage()));
          }
          if (state is LoginError) {
            _isLoading.value = false;
            showSnackBar(context, state.error);
          }
        },
        child: SizedBox(
          height: height(context),
          child: Form(
            key: _formKey,
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              children: [
                Column(
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
                      controller: emailController,
                      hintText: 'Email',
                      prefixIcon: 'assets/mail.svg',
                      validator: isValidEmailAddress,
                    ),
                    const SizedBox(
                      height: 48,
                    ),
                    ValueListenableBuilder<bool>(
                      valueListenable: _isPasswordVisible,
                      builder: (context, isPasswordVisible, child) {
                        return CustomTextField(
                          controller: passwordController,
                          hintText: 'Password',
                          prefixIcon: 'assets/lock.svg',
                          obscureText: !isPasswordVisible,
                          suffixIcon: IconButton(
                            icon: SvgPicture.asset(
                              isPasswordVisible ? 'assets/eye-off.svg' : 'assets/eye.svg',
                              height: 24,
                              colorFilter: const ColorFilter.mode(ebonyClay, BlendMode.srcIn),
                            ),
                            onPressed: () {
                              _isPasswordVisible.value = !isPasswordVisible;
                            },
                          ),
                          validator: validatePassword(
                            shouldContainCapitalLetter: false,
                            shouldContainNumber: false,
                            shouldContainSmallLetter: false,
                            shouldContainSpecialChars: false,
                          ),
                        );
                      },
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
                      isLoading: _isLoading,
                      onTap: login,
                    ),
                    const SizedBox(
                      height: 48,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context, MaterialPageRoute(builder: (BuildContext context) => const SignUpPage()));
                      },
                      child: const Center(
                        child: Text(
                          'Don\'t have an account? Sign up',
                          style: TextStyle(fontSize: 16, color: ebonyClay, fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                    const SizedBox(height: 48,),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void login() {
    var isValidate = _formKey.currentState!.validate();
    if (isValidate) {
      authCubit.login(LoginRequest(email: emailController.text, password: passwordController.text));
    }
  }
}
