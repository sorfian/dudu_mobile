part of 'pages.dart';

class SelectUserPage extends StatefulWidget {
  final Function? onBackButtonPressed;
  final UserTransaction? userTransaction;

  const SelectUserPage({
    Key? key,
    this.userTransaction,
    this.onBackButtonPressed,
  }) : super(key: key);

  @override
  _SelectUserPageState createState() => _SelectUserPageState();
}

class _SelectUserPageState extends State<SelectUserPage> {
  var profilePicturePath;
  @override
  Widget build(BuildContext context) {
    return GeneralPage(
      title: 'Select User',
      onBackButtonPressed: () {
        Get.back();
      },
      child: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: defaultMargin),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.offAll(() => SelectOccasionPage(
                                userTransaction: widget.userTransaction,
                                onBackButtonPressed: () {
                                  Get.to(() => const MainPage());
                                },
                                profilePicture: (widget.userTransaction!.user!
                                            .profile_photo_path !=
                                        null)
                                    ? widget.userTransaction!.user!
                                        .profile_photo_path
                                    : "http://bavetboyolali.disnakkeswan.jatengprov.go.id/assets/front_end/img/no-image.png",
                              ));
                        },
                        child: Row(
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
                                    color: const Color(0xffBB1556), width: 5),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width -
                                  (48 + 20 + 48),
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Text(
                                widget.userTransaction!.user!.name!,
                                style: whiteFontStyl3,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
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
