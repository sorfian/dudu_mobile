part of 'pages.dart';

class TalentUploadVideo extends StatefulWidget {
  final UserTransaction? userTransaction;
  const TalentUploadVideo({Key? key, this.userTransaction}) : super(key: key);

  @override
  _TalentUploadVideoState createState() => _TalentUploadVideoState();
}

class _TalentUploadVideoState extends State<TalentUploadVideo> {
  File? videoThumbnail;
  File? videoFile;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return GeneralPage(
      title: 'Video Upload',
      onBackButtonPressed: () {
        Get.back();
      },
      child: SafeArea(
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: double.infinity,
              margin: const EdgeInsets.only(top: 60),
              padding: const EdgeInsets.symmetric(vertical: 26, horizontal: 16),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                gradient: LinearGradient(
                  colors: [Color(0xff610A76), Color(0xffFF0000)],
                  begin: FractionalOffset.topLeft,
                  end: FractionalOffset.bottomRight,
                ),
              ),
            ),
            Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                Stack(
                  children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(
                          defaultMargin, 50, defaultMargin, 0),
                      padding: const EdgeInsets.all(10),
                      width: double.infinity,
                      height: 100,
                      // decoration: BoxDecoration(
                      //     borderRadius: BorderRadius.circular(10),
                      //     border: Border.all(color: Colors.black)),
                      child: DottedBorder(
                        color: Colors.white,
                        dashPattern: const [10, 10],
                        strokeWidth: 3,
                        borderType: BorderType.RRect,
                        radius: const Radius.circular(10),
                        padding: const EdgeInsets.all(6),
                        child: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          child: (videoThumbnail != null)
                              ? Container(
                                  margin: const EdgeInsets.all(10),
                                  width:
                                      MediaQuery.of(context).size.width * 0.2,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                        image: FileImage(videoThumbnail!),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ))
                              : Container(
                                  margin: const EdgeInsets.all(10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Attach a Video",
                                        style: whiteFontStyle2.copyWith(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text("Send your video to payer",
                                          style: whiteFontStyl3),
                                    ],
                                  ),
                                ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () async {
                        XFile? pickedFile = await ImagePicker()
                            .pickVideo(source: ImageSource.gallery);

                        if (pickedFile != null) {
                          videoFile = File(pickedFile.path);
                          final fileName = await VideoThumbnail.thumbnailFile(
                            video: pickedFile.path,
                            imageFormat: ImageFormat.JPEG,
                            thumbnailPath: (await getTemporaryDirectory()).path,
                            maxWidth:
                                128, // specify the width of the thumbnail, let the height auto-scaled to keep the source aspect ratio
                            quality: 25,
                          );
                          videoThumbnail = File(fileName!);
                          // print(videoFile);
                          // print(video);

                          setState(() {});
                        }
                      },
                      child: Container(
                        margin: const EdgeInsets.fromLTRB(
                            defaultMargin, 50, defaultMargin, 50),
                        child: Align(
                          alignment: Alignment.topRight,
                          child: Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: "#CF2968".toColor(),
                            ),
                            child: const Icon(
                              MdiIcons.plus,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(
                      defaultMargin, 20, defaultMargin + 6, 20),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: GestureDetector(
                      onTap: () async {
                        setState(() {
                          isLoading = true;
                        });

                        String? videoURL = await context
                            .read<UserTransactionsCubit>()
                            .uploadTalentVideo(
                                widget.userTransaction!.copyWith(
                                  date: DateTime.now(),
                                ),
                                videoFile: videoFile,
                                videoThumbnail: videoThumbnail);
                        if (videoURL != null) {
                          Get.to(() => const SuccessOrderPage(
                              title: "You've Sent a Video",
                              subtitle:
                                  "Just stay at home while we are\nbilling your best video",
                              buttonTitle1: "Home",
                              buttonTitle2: "My Transactions"));
                        }
                      },
                      child: (isLoading)
                          ? Center(
                              child: loadingIndicator,
                            )
                          : Container(
                              width: double.infinity,
                              height: 45,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: orangeColor,
                              ),
                              child: Center(
                                child: Text(
                                  "Upload",
                                  style: whiteFontStyle2.copyWith(
                                      fontWeight: FontWeight.bold),
                                ),
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
