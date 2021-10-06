part of 'pages.dart';

class SignUpPage extends StatefulWidget {
  final int? userType;
  const SignUpPage({Key? key, @required this.userType}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  User? user;
  File? pictureFile;
  bool isLoading = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GeneralPage(
      title: (widget.userType == 0)
          ? 'Register'
          : (widget.userType == 1)
              ? 'Register Talent'
              : 'Register Partner',
      subtitle: (widget.userType == 0)
          ? 'Get surprise from our talent'
          : (widget.userType == 1)
              ? 'Become our talent and earn money'
              : 'Be our private partner',
      onBackButtonPressed: () {
        Get.back();
      },
      child: Column(
        children: [
          GestureDetector(
            onTap: () async {
              XFile? pickedFile =
                  await ImagePicker().pickImage(source: ImageSource.gallery);
              if (pickedFile != null) {
                pictureFile = File(pickedFile.path);
                setState(() {});
              }
            },
            child: Container(
              height: 110,
              width: 110,
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.only(top: 26),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/photo_border.png'),
                ),
              ),
              child: (pictureFile != null)
                  ? Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: FileImage(pictureFile!),
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                  : Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage('assets/photo.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
            ),
          ),
          Container(
            width: double.infinity,
            margin:
                const EdgeInsets.fromLTRB(defaultMargin, 16, defaultMargin, 6),
            child: Text(
              'Full Name',
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
              controller: nameController,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintStyle: greyFontStyle,
                  hintText: 'Type your full name'),
            ),
          ),
          Container(
            width: double.infinity,
            margin:
                const EdgeInsets.fromLTRB(defaultMargin, 16, defaultMargin, 6),
            child: Text(
              'Email Address',
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
              controller: emailController,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintStyle: greyFontStyle,
                  hintText: 'Type your email address'),
            ),
          ),
          Container(
            width: double.infinity,
            margin:
                const EdgeInsets.fromLTRB(defaultMargin, 16, defaultMargin, 6),
            child: Text(
              'Password',
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
              controller: passwordController,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintStyle: greyFontStyle,
                  hintText: 'Type your password'),
              obscureText: true,
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
                    if (widget.userType == 0) {
                      // REGISTER USER
                      user = User(
                        name: nameController.text,
                        email: emailController.text,
                        password: passwordController.text,
                        is_active: 1,
                        role: "USER",
                      );

                      setState(() {
                        isLoading = true;
                      });
                      await context.read<UserCubit>().signUp(
                          user!, passwordController.text,
                          pictureFile: pictureFile);

                      UserState state = context.read<UserCubit>().state;

                      if (state is UserLoaded) {
                        context.read<TalentCubit>().getTalents();
                        context
                            .read<UserTransactionsCubit>()
                            .getUserTransactions();
                        Get.offAll(() => const MainPage());
                      } else if (passwordController.text.length < 8) {
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
                    } else if (widget.userType == 1) {
                      // REGISTER TALENT
                      Get.to(() => SignUpDetail(
                            User(
                                name: nameController.text,
                                email: emailController.text),
                            passwordController.text,
                            pictureFile,
                          ));
                    } else {
                      // REGISTER PARTNER
                      Get.to(() => SignUpTalent(
                            User(
                                name: nameController.text,
                                email: emailController.text),
                            passwordController.text,
                            pictureFile,
                          ));
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
                        (widget.userType == 0)
                            ? "Register"
                            : (widget.userType == 1)
                                ? "Continue"
                                : "Continue",
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
