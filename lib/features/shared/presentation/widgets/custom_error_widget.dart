import 'package:benmore_amos/features/shared/presentation/widgets/custom_button.dart';
import 'package:benmore_amos/utilities/utilities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomErrorWidget extends StatelessWidget {
  final String error ;
  final VoidCallback onTap ;
  const CustomErrorWidget({super.key, required this.error, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        children: [
          SizedBox(
            height: height(context) / 4,
          ),
          SvgPicture.asset(
            'assets/caution.svg',
            height: 100,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(error,style: const TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.w500),textAlign: TextAlign.center,),
          const SizedBox(
            height: 30,
          ),
          CustomButton(
            onTap: onTap,
            title: 'Retry',

          ),
        ],
      ),
    );
  }
}
