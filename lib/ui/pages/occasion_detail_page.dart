part of 'pages.dart';

class OccasionDetailPage extends StatefulWidget {
  final Function? onBackButtonPressed;
  final UserTransaction? userTransaction;
  final String? moment;
  const OccasionDetailPage(
      {Key? key, this.onBackButtonPressed, this.userTransaction, this.moment})
      : super(key: key);

  @override
  _OccasionDetailPageState createState() => _OccasionDetailPageState();
}

class _OccasionDetailPageState extends State<OccasionDetailPage> {
  TextEditingController occasionController = TextEditingController();
  TextEditingController instructionController = TextEditingController();
  File? videoFile;
  File? video;

  @override
  Widget build(BuildContext context) {
    return GeneralPage(
      title: 'Occasion Details',
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    height: 120,
                    width: 120,
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
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: "#CF2968".toColor(),
                    ),
                    child: const Icon(
                      MdiIcons.plus,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                const SizedBox(
                  height: 150,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: defaultMargin),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SelectableBox(
                        widget.moment,
                        occasionDetail: true,
                        width: 80,
                        height: 80,
                      ),
                      Container(
                        child: Text(
                          widget.moment!,
                          style: whiteFontStyle2,
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(() => SelectOccasionPage(
                                userTransaction: widget.userTransaction,
                                onBackButtonPressed: () {
                                  Get.to(() => const MainPage());
                                },
                              ));
                        },
                        child: Container(
                          width: 100,
                          height: 45,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            border: Border.all(color: Colors.white),
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
                      Container(
                        height: 40,
                        width: 40,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.green,
                        ),
                        child: const Icon(
                          MdiIcons.checkBold,
                          color: Colors.white,
                          size: 20,
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.fromLTRB(
                      defaultMargin + 6, 26, defaultMargin + 6, 6),
                  child: Text(
                    """What's going on?""",
                    style: whiteFontStyle2,
                  ),
                ),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.fromLTRB(
                      defaultMargin + 6, 0, defaultMargin + 6, 20),
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.white),
                    color: Colors.transparent,
                  ),
                  child: TextField(
                    style: const TextStyle(color: Colors.white),
                    controller: occasionController,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintStyle: greyFontStyle,
                        hintText: """What's going on with the recipient?"""),
                  ),
                ),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.fromLTRB(
                      defaultMargin + 6, 16, defaultMargin + 6, 6),
                  child: Text(
                    'Instruction for ' +
                        widget.userTransaction!.talent_id!.user!.name!,
                    style: whiteFontStyle2,
                  ),
                ),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.fromLTRB(
                      defaultMargin + 6, 0, defaultMargin + 6, 20),
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.white),
                    color: Colors.transparent,
                  ),
                  child: TextField(
                    style: const TextStyle(color: Colors.white),
                    controller: instructionController,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintStyle: greyFontStyle,
                        hintText:
                            "What should they say or do on this special day?"),
                  ),
                ),
                Stack(
                  children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(
                          defaultMargin, 36, defaultMargin, 0),
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
                          child: (videoFile != null)
                              ? Container(
                                  margin: const EdgeInsets.all(10),
                                  width:
                                      MediaQuery.of(context).size.width * 0.2,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                        image: FileImage(videoFile!),
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
                                      Text("Add a short 20 seconds video",
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
                          video = File(pickedFile.path);
                          final fileName = await VideoThumbnail.thumbnailFile(
                            video: pickedFile.path,
                            imageFormat: ImageFormat.JPEG,
                            thumbnailPath: (await getTemporaryDirectory()).path,
                            maxWidth:
                                128, // specify the width of the thumbnail, let the height auto-scaled to keep the source aspect ratio
                            quality: 25,
                          );
                          videoFile = File(fileName!);
                          // print(videoFile);
                          // print(video);

                          setState(() {});
                        }
                      },
                      child: Container(
                        margin: const EdgeInsets.fromLTRB(
                            defaultMargin, 36, defaultMargin, 50),
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
                      onTap: () {
                        Get.to(
                          () => PaymentPage(
                            userTransaction: widget.userTransaction,
                            moment: widget.moment,
                            occasion: occasionController.text,
                            instruction: instructionController.text,
                            videoFile: video,
                          ),
                        );
                      },
                      child: Container(
                        width: 120,
                        height: 45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: orangeColor,
                        ),
                        child: Center(
                          child: Text(
                            "Next",
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
