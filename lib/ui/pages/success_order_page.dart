part of 'pages.dart';

class SuccessOrderPage extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final String? buttonTitle1;
  final String? buttonTitle2;
  const SuccessOrderPage(
      {Key? key,
      this.title,
      this.subtitle,
      this.buttonTitle1,
      this.buttonTitle2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkColor,
      body: IllustrationPage(
        title: title ?? "You've Made Order",
        subtitle: subtitle ??
            "Just stay at home while we are\npreparing your best video",
        picturePath: 'assets/bike.png',
        buttonTitle1: buttonTitle1 ?? 'Order Other Talents',
        buttonTap1: () {
          Get.offAll(() => const MainPage());
        },
        buttonTitle2: buttonTitle2 ?? 'View My Order',
        buttonTap2: () {
          Get.offAll(() => const MainPage(
                initialPage: 1,
              ));
        },
      ),
    );
  }
}
