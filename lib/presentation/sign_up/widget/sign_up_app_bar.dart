import 'package:flutter/material.dart';
import 'package:west_flutter_v1/core/constants/west_style.dart';

class SignUpAppBar extends StatelessWidget implements PreferredSizeWidget {
  final int count;

  const SignUpAppBar({
    super.key,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: PreferredSize(
        preferredSize: preferredSize,
        child: AppBar(
          automaticallyImplyLeading: false,
          scrolledUnderElevation: 0,
          backgroundColor: WESTColor.background,
          title: Align(
            alignment: Alignment.centerRight,
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "$count",
                    style: WESTTextStyle.subTitle2(
                      color: WESTColor.main500,
                    ),
                  ),
                  TextSpan(
                    text: "/3",
                    style: WESTTextStyle.subTitle2(
                      color: WESTColor.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(48);
}
