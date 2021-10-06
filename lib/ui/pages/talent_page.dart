part of 'pages.dart';

class TalentPage extends StatefulWidget {
  const TalentPage({Key? key}) : super(key: key);

  @override
  _TalentPageState createState() => _TalentPageState();
}

class _TalentPageState extends State<TalentPage> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    double listItemWidth =
        MediaQuery.of(context).size.width - 2 * defaultMargin;

    return RefreshIndicator(
      onRefresh: () async {
        context.read<UserCubit>().state as UserLoaded;
      },
      child: ListView(
        children: [
          Column(
            children: [
              // HEADER
              Container(
                color: "#10151f".toColor(),
                height: 100,
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      margin:
                          const EdgeInsets.symmetric(horizontal: defaultMargin),
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/logo_top.png"),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    Container(
                      height: 50,
                      width: 50,
                      margin:
                          const EdgeInsets.symmetric(horizontal: defaultMargin),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: NetworkImage((context.read<UserCubit>().state
                                          as UserLoaded)
                                      .user
                                      .profile_photo_path !=
                                  null
                              ? 'https://staging.dudu.co.id/storage/' +
                                  (context.read<UserCubit>().state
                                          as UserLoaded)
                                      .user
                                      .profile_photo_path!
                              : "http://bavetboyolali.disnakkeswan.jatengprov.go.id/assets/front_end/img/no-image.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              // CAROUSEL
              Container(
                width: MediaQuery.of(context).size.width,
                height: 300,
                padding: const EdgeInsets.all(24),
                margin: const EdgeInsets.only(bottom: 30),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/carousel.png"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Dari, untuk,\ndengan ucapan",
                      style:
                          whiteFontStyle.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              // FEATURED
              Container(
                margin: const EdgeInsets.symmetric(horizontal: defaultMargin),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Featured",
                      style:
                          whiteFontStyle.copyWith(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Lihat semua",
                      style:
                          whiteFontStyl3.copyWith(color: "#C8188A".toColor()),
                    ),
                  ],
                ),
              ),

              Container(
                height: 258,
                width: double.infinity,
                margin: const EdgeInsets.only(bottom: 30),
                child: BlocBuilder<TalentCubit, TalentState>(
                  builder: (_, state) => (state is TalentLoaded)
                      ? ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            Row(
                              children: state.talents
                                  .map((e) => Padding(
                                        padding: EdgeInsets.only(
                                          left: (e == state.talents.first)
                                              ? defaultMargin
                                              : 0,
                                          right: defaultMargin,
                                        ),
                                        // child: TalentCard(
                                        //   talent: e,
                                        // ),
                                        child: GestureDetector(
                                          onTap: () {
                                            Get.to(() => TalentDetailsPage(
                                                  userTransaction:
                                                      UserTransaction(
                                                    talent_id: e,
                                                    user: (context
                                                            .read<UserCubit>()
                                                            .state as UserLoaded)
                                                        .user,
                                                  ),
                                                  onBackButtonPressed: () {
                                                    Get.back();
                                                  },
                                                ));
                                          },
                                          child: TalentCard(
                                            talent: e,
                                          ),
                                        ),
                                      ))
                                  .toList(),
                            )
                          ],
                        )
                      : Center(
                          child: loadingIndicator,
                        ),
                ),
              ),
              // FEATURED MOMENTS
              Container(
                width: double.infinity,
                height: 400,
                margin: const EdgeInsets.only(bottom: 30),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xff610A76), Color(0xffFF0000)],
                    begin: FractionalOffset.topLeft,
                    end: FractionalOffset.bottomRight,
                  ),
                ),
                child: Stack(
                  children: [
                    Container(
                      margin:
                          const EdgeInsets.symmetric(horizontal: defaultMargin),
                      padding: const EdgeInsets.only(top: 24),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Featured Moments",
                            style: whiteFontStyle.copyWith(
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Lihat semua",
                            style: whiteFontStyl3.copyWith(
                                color: "#00D8FF".toColor()),
                          ),
                        ],
                      ),
                    ),
                    BlocBuilder<TalentCubit, TalentState>(
                      builder: (_, state) => (state is TalentLoaded)
                          ? ListView(
                              scrollDirection: Axis.horizontal,
                              children: [
                                Row(
                                  children: state.talents
                                      .map((e) => Padding(
                                            padding: EdgeInsets.only(
                                              left: (e == state.talents.first)
                                                  ? defaultMargin
                                                  : 0,
                                              right: defaultMargin,
                                            ),
                                            child: GestureDetector(
                                              onTap: () {
                                                Get.to(() => TalentDetailsPage(
                                                      userTransaction:
                                                          UserTransaction(
                                                        talent_id: e,
                                                        user: (context
                                                                    .read<
                                                                        UserCubit>()
                                                                    .state
                                                                as UserLoaded)
                                                            .user,
                                                      ),
                                                      onBackButtonPressed: () {
                                                        Get.back();
                                                      },
                                                    ));
                                              },
                                              child: TalentCard(
                                                talent: e,
                                                colors: "#480658".toColor(),
                                                isMoments: true,
                                              ),
                                            ),
                                          ))
                                      .toList(),
                                )
                              ],
                            )
                          : Center(
                              child: loadingIndicator,
                            ),
                    ),
                  ],
                ),
              ),
              // VIDEO CALLS
              Container(
                margin: const EdgeInsets.fromLTRB(
                    defaultMargin, 0, defaultMargin, 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Live video calls",
                      style:
                          whiteFontStyle.copyWith(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Lihat semua",
                      style:
                          whiteFontStyl3.copyWith(color: "#C8188A".toColor()),
                    ),
                  ],
                ),
              ),
              BlocBuilder<TalentCubit, TalentState>(builder: (_, state) {
                if (state is TalentLoaded) {
                  List<Talent> talents = state.talents
                      .where((element) =>
                          element.types!.contains(TalentType.video_call))
                      .toList();
                  return Column(
                    children: talents
                        .map(
                          (e) => Padding(
                            padding: const EdgeInsets.fromLTRB(
                                defaultMargin, 0, defaultMargin, 16),
                            child: VideoCallsCard(
                                talent: e, itemWidth: listItemWidth),
                          ),
                        )
                        .toList(),
                  );
                } else {
                  return Center(
                    child: loadingIndicator,
                  );
                }
              }),
              // SINGER/MUSICIAN
              Container(
                margin: const EdgeInsets.fromLTRB(
                    defaultMargin, 30, defaultMargin, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Singer / Musician",
                      style:
                          whiteFontStyle.copyWith(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Lihat semua",
                      style:
                          whiteFontStyl3.copyWith(color: "#C8188A".toColor()),
                    ),
                  ],
                ),
              ),

              Container(
                height: 258,
                width: double.infinity,
                margin: const EdgeInsets.only(bottom: 30),
                child: BlocBuilder<TalentCubit, TalentState>(
                  builder: (_, state) => (state is TalentLoaded)
                      ? ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            Row(
                              children: state.talents
                                  .map((e) => Padding(
                                        padding: EdgeInsets.only(
                                          left: (e == state.talents.first)
                                              ? defaultMargin
                                              : 0,
                                          right: defaultMargin,
                                        ),
                                        child: GestureDetector(
                                          onTap: () {
                                            Get.to(() => TalentDetailsPage(
                                                  userTransaction:
                                                      UserTransaction(
                                                    talent_id: e,
                                                    user: (context
                                                            .read<UserCubit>()
                                                            .state as UserLoaded)
                                                        .user,
                                                  ),
                                                  onBackButtonPressed: () {
                                                    Get.back();
                                                  },
                                                ));
                                          },
                                          child: TalentCard(
                                            talent: e,
                                          ),
                                        ),
                                      ))
                                  .toList(),
                            )
                          ],
                        )
                      : Center(
                          child: loadingIndicator,
                        ),
                ),
              ),
              // ACTORS
              Container(
                margin: const EdgeInsets.symmetric(horizontal: defaultMargin),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Actors",
                      style:
                          whiteFontStyle.copyWith(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Lihat semua",
                      style:
                          whiteFontStyl3.copyWith(color: "#C8188A".toColor()),
                    ),
                  ],
                ),
              ),

              Container(
                height: 258,
                width: double.infinity,
                margin: const EdgeInsets.only(bottom: 30),
                child: BlocBuilder<TalentCubit, TalentState>(
                  builder: (_, state) => (state is TalentLoaded)
                      ? ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            Row(
                              children: state.talents
                                  .map((e) => Padding(
                                        padding: EdgeInsets.only(
                                          left: (e == state.talents.first)
                                              ? defaultMargin
                                              : 0,
                                          right: defaultMargin,
                                        ),
                                        child: GestureDetector(
                                          onTap: () {
                                            Get.to(() => TalentDetailsPage(
                                                  userTransaction:
                                                      UserTransaction(
                                                    talent_id: e,
                                                    user: (context
                                                            .read<UserCubit>()
                                                            .state as UserLoaded)
                                                        .user,
                                                  ),
                                                  onBackButtonPressed: () {
                                                    Get.back();
                                                  },
                                                ));
                                          },
                                          child: TalentCard(
                                            talent: e,
                                          ),
                                        ),
                                      ))
                                  .toList(),
                            )
                          ],
                        )
                      : Center(
                          child: loadingIndicator,
                        ),
                ),
              ),
              // COMEDIANS
              Container(
                margin: const EdgeInsets.symmetric(horizontal: defaultMargin),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Comedians",
                      style:
                          whiteFontStyle.copyWith(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Lihat semua",
                      style:
                          whiteFontStyl3.copyWith(color: "#C8188A".toColor()),
                    ),
                  ],
                ),
              ),

              Container(
                height: 258,
                width: double.infinity,
                margin: const EdgeInsets.only(bottom: 30),
                child: BlocBuilder<TalentCubit, TalentState>(
                  builder: (_, state) => (state is TalentLoaded)
                      ? ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            Row(
                              children: state.talents
                                  .map((e) => Padding(
                                        padding: EdgeInsets.only(
                                          left: (e == state.talents.first)
                                              ? defaultMargin
                                              : 0,
                                          right: defaultMargin,
                                        ),
                                        child: GestureDetector(
                                          onTap: () {
                                            Get.to(() => TalentDetailsPage(
                                                  userTransaction:
                                                      UserTransaction(
                                                    talent_id: e,
                                                    user: (context
                                                            .read<UserCubit>()
                                                            .state as UserLoaded)
                                                        .user,
                                                  ),
                                                  onBackButtonPressed: () {
                                                    Get.back();
                                                  },
                                                ));
                                          },
                                          child: TalentCard(
                                            talent: e,
                                          ),
                                        ),
                                      ))
                                  .toList(),
                            )
                          ],
                        )
                      : Center(
                          child: loadingIndicator,
                        ),
                ),
              ),
              const SizedBox(
                height: 80,
              )
            ],
          )
        ],
      ),
    );
  }
}
