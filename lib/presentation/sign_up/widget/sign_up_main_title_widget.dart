import 'package:flutter/material.dart';
import 'package:west/core/constants/west_style.dart';

class SignUpMainTitleWidget extends StatelessWidget {
  const SignUpMainTitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "회원가입하고\nWEST를 사용해보세요!",
      style: WESTTextStyle.heading3(
        color: WESTColor.white,
      ),
    );
  }
}
