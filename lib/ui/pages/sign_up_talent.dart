part of 'pages.dart';

class SignUpTalent extends StatefulWidget {
  final User? user;
  final String? password;
  final File? pictureFile;

  const SignUpTalent(this.user, this.password, this.pictureFile, {Key? key})
      : super(key: key);

  @override
  _SignUpTalentState createState() => _SignUpTalentState();
}

class _SignUpTalentState extends State<SignUpTalent> {
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController companyController = TextEditingController();
  TextEditingController webLinkedInController = TextEditingController();
  TextEditingController industryController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController isJoinedController = TextEditingController();
  TextEditingController npwpController = TextEditingController();

  bool isLoading = false;

  List<String>? partnerRole;
  String? selectedPartnerRole;

  List<String>? isJoined;
  String? selectedIsJoined;

  @override
  void initState() {
    super.initState();

    partnerRole = ['Agent', 'Manager', 'Publicist', 'Other'];
    selectedPartnerRole = partnerRole![0];

    isJoined = ['No', 'Yes'];
    selectedIsJoined = isJoined![0];
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
              'Company',
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
              controller: companyController,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintStyle: greyFontStyle,
                  hintText: 'Company name'),
            ),
          ),
          Container(
            width: double.infinity,
            margin:
                const EdgeInsets.fromLTRB(defaultMargin, 16, defaultMargin, 6),
            child: Text(
              'Website / LinkedIn',
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
              controller: webLinkedInController,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintStyle: greyFontStyle,
                  hintText: 'yourwebsite.com'),
            ),
          ),
          Container(
            width: double.infinity,
            margin:
                const EdgeInsets.fromLTRB(defaultMargin, 16, defaultMargin, 6),
            child: Text(
              'Role',
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
              value: selectedPartnerRole,
              isExpanded: true,
              dropdownColor: Colors.black,
              underline: const SizedBox(),
              items: partnerRole!
                  .map((e) => DropdownMenuItem(
                      value: e,
                      child: Text(
                        e,
                        style: whiteFontStyl3,
                      )))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  selectedPartnerRole = value.toString();
                });
              },
            ),
          ),
          Container(
            width: double.infinity,
            margin:
                const EdgeInsets.fromLTRB(defaultMargin, 16, defaultMargin, 6),
            child: Text(
              'NPWP',
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
              controller: npwpController,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintStyle: greyFontStyle,
                  hintText: 'Your NPWP number'),
            ),
          ),
          Container(
            width: double.infinity,
            margin:
                const EdgeInsets.fromLTRB(defaultMargin, 16, defaultMargin, 6),
            child: Text(
              'Have you worked with us in the past?',
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
              value: selectedIsJoined,
              isExpanded: true,
              dropdownColor: Colors.black,
              underline: const SizedBox(),
              items: isJoined!
                  .map((e) => DropdownMenuItem(
                      value: e,
                      child: Text(
                        e,
                        style: whiteFontStyl3,
                      )))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  selectedIsJoined = value.toString();
                });
              },
            ),
          ),
          Container(
            width: double.infinity,
            margin:
                const EdgeInsets.fromLTRB(defaultMargin, 16, defaultMargin, 6),
            child: Text(
              'Industry',
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
              controller: industryController,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintStyle: greyFontStyle,
                  hintText: 'Fashion'),
            ),
          ),
          Container(
            width: double.infinity,
            margin:
                const EdgeInsets.fromLTRB(defaultMargin, 16, defaultMargin, 6),
            child: Text(
              'City',
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
              controller: cityController,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintStyle: greyFontStyle,
                  hintText: 'Jakarta'),
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
                      company: companyController.text,
                      web_linkedin: webLinkedInController.text,
                      partner_role: selectedPartnerRole,
                      industry: industryController.text,
                      city: cityController.text,
                      npwp: npwpController.text,
                      is_joined: isJoined!.indexOf(selectedIsJoined!),
                      is_active: 0,
                      role: "PARTNER",
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
