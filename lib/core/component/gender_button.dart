import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:west/core/constants/west_style.dart';
import 'package:west/core/provider/gender_select_provider.dart';
import 'package:west/core/provider/state/gender_type.dart';

class GenderButton extends ConsumerWidget {
  final String type;
  final GenderType gender;

  const GenderButton({
    super.key,
    required this.type,
    required this.gender,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedGender = ref.watch(genderSelectProvider);
    return Expanded(
      child: GestureDetector(
        onTap: () => ref.read(genderSelectProvider.notifier).state = gender,
        child: Container(
          height: 60,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: gender == selectedGender? WESTColor.main300 : WESTColor.gray300,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            type,
            style: WESTTextStyle.button1(
              color: gender == selectedGender ? WESTColor.black : WESTColor.white,
            ),
          ),
        ),
      ),
    );
  }
}
