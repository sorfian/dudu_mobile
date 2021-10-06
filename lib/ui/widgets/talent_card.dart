part of 'widgets.dart';

class TalentCard extends StatelessWidget {
  final Talent? talent;
  final Color? colors;
  final bool? isMoments;
  const TalentCard({Key? key, this.talent, this.colors, this.isMoments})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 230,
      decoration: BoxDecoration(
        color: colors ?? Colors.black,
        borderRadius: BorderRadius.circular(8),
        // boxShadow: const [
        //   BoxShadow(
        //     spreadRadius: 1,
        //     blurRadius: 3,
        //     color: Colors.white24,
        //   ),
        // ],
      ),
      child: Column(
        children: [
          Container(
            height: 140,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
              ),
              image: DecorationImage(
                image: NetworkImage(talent!.picture_path!),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(12, 12, 12, 0),
            width: 200,
            child: Text(
              talent!.user!.name!,
              style: whiteFontStyle2.copyWith(fontWeight: FontWeight.bold),
              maxLines: 1,
              overflow: TextOverflow.clip,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 12),
            width: 200,
            child: Text(
              (isMoments == null)
                  ? "Mulai " +
                      NumberFormat.currency(
                              symbol: "Rp. ", decimalDigits: 0, locale: "id-ID")
                          .format(talent!.price)
                  : talent!.type![0].toString(),
              style: greyFontStyle,
              maxLines: 1,
              overflow: TextOverflow.clip,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12),
            child: (isMoments == null)
                ? RatingStars(rate: talent!.rate)
                : Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Mulai " +
                          NumberFormat.currency(
                                  symbol: "Rp. ",
                                  decimalDigits: 0,
                                  locale: "id-ID")
                              .format(talent!.price),
                      style: whiteFontStyl3,
                      maxLines: 1,
                      overflow: TextOverflow.clip,
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
