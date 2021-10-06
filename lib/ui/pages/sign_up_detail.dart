part of 'pages.dart';

class SignUpDetail extends StatefulWidget {
  final User? user;
  final String? password;
  final File? pictureFile;

  const SignUpDetail(this.user, this.password, this.pictureFile, {Key? key})
      : super(key: key);

  @override
  _SignUpDetailState createState() => _SignUpDetailState();
}

class _SignUpDetailState extends State<SignUpDetail> {
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController socmedDetailController = TextEditingController();
  TextEditingController totalFollowersController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  // final items = ['Facebook', 'Twitter', 'Instagram', 'LinkedIn'];
  // String? value;
  bool isLoading = false;

  List<String>? sosmed;
  String? selectedSosmed;

  @override
  void initState() {
    super.initState();
    sosmed = ['Facebook', 'Twitter', 'Instagram', 'LinkedIn'];
    selectedSosmed = sosmed![0];
  }

  @override
  Widget build(BuildContext context) {
    return GeneralPage(
      title: 'Details',
      subtitle: 'Complete your profile',
      onBackButtonPressed: () {
        Get.back();
      },
      child: Column(
        children: [
          Container(
            width: double.infinity,
            margin:
                const EdgeInsets.fromLTRB(defaultMargin, 26, defaultMargin, 6),
            child: Text(
              'Phone No.',
              style: whiteFontStyle2,
            ),
          ),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: defaultMargin),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              border: Border.all(color: Colors.white),
            ),
            child: TextField(
              keyboardType: TextInputType.phone,
              style: const TextStyle(color: Colors.white),
              controller: phoneNumberController,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintStyle: greyFontStyle,
                  hintText: 'Type your phone number'),
            ),
          ),
          Container(
            width: double.infinity,
            margin:
                const EdgeInsets.fromLTRB(defaultMargin, 16, defaultMargin, 6),
            child: Text(
              'Social Media',
              style: whiteFontStyle2,
            ),
          ),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: defaultMargin),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              border: Border.all(color: Colors.white),
            ),
            child: DropdownButton(
              value: selectedSosmed,
              isExpanded: true,
              dropdownColor: Colors.black,
              underline: const SizedBox(),
              items: sosmed!
                  .map((e) => DropdownMenuItem(
                      value: e,
                      child: Text(
                        e,
                        style: whiteFontStyl3,
                      )))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  selectedSosmed = value.toString();
                });
              },
            ),
          ),
          Container(
            width: double.infinity,
            margin:
                const EdgeInsets.fromLTRB(defaultMargin, 16, defaultMargin, 6),
            child: Text(
              'Username / Page',
              style: whiteFontStyle2,
            ),
          ),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: defaultMargin),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              border: Border.all(color: Colors.white),
            ),
            child: TextField(
              style: const TextStyle(color: Colors.white),
              controller: socmedDetailController,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintStyle: greyFontStyle,
                  hintText: 'Username or url to social media'),
            ),
          ),
          Container(
            width: double.infinity,
            margin:
                const EdgeInsets.fromLTRB(defaultMargin, 16, defaultMargin, 6),
            child: Text(
              'Total Followers',
              style: whiteFontStyle2,
            ),
          ),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: defaultMargin),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              border: Border.all(color: Colors.white),
            ),
            child: TextField(
              keyboardType: TextInputType.phone,
              style: const TextStyle(color: Colors.white),
              controller: totalFollowersController,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintStyle: greyFontStyle,
                  hintText: 'How many followers do you have?'),
            ),
          ),
          Container(
            width: double.infinity,
            margin:
                const EdgeInsets.fromLTRB(defaultMargin, 16, defaultMargin, 6),
            child: Text(
              'Description',
              style: whiteFontStyle2,
            ),
          ),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: defaultMargin),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              border: Border.all(color: Colors.white),
            ),
            child: TextField(
              style: const TextStyle(color: Colors.white),
              controller: descriptionController,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintStyle: greyFontStyle,
                  hintText: 'Anything else we should know about you?'),
            ),
          ),
          (isLoading)
              ? Container(
                  margin: const EdgeInsets.fromLTRB(
                      defaultMargin, 24, defaultMargin, 24),
                  child: loadingIndicator,
                )
              : GestureDetector(
                  onTap: () async {
                    User user = widget.user!.copyWith(
                      phone_number: phoneNumberController.text,
                      social_media: selectedSosmed,
                      socmed_detail: socmedDetailController.text,
                      total_followers: totalFollowersController.text.toInt(),
                      description: descriptionController.text,
                      is_active: 0,
                      role: "TALENT",
                    );

                    setState(() {
                      isLoading = true;
                    });
                    await context.read<UserCubit>().signUp(
                        user, widget.password!,
                        pictureFile: widget.pictureFile);

                    UserState state = context.read<UserCubit>().state;

                    if (state is UserLoaded) {
                      context.read<TalentCubit>().getTalents();
                      context
                          .read<UserTransactionsCubit>()
                          .getUserTransactions();
                      Get.offAll(() => const SuccessSignUpPage());
                    } else if (widget.password!.length < 8) {
                      Get.snackbar("", "",
                          backgroundColor: "D9435E".toColor(),
                          icon: const Icon(
                            MdiIcons.closeCircleOutline,
                            color: Colors.white,
                          ),
                          titleText: Text(
                            "Sign Up Failed",
                            style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          ),
                          messageText: Text(
                            "Password length minimal is 8 characters",
                            style: GoogleFonts.poppins(color: Colors.white),
                          ));

                      setState(() {
                        isLoading = false;
                      });
                    } else {
                      Get.snackbar("", "",
                          backgroundColor: "D9435E".toColor(),
                          icon: const Icon(
                            MdiIcons.closeCircleOutline,
                            color: Colors.white,
                          ),
                          titleText: Text(
                            "Sign Up Failed",
                            style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          ),
                          messageText: Text(
                            (state as UserLoadingFailed).message,
                            style: GoogleFonts.poppins(color: Colors.white),
                          ));

                      setState(() {
                        isLoading = false;
                      });
                    }
                  },
                  child: Container(
                    width: double.infinity,
                    height: 45,
                    margin: const EdgeInsets.fromLTRB(
                        defaultMargin, 24, defaultMargin, 24),
                    padding:
                        const EdgeInsets.symmetric(horizontal: defaultMargin),
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
                        "Register",
                        style: whiteFontStyle2.copyWith(
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
