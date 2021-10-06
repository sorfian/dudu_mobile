part of 'pages.dart';

class ProfilePage extends StatefulWidget {
  final UserTransaction? userTransaction;

  const ProfilePage({Key? key, this.userTransaction}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int selectedIndex = 0;
  List<String>? menu;
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          children: [
            //// Header
            Container(
                padding: const EdgeInsets.symmetric(horizontal: defaultMargin),
                height: 220,
                margin: const EdgeInsets.only(bottom: defaultMargin),
                width: double.infinity,
                color: darkColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 110,
                      height: 110,
                      margin: const EdgeInsets.only(bottom: 16),
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/photo_border.png'))),
                      child: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: NetworkImage((context
                                                .read<UserCubit>()
                                                .state as UserLoaded)
                                            .user
                                            .profile_photo_path !=
                                        null
                                    ? 'https://staging.dudu.co.id/storage/' +
                                        (context.read<UserCubit>().state
                                                as UserLoaded)
                                            .user
                                            .profile_photo_path!
                                    : "http://bavetboyolali.disnakkeswan.jatengprov.go.id/assets/front_end/img/no-image.png"),
                                fit: BoxFit.cover)),
                      ),
                    ),
                    Text(
                      (context.read<UserCubit>().state as UserLoaded)
                          .user
                          .name!,
                      style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                    Text(
                      (context.read<UserCubit>().state as UserLoaded)
                          .user
                          .email!,
                      style:
                          greyFontStyle.copyWith(fontWeight: FontWeight.w300),
                    )
                  ],
                )),
            //// Body
            Container(
              width: double.infinity,
              color: darkColor,
              child: Column(
                children: [
                  CustomTabBar(
                    titles: const ["Account", "Dudu"],
                    selectedIndex: selectedIndex,
                    onTap: (index) {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Column(
                    children: (menu = (selectedIndex == 0)
                            ? [
                                'Edit Profile',
                                'Home Address',
                                'Security',
                                'Payment',
                                'Logout'
                              ]
                            : [
                                'Rate App',
                                'Help Center',
                                'Privacy & Policy',
                                'Term & Condition'
                              ])
                        .map((e) => GestureDetector(
                              onTap: () async {
                                if (menu?.indexOf(e) == 4) {
                                  bool logout =
                                      await context.read<UserCubit>().logout();

                                  if (logout) {
                                    Get.offAll(() => const SplashPage());
                                  }
                                }
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    bottom: 16,
                                    left: defaultMargin,
                                    right: defaultMargin),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      e,
                                      style: whiteFontStyl3,
                                    ),
                                    SizedBox(
                                      height: 24,
                                      width: 24,
                                      child: Image.asset(
                                        'assets/right_arrow.png',
                                        fit: BoxFit.contain,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ))
                        .toList(),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 80,
            )
          ],
        ),
      ],
    );
  }
}
