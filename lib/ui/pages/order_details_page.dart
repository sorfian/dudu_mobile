part of 'pages.dart';

class OrderDetailsPage extends StatefulWidget {
  final UserTransaction? userTransaction;
  const OrderDetailsPage({Key? key, this.userTransaction}) : super(key: key);

  @override
  _OrderDetailsPageState createState() => _OrderDetailsPageState();
}

class _OrderDetailsPageState extends State<OrderDetailsPage> {
  VideoPlayerController? _controller;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    if (widget.userTransaction!.videoPath != null) {
      _controller = VideoPlayerController.network(
          "https://staging.dudu.co.id/storage/" +
              widget.userTransaction!.videoPath!)
        ..initialize().then((_) {
          setState(() {});
        });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GeneralPage(
      title: 'Order History',
      subtitle: 'Your order details',
      onBackButtonPressed: () {
        Get.back();
      },
      backColor: darkColor,
      child: Column(
        children: [
          //// Bagian atas
          Container(
            margin: const EdgeInsets.only(bottom: defaultMargin),
            padding: const EdgeInsets.symmetric(
                horizontal: defaultMargin, vertical: 16),
            color: darkColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Item Ordered',
                  style: whiteFontStyl3,
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 60,
                          height: 60,
                          margin: const EdgeInsets.only(right: 12),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              image: DecorationImage(
                                  image: NetworkImage(widget.userTransaction!
                                      .talent_id!.picture_path!),
                                  fit: BoxFit.cover)),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width - 198,
                              // 2 * defaultMargin (jarak border) +
                              // 60 (lebar picture) +
                              // 12 (jarak picture ke title)+
                              // 78 (lebar jumlah items),
                              child: Text(
                                widget.userTransaction!.talent_id!.name!,
                                style: whiteFontStyle2,
                                maxLines: 1,
                                overflow: TextOverflow.clip,
                              ),
                            ),
                            Text(
                              NumberFormat.currency(
                                      locale: 'id-ID',
                                      symbol: 'IDR ',
                                      decimalDigits: 0)
                                  .format(widget.userTransaction!.total!),
                              style: greyFontStyle.copyWith(fontSize: 13),
                            )
                          ],
                        )
                      ],
                    ),
                    Text(
                      '1 item(s)',
                      style: greyFontStyle.copyWith(fontSize: 13),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16, bottom: 8),
                  child: Text(
                    'Details Transaction:',
                    style: whiteFontStyl3,
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                        width: MediaQuery.of(context).size.width / 2 -
                            defaultMargin -
                            5,
                        child: Text(
                          widget.userTransaction!.talent_id!.name!,
                          style: greyFontStyle,
                        )),
                    SizedBox(
                        width: MediaQuery.of(context).size.width / 2 -
                            defaultMargin -
                            5,
                        child: Text(
                          NumberFormat.currency(
                                  locale: 'id-ID',
                                  symbol: 'IDR ',
                                  decimalDigits: 0)
                              .format(widget.userTransaction!.talent_id!.price),
                          style: whiteFontStyl3,
                          textAlign: TextAlign.right,
                        ))
                  ],
                ),
                const SizedBox(
                  height: 6,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                        width: MediaQuery.of(context).size.width / 2 -
                            defaultMargin -
                            5,
                        child: Text(
                          'Fee',
                          style: greyFontStyle,
                        )),
                    SizedBox(
                        width: MediaQuery.of(context).size.width / 2 -
                            defaultMargin -
                            5,
                        child: Text(
                          NumberFormat.currency(
                                  locale: 'id-ID',
                                  symbol: 'IDR ',
                                  decimalDigits: 0)
                              .format(50000),
                          style: whiteFontStyl3,
                          textAlign: TextAlign.right,
                        ))
                  ],
                ),
                const SizedBox(
                  height: 6,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                        width: MediaQuery.of(context).size.width / 2 -
                            defaultMargin -
                            5,
                        child: Text(
                          'Tax 10%',
                          style: greyFontStyle,
                        )),
                    SizedBox(
                        width: MediaQuery.of(context).size.width / 2 -
                            defaultMargin -
                            5,
                        child: Text(
                          NumberFormat.currency(
                                  locale: 'id-ID',
                                  symbol: 'IDR ',
                                  decimalDigits: 0)
                              .format(
                                  widget.userTransaction!.talent_id!.price! *
                                      0.1),
                          style: whiteFontStyl3,
                          textAlign: TextAlign.right,
                        ))
                  ],
                ),
                const SizedBox(
                  height: 6,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                        width: MediaQuery.of(context).size.width / 2 -
                            defaultMargin -
                            5,
                        child: Text(
                          'Total',
                          style: greyFontStyle,
                        )),
                    SizedBox(
                        width: MediaQuery.of(context).size.width / 2 -
                            defaultMargin -
                            5,
                        child: Text(
                          NumberFormat.currency(
                                  locale: 'id-ID',
                                  symbol: 'IDR ',
                                  decimalDigits: 0)
                              .format(widget.userTransaction!.total!),
                          style: whiteFontStyl3.copyWith(
                              fontWeight: FontWeight.w500,
                              color: '1ABC9C'.toColor()),
                          textAlign: TextAlign.right,
                        ))
                  ],
                ),
              ],
            ),
          ),
          //// Order Status
          Container(
            margin: const EdgeInsets.only(bottom: defaultMargin),
            padding: const EdgeInsets.symmetric(
                horizontal: defaultMargin, vertical: 16),
            color: darkColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Order Status:',
                  style: whiteFontStyl3,
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                        width: 80,
                        child: Text(
                          widget.userTransaction!.externalId ?? "invoice_000",
                          style: greyFontStyle,
                        )),
                    SizedBox(
                        width: MediaQuery.of(context).size.width -
                            2 * defaultMargin -
                            80,
                        child: Text(
                          (widget.userTransaction!.status! ==
                                  UserTransactionStatus.pending)
                              ? "UNPAID"
                              : (widget.userTransaction!.status! ==
                                      UserTransactionStatus.success)
                                  ? "PAID"
                                  : "FAILED",
                          style: whiteFontStyl3,
                          textAlign: TextAlign.right,
                        ))
                  ],
                ),
                const SizedBox(
                  height: 6,
                ),
              ],
            ),
          ),
          //// Bagian bawah
          Container(
            margin: const EdgeInsets.only(bottom: defaultMargin),
            padding: const EdgeInsets.symmetric(
                horizontal: defaultMargin, vertical: 16),
            color: darkColor,
            child: (widget.userTransaction!.videoPath != null)
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Video Attached:',
                        style: whiteFontStyl3,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      _controller!.value.isInitialized
                          ? AspectRatio(
                              aspectRatio: _controller!.value.aspectRatio,
                              child: VideoPlayer(_controller!),
                            )
                          : Center(
                              child: loadingIndicator,
                            ),
                      const SizedBox(
                        height: 8,
                      ),
                      _controller!.value.isInitialized
                          ? Center(
                              child: FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    _controller!.value.isPlaying
                                        ? _controller!.pause()
                                        : _controller!.play();
                                  });
                                },
                                child: Icon(
                                  _controller!.value.isPlaying
                                      ? Icons.pause
                                      : Icons.play_arrow,
                                ),
                              ),
                            )
                          : const SizedBox(),
                      const SizedBox(
                        height: 6,
                      ),
                    ],
                  )
                : const SizedBox(),
          ),

          //// Checkout Button
          (isLoading)
              ? Center(
                  child: loadingIndicator,
                )
              : Container(
                  margin: const EdgeInsets.symmetric(horizontal: defaultMargin),
                  height: 45,
                  width: double.infinity,
                  child: GestureDetector(
                    onTap: () async {
                      // setState(() {
                      //   isLoading = true;
                      // });

                      String? paymentURL = widget.userTransaction!.payment_url;

                      if (paymentURL != null) {
                        if (widget.userTransaction!.status ==
                            UserTransactionStatus.pending) {
                          await launch(paymentURL);
                        } else if (widget.userTransaction!.status ==
                            UserTransactionStatus.success) {
                          Get.to(() => const TalentVideoPage());
                        }
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
                            style: GoogleFonts.poppins(color: Colors.white),
                          ),
                        );
                      }
                    },
                    child: Container(
                      margin:
                          const EdgeInsets.symmetric(horizontal: defaultMargin),
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: orangeColor,
                      ),
                      child: Center(
                        child: Text(
                          (widget.userTransaction!.status! ==
                                  UserTransactionStatus.pending)
                              ? "Checkout Now"
                              : (widget.userTransaction!.status! ==
                                      UserTransactionStatus.success)
                                  ? "See Video"
                                  : "Ouch!",
                          style: whiteFontStyl3.copyWith(
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
          const SizedBox(
            height: 60,
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    if (widget.userTransaction!.videoPath != null) {
      _controller!.dispose();
    }
  }
}
