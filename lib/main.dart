import 'package:benmore_amos/core/injector.dart' as di;
import 'package:benmore_amos/features/shared/presentation/pages/splash_screen.dart';
import 'package:benmore_amos/utilities/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BenMore Social',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: coralOrange),
        useMaterial3: true,
        textTheme: GoogleFonts.poppinsTextTheme()
      ),
      home: const SplashScreen(),
    );
  }
}

