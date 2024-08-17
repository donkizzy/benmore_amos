import 'package:benmore_amos/features/auth/data/bloc/auth_cubit.dart';
import 'package:benmore_amos/features/auth/data/models/register_request.dart';
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

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> with FormMixin,SnackBarMixin{

  final ValueNotifier<bool> _isLoading = ValueNotifier(false);
  AuthCubit authCubit = AuthCubit();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();
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
          if(state is RegisterLoading){
            _isLoading.value = true ;
          }
          if(state is RegisterSuccess){
            _isLoading.value = false ;
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => const PostPage()));
          }
          if(state is RegisterError){
            _isLoading.value = false ;
            showSnackBar(context, state.error);
          }
        },
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SizedBox(
            height: height(context),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                    controller: userNameController,
                    hintText: 'Username',
                    prefixIcon: 'assets/user.svg',
                    validator: isRequired,
                  ),
                  const SizedBox(height: 48,),
                  CustomTextField(
                    controller: emailController,
                    hintText: 'Email',
                    prefixIcon: 'assets/mail.svg',
                    validator: isValidEmailAddress,
                  ),
                  const SizedBox(height: 48,),
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
                  const SizedBox(height: 48,),
                  CustomButton(
                    title: 'Register',
                    isLoading: _isLoading,
                    onTap: () {
                      var isValidate = _formKey.currentState!.validate();
                      if (isValidate) {
                        authCubit.register(RegisterRequest(email: emailController.text, password: passwordController.text,username: userNameController.text));
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
