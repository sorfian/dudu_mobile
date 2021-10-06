part of 'pages.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return GeneralPage(
      title: 'Sign In',
      subtitle: 'Find your best talent',
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
          isLoading
              ? Container(
                  margin: const EdgeInsets.fromLTRB(
                      defaultMargin, 24, defaultMargin, 24),
                  child: loadingIndicator,
                )
              : GestureDetector(
                  onTap: () async {
                    setState(() {
                      isLoading = true;
                    });
                    await context
                        .read<UserCubit>()
                        .signIn(emailController.text, passwordController.text);

                    UserState state = context.read<UserCubit>().state;

                    if (state is UserLoaded) {
                      context.read<TalentCubit>().getTalents();
                      context
                          .read<UserTransactionsCubit>()
                          .getUserTransactions();
                      Get.offAll(() => const MainPage());
                    } else {
                      Get.snackbar("", "",
                          backgroundColor: "D9435E".toColor(),
                          icon: const Icon(
                            MdiIcons.closeCircleOutline,
                            color: Colors.white,
                          ),
                          titleText: Text(
                            "Sign In Failed",
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
                        "Login",
                        style: whiteFontStyle2.copyWith(
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: defaultMargin),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Ingin jadi partner kami? ",
                  style: greyFontStyle.copyWith(fontWeight: FontWeight.w400),
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(() => const SignUpPage(
                          userType: 2,
                        ));
                  },
                  child: Text(
                    "Register",
                    style: orangeFontStyle,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
