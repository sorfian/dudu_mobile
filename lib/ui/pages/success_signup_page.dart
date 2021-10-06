part of 'pages.dart';

class SuccessSignUpPage extends StatelessWidget {
  const SuccessSignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkColor,
      body: IllustrationPage(
        title: "Yeay! Completed",
        subtitle:
            "We are processing your requested account.\nPlease wait in 2 x 24.",
        picturePath: 'assets/food_wishes.png',
        buttonTitle1: 'Home',
        buttonTap1: () {
          Get.offAll(() => const SplashPage());
        },
      ),
    );
  }
}
