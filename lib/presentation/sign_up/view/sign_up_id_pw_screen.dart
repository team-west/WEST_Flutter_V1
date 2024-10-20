import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:west/core/component/west_button.dart';
import 'package:west/core/component/west_text_field.dart';
import 'package:west/core/constants/west_style.dart';
import 'package:west/core/layout/west_layout.dart';
import 'package:west/presentation/sign_in/provider/sign_in_text_field_focus_provider.dart';
import 'package:west/presentation/sign_up/widget/sign_up_app_bar.dart';
import 'package:west/presentation/sign_up/widget/sign_up_main_title_widget.dart';
import 'package:west/presentation/sign_up/widget/sign_up_routes_widget.dart';

class SignUpIdPwScreen extends ConsumerStatefulWidget {
  const SignUpIdPwScreen({super.key});

  @override
  ConsumerState<SignUpIdPwScreen> createState() => _SignUpIdPwScreenState();
}

class _SignUpIdPwScreenState extends ConsumerState<SignUpIdPwScreen> {
  late TextEditingController idController;
  late TextEditingController pwdController;

  late FocusNode idFocusNode;
  late FocusNode pwdFocusNode;

  @override
  void initState() {
    super.initState();
    idController = TextEditingController();
    pwdController = TextEditingController();

    idFocusNode = FocusNode()..addListener(chkNode);
    pwdFocusNode = FocusNode()..addListener(chkNode);
  }

  @override
  void dispose() {
    idController.dispose();
    pwdController.dispose();

    idFocusNode.dispose();
    pwdFocusNode.dispose();
    super.dispose();
  }

  void chkNode() {
    ref.read(signInTextFieldFocusProvider.notifier).state =
        idFocusNode.hasFocus || pwdFocusNode.hasFocus ? true : false;
  }

  @override
  Widget build(BuildContext context) {
    return WESTLayout(
      appBar: const SignUpAppBar(count: 3, popRoute: "/signUpGender"),
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
                          "회원가입",
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
      child: Column(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 32),
                  const SignUpMainTitleWidget(),
                  const SizedBox(height: 40),
                  WESTTextField(
                    title: "아이디",
                    controller: idController,
                    focusNode: idFocusNode,
                  ),
                  const SizedBox(height: 20),
                  WESTTextField(
                    title: "비밀번호",
                    controller: pwdController,
                    focusNode: pwdFocusNode,
                    textInputAction: TextInputAction.done,
                    password: true,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
