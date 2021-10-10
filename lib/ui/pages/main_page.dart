part of 'pages.dart';

class MainPage extends StatefulWidget {
  final int? initialPage;

  const MainPage({Key? key, this.initialPage = 0}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedPage = 0;
  PageController? pageController;
  User? user;

  @override
  void initState() {
    super.initState();
    selectedPage = widget.initialPage!;
    pageController = PageController(initialPage: widget.initialPage!);
  }

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
            child: PageView(
              controller: pageController,
              onPageChanged: (index) {
                setState(() {
                  selectedPage = index;
                });
              },
              children: const [
                Center(
                  child: TalentPage(),
                ),
                Center(
                  child: OrderHistoryPage(),
                ),
                Center(
                  child: ProfilePage(),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: CustomBottomNavBar(
              selectedIndex: selectedPage,
              onTap: (index) {
                setState(() {
                  selectedPage = index;
                });
                pageController!.jumpToPage(selectedPage);
              },
            ),
          )
        ],
      ),
    );
  }
}
