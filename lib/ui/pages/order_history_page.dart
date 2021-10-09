part of 'pages.dart';

class OrderHistoryPage extends StatefulWidget {
  const OrderHistoryPage({Key? key}) : super(key: key);

  @override
  _OrderHistoryPageState createState() => _OrderHistoryPageState();
}

class _OrderHistoryPageState extends State<OrderHistoryPage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserTransactionsCubit, UserTransactionsState>(
        builder: (_, state) {
      if (state is UserTransactionLoaded) {
        if (state.transactions.length == 0) {
          return IllustrationPage(
            title: 'Ouch! No order',
            subtitle: 'Seems you like have not\nordered any talents yet',
            picturePath: 'assets/love_burger.png',
            buttonTitle1: 'Find Talents',
            buttonTap1: () {
              Get.offAll(() => const MainPage());
            },
            buttonTitle2: 'Oke',
            // buttonTap2: () {},
          );
        } else {
          double listItemWidth =
              MediaQuery.of(context).size.width - 2 * defaultMargin;
          return RefreshIndicator(
            onRefresh: () async {
              await context.read<UserTransactionsCubit>().getUserTransactions();
            },
            child: ListView(
              children: [
                Column(
                  children: [
                    Container(
                      height: 100,
                      width: double.infinity,
                      margin: const EdgeInsets.only(bottom: defaultMargin),
                      padding:
                          const EdgeInsets.symmetric(horizontal: defaultMargin),
                      color: darkColor,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Your Orders', style: whiteFontStyle),
                          Text(
                            'Wait for the best quality',
                            style: greyFontStyle.copyWith(
                                fontWeight: FontWeight.w300),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      color: darkColor,
                      child: Column(
                        children: [
                          CustomTabBar(
                            titles: const ['In Progress', 'Past Orders'],
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
                          Builder(builder: (_) {
                            List<UserTransaction> transactions =
                                (selectedIndex == 0)
                                    ? state.transactions
                                        .where((element) =>
                                            element.status ==
                                                UserTransactionStatus
                                                    .on_process ||
                                            element.status ==
                                                UserTransactionStatus.pending)
                                        .toList()
                                    : state.transactions
                                        .where((element) =>
                                            element.status ==
                                                UserTransactionStatus.success ||
                                            element.status ==
                                                UserTransactionStatus.cancelled)
                                        .toList();
                            return Column(
                              children: transactions
                                  .map((e) => Padding(
                                        padding: const EdgeInsets.only(
                                            right: defaultMargin,
                                            left: defaultMargin,
                                            bottom: 16),
                                        child: GestureDetector(
                                          // onTap: () async {
                                          //   if (e.status ==
                                          //       UserTransactionStatus.pending) {
                                          //     await launch(e.payment_url!);
                                          //   }
                                          // },
                                          onTap: () {
                                            Get.to(() => OrderDetailsPage(
                                                  userTransaction: e,
                                                ));
                                          },
                                          child: OrderListItem(
                                            itemWidth: listItemWidth,
                                            userTransaction: e,
                                          ),
                                        ),
                                      ))
                                  .toList(),
                            );
                          }),
                          const SizedBox(
                            height: 60,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          );
        }
      } else {
        return Center(
          child: loadingIndicator,
        );
      }
    });
  }
}
