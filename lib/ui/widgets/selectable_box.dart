part of 'widgets.dart';

class SelectableBox extends StatelessWidget {
  final bool? isSelected;
  final bool? isEnabled;
  final double? width;
  final double? height;
  final String? text;
  final Function? onTap;
  final TextStyle? textStyle;
  final bool? occasionDetail;

  const SelectableBox(
    this.text, {
    Key? key,
    this.isSelected = false,
    this.isEnabled = true,
    this.width = 144,
    this.height = 60,
    this.onTap,
    this.textStyle,
    this.occasionDetail,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onTap != null) {
          onTap!();
        }
      },
      child: Column(
        children: [
          Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xffBB1556), Color(0xff610A76)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                // stops: [0.1, 0.9],
              ),
              borderRadius: BorderRadius.circular(15),
              // color: isSelected! ? "#10151f".toColor() : Colors.transparent,
              // border: Border.all(
              //   color: isSelected! ? Colors.transparent : "#10151f".toColor(),
              // ),
            ),
            child: Center(
              child: Container(
                width: width! / 2,
                height: height! / 2,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/" + text! + ".png"))),
              ),
            ),
          ),
          (occasionDetail == null)
              ? Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: Text(
                    text!,
                    style: whiteFontStyl3,
                  ),
                )
              : SizedBox(),
        ],
      ),
    );
  }
}
