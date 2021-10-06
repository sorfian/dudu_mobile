part of 'pages.dart';

class TalentDetailsPage extends StatefulWidget {
  final Function? onBackButtonPressed;
  final UserTransaction? userTransaction;
  const TalentDetailsPage(
      {Key? key, this.onBackButtonPressed, this.userTransaction})
      : super(key: key);

  @override
  _TalentDetailsPageState createState() => _TalentDetailsPageState();
}

class _TalentDetailsPageState extends State<TalentDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: "#10151f".toColor(),
          ),
          SafeArea(
            child: Container(
              color: "#10151f".toColor(),
            ),
          ),
          SafeArea(
            child: Container(
              height: 300,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        widget.userTransaction!.talent_id!.picture_path!),
                    fit: BoxFit.cover),
              ),
            ),
          ),
          SafeArea(
              child: ListView(
            children: [
              Column(
                children: [
                  Container(
                    height: 100,
                    padding:
                        const EdgeInsets.symmetric(horizontal: defaultMargin),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: GestureDetector(
                        onTap: () {
                          if (widget.onBackButtonPressed != null) {
                            widget.onBackButtonPressed!();
                          }
                        },
                        child: Container(
                          padding: const EdgeInsets.all(3),
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.black12,
                          ),
                          child: Image.asset('assets/back_arrow_white.png'),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 180),
                    padding: const EdgeInsets.symmetric(
                        vertical: 26, horizontal: 16),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                      color: "#10151f".toColor(),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width:
                                  MediaQuery.of(context).size.width - 32 - 52,
                              child: Text(
                                widget.userTransaction!.talent_id!.user!.name!,
                                style: whiteFontStyle2,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            RatingStars(
                                rate: widget.userTransaction!.talent_id!.rate!),
                            Container(
                              margin: const EdgeInsets.fromLTRB(0, 14, 0, 16),
                              child: Text(
                                widget.userTransaction!.talent_id!.description!,
                                style: greyFontStyle,
                              ),
                            ),
                            Text(
                              'Category:',
                              style: whiteFontStyl3,
                            ),
                            Container(
                              margin: const EdgeInsets.fromLTRB(0, 4, 0, 41),
                              child: Text(
                                widget.userTransaction!.talent_id!.type![0]
                                    .toString(),
                                style: greyFontStyle,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Harga",
                                      style:
                                          greyFontStyle.copyWith(fontSize: 13),
                                    ),
                                    Text(
                                      NumberFormat.currency(
                                              locale: 'id-ID',
                                              symbol: 'Rp. ',
                                              decimalDigits: 0)
                                          .format(widget.userTransaction!
                                              .talent_id!.price),
                                      style: whiteFontStyle2.copyWith(
                                          fontSize: 18),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 163,
                                  height: 45,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Get.to(() => SelectOccasionPage(
                                            userTransaction:
                                                widget.userTransaction,
                                            onBackButtonPressed: () {
                                              Get.back();
                                            },
                                          ));
                                    },
                                    style: ElevatedButton.styleFrom(
                                      shape: const StadiumBorder(),
                                      primary: "#FF9600".toColor(),
                                    ),
                                    child: Text(
                                      "Order Sekarang",
                                      style: whiteFontStyl3.copyWith(
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              )
            ],
          ))
        ],
      ),
    );
  }
}
