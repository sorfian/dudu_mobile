part of 'shared.dart';

Color greyColor = "8D92A3".toColor();
Color mainColor = "FFC700".toColor();
Color purpleColor = "610A76".toColor();
Color orangeColor = "FF9600".toColor();
Color darkColor = "#10151f".toColor();

Widget loadingIndicator = SpinKitFadingCircle(
  size: 45,
  color: mainColor,
);

TextStyle greyFontStyle = GoogleFonts.poppins().copyWith(color: greyColor);
TextStyle purpleFontStyle = GoogleFonts.poppins().copyWith(color: purpleColor);
TextStyle orangeFontStyle = GoogleFonts.poppins().copyWith(color: orangeColor);
TextStyle whiteFontStyle = GoogleFonts.poppins()
    .copyWith(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w500);
TextStyle whiteFontStyle2 = GoogleFonts.poppins()
    .copyWith(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500);
TextStyle whiteFontStyl3 = GoogleFonts.poppins().copyWith(color: Colors.white);

const double defaultMargin = 24;
