import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:west_flutter_v1/core/component/gender_button.dart';
import 'package:west_flutter_v1/core/component/west_button.dart';
import 'package:west_flutter_v1/core/constants/west_style.dart';
import 'package:west_flutter_v1/core/layout/west_layout.dart';
import 'package:west_flutter_v1/core/provider/state/gender_type.dart';
import 'package:west_flutter_v1/presentation/sign_up/widget/sign_up_app_bar.dart';
import 'package:west_flutter_v1/presentation/sign_up/widget/sign_up_main_title_widget.dart';
import 'package:west_flutter_v1/presentation/sign_up/widget/sign_up_routes_widget.dart';

class SignUpGenderScreen extends ConsumerWidget {
  const SignUpGenderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return WESTLayout(
      appBar: const SignUpAppBar(
        count: 2,
        popRoute: "/signUpUserInfo",
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SignUpRoutesWidget(),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  context.push("/signUpIdPw");
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: WESTButton(
                    backgroundColor: WESTColor.gray300,
                    content: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "다음",
                          style: WESTTextStyle.button1(
                            color: WESTColor.white,
                          ),
                        ),
                        const SizedBox(width: 4),
                        SvgPicture.asset(
                          "$iconCoreAsset/long_ended_arrow_icon.svg",
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 32),
            const SignUpMainTitleWidget(),
            const SizedBox(height: 40),
            Text(
              "성별",
              style: WESTTextStyle.label1(
                color: WESTColor.white,
              ),
            ),
            const SizedBox(height: 12),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GenderButton(
                  type: "남자",
                  gender: GenderType.male,
                ),
                SizedBox(width: 22),
                GenderButton(
                  type: "여자",
                  gender: GenderType.female,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
