part of 'pages.dart';

class PaymentPage extends StatefulWidget {
  final Function? onBackButtonPressed;
  final UserTransaction? userTransaction;
  final String? moment;
  final String? occasion;
  final String? instruction;
  final File? videoFile;

  const PaymentPage(
      {Key? key,
      this.userTransaction,
      this.onBackButtonPressed,
      this.occasion,
      this.moment,
      this.instruction,
      this.videoFile})
      : super(key: key);

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    print(widget.videoFile);
    return GeneralPage(
      title: 'Payment Details',
      onBackButtonPressed: () {
        Get.back();
      },
      child: SafeArea(
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              margin: const EdgeInsets.only(top: 60),
              padding: const EdgeInsets.symmetric(vertical: 26, horizontal: 16),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: defaultMargin),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xff610A76), Color(0xffBB1556)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  // stops: [0.1, 0.9],
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: NetworkImage(
                              widget.userTransaction!.talent_id!.picture_path!),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 15),
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: NetworkImage(widget
                                  .userTransaction!.user!.profile_photo_path ??
                              "http://bavetboyolali.disnakkeswan.jatengprov.go.id/assets/front_end/img/no-image.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Container(
                      child: Text(
                          widget.userTransaction!.talent_id!.user!.name! +
                              " and " +
                              widget.userTransaction!.user!.name!,
                          style: whiteFontStyl3))
                ],
              ),
            ),
            Column(
              children: [
                const SizedBox(
                  height: 110,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: defaultMargin),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SelectableBox(
                        widget.moment,
                        occasionDetail: true,
                        width: 70,
                        height: 70,
                      ),
                      Container(
                        width:
                            MediaQuery.of(context).size.width - (48 + 70 + 70),
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          widget.occasion!,
                          style: whiteFontStyl3,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(() => SelectOccasionPage(
                                userTransaction: widget.userTransaction,
                                onBackButtonPressed: () {
                                  Get.to(() => const SelectOccasionPage());
                                },
                              ));
                        },
                        child: Container(
                          width: 60,
                          height: 35,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            border: Border.all(color: Colors.purple, width: 2),
                            color: Colors.transparent,
                          ),
                          child: Center(
                            child: Text(
                              "Edit",
                              style: whiteFontStyle2.copyWith(
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: defaultMargin, vertical: defaultMargin),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Instruction", style: whiteFontStyle),
                        Row(
                          children: [
                            Container(
                              height: 20,
                              width: 20,
                              margin: const EdgeInsets.symmetric(
                                  vertical: defaultMargin),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.transparent,
                                border: Border.all(
                                    color: Color(0xffBB1556), width: 5),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width -
                                  (48 + 20 + 48),
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Text(
                                widget.instruction!,
                                style: whiteFontStyl3,
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 24,
                        ),
                        Text("Delivery Info", style: whiteFontStyle),
                        Row(
                          children: [
                            Container(
                              height: 20,
                              width: 20,
                              margin: const EdgeInsets.symmetric(
                                  vertical: defaultMargin),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.transparent,
                                border: Border.all(
                                    color: Color(0xffBB1556), width: 5),
                              ),
                            ),
                            Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                    NumberFormat.currency(
                                            locale: 'id-ID',
                                            symbol: 'Rp. ',
                                            decimalDigits: 0)
                                        .format(widget.userTransaction!
                                            .talent_id!.price!),
                                    style: whiteFontStyle2))
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                (isLoading)
                    ? Center(
                        child: loadingIndicator,
                      )
                    : Align(
                        alignment: Alignment.bottomCenter,
                        child: GestureDetector(
                          onTap: () async {
                            setState(() {
                              isLoading = true;
                            });

                            String? paymentURL = await context
                                .read<UserTransactionsCubit>()
                                .submitTransaction(
                                    widget.userTransaction!.copyWith(
                                  date: DateTime.now(),
                                  total:
                                      widget.userTransaction!.talent_id!.price,
                                  name: widget.userTransaction!.user!.name,
                                  moment: widget.moment,
                                  occasion: widget.occasion,
                                  instruction: widget.instruction,
                                ));

                            if (paymentURL != null) {
                              Get.to(() =>
                                  PaymentMethodPage(paymentURL: paymentURL));
                            } else {
                              setState(() {
                                isLoading = false;
                              });

                              Get.snackbar(
                                "",
                                "",
                                backgroundColor: "D9435E".toColor(),
                                icon: const Icon(MdiIcons.closeCircleOutline,
                                    color: Colors.white),
                                titleText: Text(
                                  'Transaction Failed',
                                  style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600),
                                ),
                                messageText: Text(
                                  'Please try again later.',
                                  style:
                                      GoogleFonts.poppins(color: Colors.white),
                                ),
                              );
                            }
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: defaultMargin),
                            width: MediaQuery.of(context).size.width,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: orangeColor,
                            ),
                            child: Center(
                              child: Text(
                                "Request now " +
                                    NumberFormat.currency(
                                            locale: 'id-ID',
                                            symbol: 'Rp. ',
                                            decimalDigits: 0)
                                        .format(widget
                                            .userTransaction!.talent_id!.price),
                                style: whiteFontStyle2.copyWith(
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
