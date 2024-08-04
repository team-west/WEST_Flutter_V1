import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:west_flutter_v1/core/component/west_button.dart';
import 'package:west_flutter_v1/core/component/west_text_field.dart';
import 'package:west_flutter_v1/core/constants/west_style.dart';
import 'package:west_flutter_v1/presentation/sign_in/provider/sign_in_text_field_focus_provider.dart';

class SignInScreen extends ConsumerStatefulWidget {
  const SignInScreen({super.key});

  @override
  ConsumerState<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends ConsumerState<SignInScreen> {
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
    final focusState = ref.watch(signInTextFieldFocusProvider);
    return Scaffold(
      backgroundColor: WESTColor.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 80),
                Text(
                  "로그인하고\nWEST를 사용해보세요!",
                  style: WESTTextStyle.heading3(
                    color: WESTColor.white,
                  ),
                ),
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
                  password: true,
                ),
                SizedBox(height: MediaQuery.of(context).viewInsets.bottom),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(bottom: focusState ? 0 : 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "아직 가입하지 않았다면?",
                    style: WESTTextStyle.button2(
                      color: WESTColor.white,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    "회원가입하기",
                    style: WESTTextStyle.button2(
                      color: WESTColor.main200,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: WESTButton(
                  backgroundColor: WESTColor.gray300,
                  content: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "로그인",
                        style: WESTTextStyle.button1(
                          color: WESTColor.white,
                        ),
                      ),
                      const SizedBox(width: 4),
                      SvgPicture.asset(
                        "$coreAsset/long_ended_arrow_icon.svg",
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
