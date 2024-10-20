import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:west/core/constants/west_style.dart';

class SignUpAppBar extends StatelessWidget implements PreferredSizeWidget {
  /// 페이지 번호
  final int count;

  /// 뒤로가기 라우터를 적용할 페이지
  final String popRoute;

  const SignUpAppBar({
    super.key,
    required this.count,
    required this.popRoute,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: PreferredSize(
        preferredSize: preferredSize,
        child: AppBar(
          /// 자동으로 Leading Widget이 생성되지 않도록 설정
          automaticallyImplyLeading: false,

          /// 스크롤 할 시 아래의 Elevation 설정
          scrolledUnderElevation: 0,
          backgroundColor: WESTColor.background,

          /// title 위젯의 기본 간격 해제
          titleSpacing: 0,
          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    context.pop(popRoute);
                  },
                  child: SvgPicture.asset("$iconCoreAsset/left_arrow_icon.svg"),
                ),
                Align(
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
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(48);
}
