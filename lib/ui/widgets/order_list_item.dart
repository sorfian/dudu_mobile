part of 'widgets.dart';

class OrderListItem extends StatelessWidget {
  final UserTransaction? userTransaction;
  final double? itemWidth;

  const OrderListItem({Key? key, this.userTransaction, this.itemWidth})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 60,
          height: 60,
          margin: const EdgeInsets.only(right: 12),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                  image:
                      NetworkImage(userTransaction!.talent_id!.picture_path!),
                  fit: BoxFit.cover)),
        ),
        SizedBox(
          width: itemWidth! - 182, // (60 + 12 + 110)
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                userTransaction!.talent_id!.name!,
                style: whiteFontStyle2,
                maxLines: 1,
                overflow: TextOverflow.clip,
              ),
              Text(
                "1 item(s) • " +
                    NumberFormat.currency(
                            symbol: 'IDR ', decimalDigits: 0, locale: 'id-ID')
                        .format(userTransaction!.total),
                style: greyFontStyle.copyWith(fontSize: 13),
              )
            ],
          ),
        ),
        SizedBox(
          width: 110,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                convertDateTime(userTransaction!.date!),
                style: greyFontStyle.copyWith(fontSize: 12),
              ),
              (userTransaction!.status == UserTransactionStatus.cancelled)
                  ? Text(
                      'Cancelled',
                      style: GoogleFonts.poppins(
                          color: 'D9435E'.toColor(), fontSize: 10),
                    )
                  : (userTransaction!.status == UserTransactionStatus.pending)
                      ? Text(
                          'Pending',
                          style: GoogleFonts.poppins(
                              color: 'D9435E'.toColor(), fontSize: 10),
                        )
                      : (userTransaction!.status ==
                              UserTransactionStatus.success)
                          ? Text(
                              'Success',
                              style: GoogleFonts.poppins(
                                  color: '1ABC9C'.toColor(), fontSize: 10),
                            )
                          : (userTransaction!.status ==
                                  UserTransactionStatus.paid)
                              ? Text(
                                  'Paid',
                                  style: GoogleFonts.poppins(
                                      color: '1ABC9C'.toColor(), fontSize: 10),
                                )
                              : (userTransaction!.status ==
                                      UserTransactionStatus.delivered)
                                  ? Text(
                                      'Delivered',
                                      style: GoogleFonts.poppins(
                                          color: '1ABC9C'.toColor(),
                                          fontSize: 10),
                                    )
                                  : Text(
                                      'On Process',
                                      style: GoogleFonts.poppins(
                                          color: orangeColor, fontSize: 10),
                                    )
            ],
          ),
        )
      ],
    );
  }

  String convertDateTime(DateTime dateTime) {
    String month;

    switch (dateTime.month) {
      case 1:
        month = 'Jan';
        break;
      case 2:
        month = 'Feb';
        break;
      case 3:
        month = 'Mar';
        break;
      case 4:
        month = 'Apr';
        break;
      case 5:
        month = 'May';
        break;
      case 6:
        month = 'Jun';
        break;
      case 7:
        month = 'Jul';
        break;
      case 8:
        month = 'Aug';
        break;
      case 9:
        month = 'Sep';
        break;
      case 10:
        month = 'Oct';
        break;
      case 11:
        month = 'Nov';
        break;
      default:
        month = 'Des';
    }

    return month + ' ${dateTime.day}, ${dateTime.hour}:${dateTime.minute}';
  }
}
