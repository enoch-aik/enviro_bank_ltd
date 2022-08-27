import 'package:enviro_bank_ltd/export.dart';

class KText extends StatelessWidget {
  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final double? lineHeight;
  final TextAlign? textAlign;
  final TextDecoration? decoration;
  final TextOverflow? overflow;

  const KText(this.text,
      {Key? key,
      this.fontSize,
      this.fontWeight,
      this.color,
      this.lineHeight,
      this.textAlign,
      this.decoration,
      this.overflow})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      overflow: overflow,
      style: GoogleFonts.poppins().copyWith(
          decoration: decoration,
          fontSize: fontSize ?? 16.sp,
          fontWeight: fontWeight ?? FontWeight.w300,
          color: color ?? CustomColors.textColorDefault,
          height: lineHeight),
    );
  }
}
