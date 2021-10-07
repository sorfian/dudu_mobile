part of 'pages.dart';

class SelectOccasionPage extends StatefulWidget {
  final Function? onBackButtonPressed;
  final UserTransaction? userTransaction;
  final String? profilePicture;
  const SelectOccasionPage(
      {Key? key,
      this.onBackButtonPressed,
      this.userTransaction,
      this.profilePicture})
      : super(key: key);

  @override
  _SelectOccasionPageState createState() => _SelectOccasionPageState();
}

class _SelectOccasionPageState extends State<SelectOccasionPage> {
  @override
  Widget build(BuildContext context) {
    return GeneralPage(
      title: 'Select Occasion',
      onBackButtonPressed: widget.onBackButtonPressed,
      child: SafeArea(
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: double.infinity,
              margin: const EdgeInsets.only(top: 60),
              padding: const EdgeInsets.symmetric(vertical: 26, horizontal: 16),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                gradient: LinearGradient(
                  colors: [Color(0xff610A76), Color(0xffFF0000)],
                  begin: FractionalOffset.topLeft,
                  end: FractionalOffset.bottomRight,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    height: 120,
                    width: 120,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: NetworkImage(
                            widget.userTransaction!.talent_id!.picture_path!),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: GestureDetector(
                    onTap: () {
                      Get.to(() => SelectUserPage(
                            userTransaction: widget.userTransaction,
                          ));
                    },
                    child: (widget.profilePicture != null)
                        ? Container(
                            height: 120,
                            width: 120,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: NetworkImage(widget.profilePicture!),
                                fit: BoxFit.cover,
                              ),
                            ),
                          )
                        : Container(
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: "#CF2968".toColor(),
                            ),
                            child: const Icon(
                              MdiIcons.plus,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                SizedBox(
                  height: 150,
                ),
                generateOccasions(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Column generateOccasions() {
    List<List<String>> numberOfOccasions = [
      ['None', 'Birthday', 'Pep Talk'],
      ['Give Thanks', 'Question', 'Get Advice'],
      ['Roast', 'Anniversary', 'Gift']
    ];
    List<Widget> widgets = [];

    for (var i = 0; i < numberOfOccasions.length; i++) {
      widgets.add(
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            numberOfOccasions.length,
            (index) => Padding(
              padding: EdgeInsets.only(
                  right: index < numberOfOccasions[i].length - 1 ? 50 : 0,
                  bottom: 50),
              child: SelectableBox(
                numberOfOccasions[i][index],
                width: 80,
                height: 80,
                onTap: () {
                  Get.to(() => OccasionDetailPage(
                        userTransaction: widget.userTransaction,
                        moment: numberOfOccasions[i][index],
                        profilePicture: widget.profilePicture,
                      ));
                },
              ),
            ),
          ),
        ),
      );
    }

    return Column(children: widgets);
  }
}
