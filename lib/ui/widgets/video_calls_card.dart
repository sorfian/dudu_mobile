part of 'widgets.dart';

class VideoCallsCard extends StatelessWidget {
  final Talent? talent;
  final double? itemWidth;
  const VideoCallsCard(
      {Key? key, @required this.talent, @required this.itemWidth})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 120,
              height: 120,
              margin: const EdgeInsets.only(right: 12),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                ),
                image: DecorationImage(
                  image: NetworkImage(talent!.picture_path!),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              width: itemWidth! - 220, // (60 + 12 + 110),
              child: Padding(
                padding: const EdgeInsets.only(left: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      talent!.user!.name!,
                      style:
                          whiteFontStyle2.copyWith(fontWeight: FontWeight.bold),
                      maxLines: 1,
                      overflow: TextOverflow.clip,
                    ),
                    Text(
                      talent!.type![0].toString(),
                      style: whiteFontStyle2.copyWith(fontSize: 14),
                    ),
                    Text(
                      NumberFormat.currency(
                              symbol: "Rp. ", decimalDigits: 0, locale: "id-ID")
                          .format(talent!.price),
                      style: greyFontStyle.copyWith(fontSize: 13),
                    ),
                  ],
                ),
              ),
            ),
            BlocBuilder<TalentCubit, TalentState>(
              builder: (_, state) => (state is TalentLoaded)
                  ? Column(
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(80, 30),
                            elevation: 10,
                            shape: const StadiumBorder(),
                            primary: "#2F2F2F".toColor(),
                          ),
                          child: Text(
                            'Pesan',
                            style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Get.to(() => TalentDetailsPage(
                                  userTransaction: UserTransaction(
                                    talent_id: talent,
                                    user: (context.read<UserCubit>().state
                                            as UserLoaded)
                                        .user,
                                  ),
                                  onBackButtonPressed: () {
                                    Get.back();
                                  },
                                ));
                          },
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(80, 30),
                            elevation: 10,
                            shape: const StadiumBorder(),
                            primary: "#82085D".toColor(),
                          ),
                          child: Text(
                            'Beli',
                            style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          ),
                        )
                      ],
                    )
                  : const SizedBox(),
            )
          ],
        )
      ],
    );
  }
}
