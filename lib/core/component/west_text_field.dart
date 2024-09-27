import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:west_flutter_v1/core/constants/west_style.dart';

class WESTTextField extends StatefulWidget {
  final String title;
  final TextEditingController controller;
  final FocusNode focusNode;

  final double? width, height;

  final String? hintText;

  final bool? password, autofocus;

  final int? maxLength;

  final TextInputAction? textInputAction;

  final TextInputType? textInputType;

  final TextInputFormatter? textInputFormatter;

  const WESTTextField({
    super.key,
    required this.title,
    required this.controller,
    required this.focusNode,
    this.width,
    this.height,
    this.hintText,
    this.password = false,
    this.autofocus = false,
    this.maxLength,
    this.textInputFormatter,
    this.textInputAction = TextInputAction.next,
    this.textInputType = TextInputType.text,
  });

  @override
  State<WESTTextField> createState() => _WESTTextFieldState();
}

class _WESTTextFieldState extends State<WESTTextField> {
  bool _isClicked = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// 텍스트 필드 타이틀 표시
        Text(
          widget.title,
          style: WESTTextStyle.label1(
            color: WESTColor.white,
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: widget.height ?? 41,
          width: widget.width ?? MediaQuery.of(context).size.width,
          child: TextFormField(
            controller: widget.controller,
            focusNode: widget.focusNode,

            /// 텍스트 input 버튼 설정
            textInputAction: widget.textInputAction,

            /// 페이지가 빌드 되었을 때 텍스트 필드를 포커스 되게 할 것인지
            autofocus: widget.autofocus!,

            /// 입력 포맷팅 설정
            inputFormatters: widget.textInputFormatter != null
                ? [widget.textInputFormatter!]
                : [],

            /// cursor 스타일 설정
            cursorHeight: 16,
            cursorWidth: 1,

            /// 입력 가능한 최대 길이
            maxLength: widget.maxLength,

            /// 비밀번호 obscure 설정
            obscureText: widget.password! && !_isClicked ? true : false,
            //obscuringCharacter: "⦁",

            /// 키보드 입력 타입
            keyboardType: widget.textInputType,

            /// content text 스타일 설정
            style: WESTTextStyle.caption2(
              color: WESTColor.white,
            ),
            decoration: InputDecoration(
              hintText: widget.hintText ?? widget.title,
              hintStyle: WESTTextStyle.caption2(
                color: WESTColor.gray200,
              ),

              /// 텍스트 필드 색상 설정
              filled: true,
              fillColor: WESTColor.gray500,

              /// content padding을 줌으로써 가운데 정렬
              contentPadding: const EdgeInsets.symmetric(horizontal: 12),

              /// Outline 제거
              border: const OutlineInputBorder(
                borderSide: BorderSide.none,
              ),

              /// suffixIcon -> 포커스 되지 않았을 때도 표시
              /// suffix -> 포커스 되었을 때만 표시
              suffixIcon: widget.password!
                  ? GestureDetector(
                      onTap: () {
                        setState(() {
                          _isClicked = !_isClicked;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: SvgPicture.asset(
                          /// 중복 코드 최소화
                          "$iconCoreAsset/eyes${!_isClicked ? "_close" : ""}_icon.svg",
                        ),
                      ),
                    )
                  : null,

              /// 텍스트 필드가 포커스 되었을 때
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  color: WESTColor.main300,
                  width: 2,
                ),
              ),

              /// 텍스트 필드가 포커스 되지 않았을 때
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  color: WESTColor.gray500,
                  width: 2,
                ),
              ),
            ),

            onTap: () {
              /// 텍스트 필드가 포커스 된 상태에서 텍스트 필드를 클릭하면 포커스 해제
              FocusScope.of(context).hasFocus
                  ? FocusScope.of(context).unfocus()
                  : FocusScope.of(context).hasFocus;
            },

            /// 바깥 영역을 클릭 시 포커스 해제
            onTapOutside: (event) {
              FocusScope.of(context).unfocus();
            },
          ),
        ),
      ],
    );
  }
}
