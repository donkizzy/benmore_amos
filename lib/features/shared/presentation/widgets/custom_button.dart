import 'package:benmore_amos/utilities/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final ValueNotifier<bool?>? isLoading;
  final Widget? icon;

  const CustomButton({super.key, required this.onTap, required this.title, this.icon, this.isLoading});


  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: isLoading ?? ValueNotifier<bool?>(false),
      builder: (BuildContext context, bool? value, Widget? child) {
        return IgnorePointer(
          ignoring: value ?? false,
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: value != null
                ? () {
                    HapticFeedback.lightImpact();
                    FocusScope.of(context).unfocus();
                    onTap();
                  }
                : null,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 17),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(48),
                color: coralOrange
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (icon != null) ...[
                    icon!,
                    const SizedBox(
                      width: 12,
                    )
                  ],
                  Text(
                    title,
                    style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  value != null && value
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                            backgroundColor: Colors.white,
                          ),
                        )
                      : const SizedBox(
                          height: 0,
                          width: 0,
                        )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
