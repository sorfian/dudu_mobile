part of 'pages.dart';

class TalentVideoPage extends StatefulWidget {
  final UserTransaction? userTransaction;
  const TalentVideoPage({Key? key, this.userTransaction}) : super(key: key);

  @override
  _TalentVideoPageState createState() => _TalentVideoPageState();
}

class _TalentVideoPageState extends State<TalentVideoPage> {
  VideoPlayerController? _controller;
  bool isLoading = false;
  bool isLoadingComplain = false;
  UserTransactionStatus? status;

  @override
  void initState() {
    super.initState();
    if (widget.userTransaction!.videoPathTalent != null) {
      _controller = VideoPlayerController.network(
          "https://staging.dudu.co.id/storage/" +
              widget.userTransaction!.videoPathTalent!)
        ..initialize().then((_) {
          setState(() {});
        });
    }
    status = widget.userTransaction!.status;
  }

  @override
  Widget build(BuildContext context) {
    String role = (context.read<UserCubit>().state as UserLoaded).user.role!;
    var userStatus = widget.userTransaction!.status;
    print(userStatus);
    return GeneralPage(
      title: 'Talent Video',
      subtitle: 'Video already delivered',
      onBackButtonPressed: () {
        Get.back();
      },
      backColor: darkColor,
      child: Column(
        children: [
          //// Bagian bawah
          Container(
            margin: const EdgeInsets.only(bottom: defaultMargin),
            padding: const EdgeInsets.symmetric(
                horizontal: defaultMargin, vertical: 16),
            color: darkColor,
            child: (widget.userTransaction!.videoPathTalent != null)
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
          (role == "TALENT")
              ? const SizedBox()
              : Column(
                  children: [
                    (isLoading)
                        ? Center(
                            child: loadingIndicator,
                          )
                        : Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: defaultMargin),
                            height: 45,
                            width: double.infinity,
                            child: GestureDetector(
                              onTap: (status == UserTransactionStatus.success)
                                  ? () {}
                                  : () async {
                                      setState(() {
                                        isLoading = true;
                                      });

                                      UserTransactionStatus? statusSuccess =
                                          await context
                                              .read<UserTransactionsCubit>()
                                              .updateTransaction(
                                                widget.userTransaction!,
                                              );

                                      if (statusSuccess ==
                                          UserTransactionStatus.success) {
                                        Get.snackbar(
                                          "",
                                          "",
                                          backgroundColor: "11698E".toColor(),
                                          icon: const Icon(
                                              MdiIcons.closeCircleOutline,
                                              color: Colors.white),
                                          titleText: Text(
                                            'Transaction Finished',
                                            style: GoogleFonts.poppins(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          messageText: Text(
                                            'Thank you! Your order is completed.',
                                            style: GoogleFonts.poppins(
                                                color: Colors.white),
                                          ),
                                        );

                                        setState(() {
                                          isLoading = false;
                                          status = statusSuccess;
                                        });
                                      } else {
                                        setState(() {
                                          isLoading = false;
                                        });

                                        Get.snackbar(
                                          "",
                                          "",
                                          backgroundColor: "D9435E".toColor(),
                                          icon: const Icon(
                                              MdiIcons.closeCircleOutline,
                                              color: Colors.white),
                                          titleText: Text(
                                            'Transaction Failed',
                                            style: GoogleFonts.poppins(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          messageText: Text(
                                            'Please try again later.',
                                            style: GoogleFonts.poppins(
                                                color: Colors.white),
                                          ),
                                        );
                                      }
                                    },
                              child: Container(
                                margin: const EdgeInsets.symmetric(
                                    horizontal: defaultMargin),
                                width: MediaQuery.of(context).size.width,
                                height: 50,
                                decoration: (status ==
                                        UserTransactionStatus.success)
                                    ? BoxDecoration(
                                        borderRadius: BorderRadius.circular(25),
                                        color: greyColor,
                                      )
                                    : BoxDecoration(
                                        borderRadius: BorderRadius.circular(25),
                                        gradient: const LinearGradient(
                                          colors: [
                                            Color(0xff610A76),
                                            Color(0xffFF0000)
                                          ],
                                          begin: FractionalOffset.topLeft,
                                          end: FractionalOffset.bottomRight,
                                        ),
                                      ),
                                child: Center(
                                  child: Text(
                                    (status == UserTransactionStatus.success)
                                        ? "Finished"
                                        : "Finish Order",
                                    style: whiteFontStyl3.copyWith(
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: defaultMargin, vertical: defaultMargin),
                      height: 45,
                      width: double.infinity,
                      child: GestureDetector(
                        onTap: (status == UserTransactionStatus.success)
                            ? () {}
                            : () async {
                                setState(() {
                                  isLoadingComplain = true;
                                });

                                String? paymentURL =
                                    widget.userTransaction!.payment_url;

                                if (paymentURL != null) {
                                  await launch(paymentURL);
                                } else {
                                  setState(() {
                                    isLoadingComplain = false;
                                  });

                                  Get.snackbar(
                                    "",
                                    "",
                                    backgroundColor: "D9435E".toColor(),
                                    icon: const Icon(
                                        MdiIcons.closeCircleOutline,
                                        color: Colors.white),
                                    titleText: Text(
                                      'Transaction Failed',
                                      style: GoogleFonts.poppins(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    messageText: Text(
                                      'Please try again later.',
                                      style: GoogleFonts.poppins(
                                          color: Colors.white),
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
                            color: (status == UserTransactionStatus.success)
                                ? greyColor
                                : orangeColor,
                          ),
                          child: Center(
                            child: Text(
                              (status == UserTransactionStatus.success)
                                  ? "No Complain"
                                  : "Complain",
                              style: whiteFontStyl3.copyWith(
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
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
    if (widget.userTransaction!.videoPathTalent != null) {
      _controller!.dispose();
    }
  }
}
