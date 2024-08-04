import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:west_flutter_v1/core/component/west_button.dart';
import 'package:west_flutter_v1/core/component/west_text_field.dart';
import 'package:west_flutter_v1/core/constants/west_style.dart';
import 'package:west_flutter_v1/presentation/sign_in/provider/sign_in_text_field_focus_provider.dart';
import 'package:west_flutter_v1/presentation/sign_up/widget/sign_up_app_bar.dart';

class SignUpScreen extends ConsumerStatefulWidget {
  const SignUpScreen({super.key});

  @override
  ConsumerState<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {
  late TextEditingController nameController;
  late TextEditingController phoneController;

  late FocusNode nameFocusNode;
  late FocusNode phoneFocusNode;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    phoneController = TextEditingController();

    nameFocusNode = FocusNode()..addListener(chkNode);
    phoneFocusNode = FocusNode()..addListener(chkNode);
  }

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();

    nameFocusNode.dispose();
    phoneFocusNode.dispose();
    super.dispose();
  }

  void chkNode() {
    ref.read(signInTextFieldFocusProvider.notifier).state =
    nameFocusNode.hasFocus || phoneFocusNode.hasFocus ? true : false;
  }

  @override
  Widget build(BuildContext context) {
    final focusState = ref.watch(signInTextFieldFocusProvider);
    return Scaffold(
      backgroundColor: WESTColor.background,
      appBar: const SignUpAppBar(count: 1),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 32),
                Text(
                  "회원가입하고\nWEST를 사용해보세요!",
                  style: WESTTextStyle.heading3(
                    color: WESTColor.white,
                  ),
                ),
                const SizedBox(height: 40),
                WESTTextField(
                  title: "이름",
                  controller: nameController,
                  focusNode: nameFocusNode,
                ),
                const SizedBox(height: 20),
                WESTTextField(
                  title: "전화번호",
                  controller: phoneController,
                  focusNode: phoneFocusNode,
                  textInputAction: TextInputAction.done,
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
                    "이미 가입했다면?",
                    style: WESTTextStyle.button2(
                      color: WESTColor.white,
                    ),
                  ),
                  const SizedBox(width: 4),
                  GestureDetector(
                    onTap: () {
                      context.pop("/");
                    },
                    child: Text(
                      "로그인하기",
                      style: WESTTextStyle.button2(
                        color: WESTColor.main200,
                      ),
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
                        "다음",
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
