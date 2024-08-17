import 'dart:async';

import 'package:benmore_amos/core/injector.dart';
import 'package:benmore_amos/core/storage_manager.dart';
import 'package:benmore_amos/features/auth/presentation/pages/login_page.dart';
import 'package:benmore_amos/features/posts/presentation/pages/post_page.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    handleSplash();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Image.asset('assets/logo.png')),
        ],
      ),
    );
  }

  void handleSplash(){
    Timer(const Duration(seconds: 2), () {
      if (mounted) {
        StorageManager storageManager = sl<StorageManager>();
        if(storageManager.getToken() != null && storageManager.getToken() != ''){
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => const PostPage()));
        }else {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => const LoginPage()));
        }
      }
    });
  }
}
