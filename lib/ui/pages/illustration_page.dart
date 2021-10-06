part of 'pages.dart';

class IllustrationPage extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final String? picturePath;
  final String? buttonTitle1;
  final String? buttonTitle2;
  final Function? buttonTap1;
  final Function? buttonTap2;
  const IllustrationPage(
      {Key? key,
      @required this.title,
      @required this.subtitle,
      @required this.picturePath,
      @required this.buttonTitle1,
      this.buttonTitle2,
      @required this.buttonTap1,
      this.buttonTap2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 150,
          height: 150,
          margin: const EdgeInsets.only(bottom: 50),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(picturePath!),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 20),
          child: Text(
            title!,
            style: whiteFontStyl3.copyWith(fontSize: 20),
          ),
        ),
        Text(
          subtitle!,
          style: greyFontStyle.copyWith(fontWeight: FontWeight.w300),
          textAlign: TextAlign.center,
        ),
        GestureDetector(
          onTap: () {
            buttonTap1!();
          },
          child: Container(
            width: 200,
            height: 45,
            margin: const EdgeInsets.only(top: 30, bottom: 12),
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
                buttonTitle1!,
                style: whiteFontStyl3.copyWith(fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ),
        (buttonTap2 == null)
            ? SizedBox()
            : GestureDetector(
                onTap: () {
                  buttonTap2!();
                },
                child: Container(
                  width: 200,
                  height: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    gradient: const LinearGradient(
                      colors: [Color(0xffFF9600), Colors.red],
                      begin: FractionalOffset.topLeft,
                      end: FractionalOffset.bottomRight,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      buttonTitle2 ?? 'title',
                      style:
                          whiteFontStyl3.copyWith(fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ),
      ],
    ));
  }
}
