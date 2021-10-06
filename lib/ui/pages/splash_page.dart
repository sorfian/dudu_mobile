part of 'pages.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: "#10151f".toColor(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height: 160,
              margin: const EdgeInsets.only(bottom: 140),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/logo_splashscreen.png"),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: defaultMargin),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.to(() => const SignUpPage(
                            userType: 0,
                          ));
                    },
                    child: Container(
                      width: 150,
                      height: 45,
                      margin: const EdgeInsets.only(top: 140, bottom: 20),
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
                  GestureDetector(
                    onTap: () {
                      Get.to(() => const SignUpPage(
                            userType: 1,
                          ));
                    },
                    child: Container(
                      width: 150,
                      height: 45,
                      margin: const EdgeInsets.only(top: 140, bottom: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        gradient: const LinearGradient(
                          colors: [Color(0xffFF9600), Color(0xff10151f)],
                          begin: FractionalOffset.topLeft,
                          end: FractionalOffset.bottomRight,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          "Enroll Talent",
                          style: whiteFontStyle2.copyWith(
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: defaultMargin),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Sudah punya akun? ",
                    style: greyFontStyle.copyWith(fontWeight: FontWeight.w400),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => const SignInPage());
                    },
                    child: Text(
                      "Login",
                      style: orangeFontStyle,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 50,
            )
          ],
        ),
      ),
    );
  }
}
