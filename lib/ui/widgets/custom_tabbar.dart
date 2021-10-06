part of 'widgets.dart';

class CustomTabBar extends StatelessWidget {
  final int? selectedIndex;
  final List<String>? titles;
  final Function(int)? onTap;

  const CustomTabBar({Key? key, this.selectedIndex, this.titles, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: darkColor,
      height: 50,
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 48),
            height: 1,
            color: darkColor,
          ),
          Row(
            children: titles!
                .map((e) => Padding(
                      padding: const EdgeInsets.only(left: defaultMargin),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () {
                              if (onTap != null) {
                                onTap!(titles!.indexOf(e));
                              }
                            },
                            child: Text(
                              e,
                              style: (titles!.indexOf(e) == selectedIndex)
                                  ? whiteFontStyl3.copyWith(
                                      fontWeight: FontWeight.w500)
                                  : greyFontStyle,
                            ),
                          ),
                          Container(
                            width: 40,
                            height: 3,
                            margin: const EdgeInsets.only(top: 13),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(1.5),
                                color: (titles!.indexOf(e) == selectedIndex)
                                    ? orangeColor
                                    : Colors.transparent),
                          )
                        ],
                      ),
                    ))
                .toList(),
          )
        ],
      ),
    );
  }
}
