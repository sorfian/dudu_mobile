part of 'pages.dart';

class PaymentMethodPage extends StatelessWidget {
  final String? paymentURL;
  const PaymentMethodPage({Key? key, this.paymentURL}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: darkColor,
        body: IllustrationPage(
          title: "Finish Your Payment",
          subtitle: "Please select your favourite\npayment method",
          picturePath: 'assets/Payment.png',
          buttonTap1: () async {
            await launch(paymentURL!);
          },
          buttonTitle1: 'Payment Method',
          buttonTap2: () {
            Get.to(() => const SuccessOrderPage());
          },
          buttonTitle2: 'Continue',
        ));
  }
}
