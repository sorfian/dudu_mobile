part of 'pages.dart';

class SuccessOrderPage extends StatelessWidget {
  const SuccessOrderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkColor,
      body: IllustrationPage(
        title: "You've Made Order",
        subtitle: "Just stay at home while we are\npreparing your best video",
        picturePath: 'assets/bike.png',
        buttonTitle1: 'Order Other Talents',
        buttonTap1: () {
          Get.offAll(() => const MainPage());
        },
        buttonTitle2: 'View My Order',
        buttonTap2: () {
          Get.offAll(MainPage(
            initialPage: 1,
          ));
        },
      ),
    );
  }
}
