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
  }

  @override
  Widget build(BuildContext context) {
    String role = (context.read<UserCubit>().state as UserLoaded).user.role!;
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
                    Container(
                      margin:
                          const EdgeInsets.symmetric(horizontal: defaultMargin),
                      height: 45,
                      width: double.infinity,
                      child: GestureDetector(
                        onTap: () async {
                          // setState(() {
                          //   isLoading = true;
                          // });

                          String? paymentURL =
                              widget.userTransaction!.payment_url;

                          if (paymentURL != null) {
                            await launch(paymentURL);
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
                          margin: const EdgeInsets.symmetric(
                              horizontal: defaultMargin),
                          width: MediaQuery.of(context).size.width,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            gradient: const LinearGradient(
                              colors: [Color(0xff610A76), Color(0xffFF0000)],
                              begin: FractionalOffset.topLeft,
                              end: FractionalOffset.bottomRight,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              "Finish Order",
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
                        onTap: () async {
                          // setState(() {
                          //   isLoading = true;
                          // });

                          String? paymentURL =
                              widget.userTransaction!.payment_url;

                          if (paymentURL != null) {
                            await launch(paymentURL);
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
                              "Complain",
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
