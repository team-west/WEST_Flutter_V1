import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:west_flutter_v1/core/constants/west_style.dart';

class SignUpRoutesWidget extends StatelessWidget {
  const SignUpRoutesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "이미 가입했다면?",
          style: WESTTextStyle.button2(
            color: WESTColor.white,
          ),
        ),
        const SizedBox(width: 4),
        GestureDetector(
          onTap: () {
            context.go("/signIn");
          },
          child: Text(
            "로그인하기",
            style: WESTTextStyle.button2(
              color: WESTColor.main200,
            ),
          ),
        ),
      ],
    );
  }
}
