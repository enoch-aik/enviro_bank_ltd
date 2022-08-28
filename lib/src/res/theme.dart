import 'package:enviro_bank_ltd/export.dart';
import 'package:enviro_bank_ltd/src/res/primary_swatch.dart';

ThemeData customTheme = ThemeData(
    snackBarTheme: SnackBarThemeData(
        backgroundColor: CustomColors.primaryColorLighterShade, elevation: 5),
    chipTheme: ChipThemeData(selectedColor: CustomColors.appColor),
    tabBarTheme: TabBarTheme(
      labelPadding: EdgeInsets.only(
        bottom: 10.h,
      ),
      indicator: UnderlineTabIndicator(
        borderSide: BorderSide(color: CustomColors.mainYellow, width: 4.h),
        insets: EdgeInsets.symmetric(horizontal: 50.w),
      ),
      labelStyle:
          GoogleFonts.poppins(fontSize: 18.sp, fontWeight: FontWeight.w600),
      unselectedLabelColor: CustomColors.textColor3,
      labelColor: CustomColors.mainYellow,
      overlayColor: MaterialStateProperty.all(Colors.transparent),
    ),
    textTheme: GoogleFonts.poppinsTextTheme(),
    primarySwatch: MaterialColor(0xff002653, customSwatch),
    scaffoldBackgroundColor: CustomColors.white,
    appBarTheme: AppBarTheme(
        backgroundColor: CustomColors.transparent,
        toolbarTextStyle: GoogleFonts.poppins(fontSize: 15.sp),
        titleTextStyle: GoogleFonts.poppins(
            fontSize: 20.sp,
            color: CustomColors.white,
            fontWeight: FontWeight.w600),
        foregroundColor: CustomColors.white,
        elevation: 0,
        centerTitle: true),
    inputDecorationTheme: InputDecorationTheme(
        iconColor: CustomColors.textColorLight2,
        prefixStyle: GoogleFonts.poppins(
            fontSize: 15.sp, color: CustomColors.textColorLight2),
        /*alignLabelWithHint: true,*/
        hintStyle: GoogleFonts.poppins(
            fontSize: 13.sp, color: CustomColors.textColorLight2),
        fillColor: CustomColors.secBackgroundColor,
        filled: true,
        labelStyle: GoogleFonts.poppins(
            fontSize: 13.sp, color: CustomColors.textColorLight2),
        errorStyle:
        GoogleFonts.poppins(fontSize: 11.sp, color: Colors.red),
        helperStyle:
            GoogleFonts.poppins(fontSize: 10.sp, color: CustomColors.textColorDefault),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 0.25, color: CustomColors.disabledText),
          borderRadius: BorderRadius.circular(5.r),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 0.5, color: CustomColors.appColor),
          borderRadius: BorderRadius.circular(5.r),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 1, color: Colors.red),
          borderRadius: BorderRadius.circular(5.r),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
              width: 0.5, color: CustomColors.disabledText.withOpacity(0.5)),
          borderRadius: BorderRadius.circular(5.r),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
              width: 0.5, color: CustomColors.disabledText.withOpacity(0.5)),
          borderRadius: BorderRadius.circular(5.r),
        )),
    backgroundColor: CustomColors.white,
    //iconTheme: IconThemeData(color: CustomColors.appColor),
    textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r))),
            backgroundColor: MaterialStateProperty.all(CustomColors.appColor),
            foregroundColor: MaterialStateProperty.all(CustomColors.white))),
    outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r))),
            foregroundColor: MaterialStateProperty.all(CustomColors.white))),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r))),
            backgroundColor: MaterialStateProperty.all(CustomColors.appColor),
            foregroundColor: MaterialStateProperty.all(CustomColors.white))));
