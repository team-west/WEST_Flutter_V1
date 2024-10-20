import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:west/core/component/west_button.dart';
import 'package:west/core/component/west_text_field.dart';
import 'package:west/core/constants/west_style.dart';
import 'package:west/core/layout/west_layout.dart';
import 'package:west/core/utils/number_formatter.dart';
import 'package:west/presentation/sign_in/provider/sign_in_text_field_focus_provider.dart';
import 'package:west/presentation/sign_up/widget/sign_up_app_bar.dart';
import 'package:west/presentation/sign_up/widget/sign_up_main_title_widget.dart';
import 'package:west/presentation/sign_up/widget/sign_up_routes_widget.dart';

class SignUpUserInfoScreen extends ConsumerStatefulWidget {
  const SignUpUserInfoScreen({super.key});

  @override
  ConsumerState<SignUpUserInfoScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpUserInfoScreen> {
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
    return WESTLayout(
      appBar: const SignUpAppBar(count: 1, popRoute: "/signIn",),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(bottom: focusState ? 0 : 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SignUpRoutesWidget(),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  context.push("/signUpGender");
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
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 32),
              const SignUpMainTitleWidget(),
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
                textInputType: TextInputType.phone,
                textInputAction: TextInputAction.done,
                textInputFormatter: NumberFormatter(),
              ),
              SizedBox(height: MediaQuery.of(context).viewInsets.bottom),
            ],
          ),
        ),
      ),
    );
  }
}
