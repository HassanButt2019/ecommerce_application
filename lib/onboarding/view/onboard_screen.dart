part of 'view.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  static Route route() => MaterialPageRoute(builder: (_) => const OnBoardingScreen());

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  List<SliderModel> slides = [];
  int currentIndex = 0;
  PageController _controller = PageController();

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: 0);
    slides = getSlides();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: height * 0.25,
            decoration: BoxDecoration(
              color: const Color(0xff00adef),
              image: DecorationImage(
                image: AssetImage(ConstantPath.getPath('header.png')),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            flex: 3,
            child: PageView.builder(
                scrollDirection: Axis.horizontal,
                onPageChanged: (value) {
                  setState(() {
                    currentIndex = value;
                  });
                },
                itemCount: slides.length,
                itemBuilder: (context, index) {
                  return Slider(
                    image: slides[index].image,
                    content: slides[index].content,
                  );
                }),
          ),
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: height * 0.20,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(ConstantPath.getPath('footer1.png')),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              (currentIndex == slides.length - 1)
                  ? roundedEdgeButton(width)
                  : Container(),
              Align(
                alignment: Alignment.center,
                child: DotsIndicator(
                  dotsCount: slides.length,
                  position: currentIndex.toDouble(),
                  decorator: const DotsDecorator(
                    color: Colors.white, // Inactive color
                    activeColor: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      backgroundColor: Colors.white,
    );
  }

  Padding roundedEdgeButton(double width) {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0, right: 20),
      child: Align(
        alignment: Alignment.topRight,
        child: SizedBox(
            height: 30,
            width: width * 0.20,
            child: TextButton(
              child: Text("Skip".toUpperCase(),
                  style: const TextStyle(fontSize: 14, color: Colors.white)),
              style: ElevatedButton.styleFrom(
                primary: Colors.transparent, // Background color
                onPrimary: Colors.amber,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: const BorderSide(color: Colors.white)),
              ),
              onPressed: () {
                if (currentIndex == slides.length - 1) {
                  GeneralFunctions.navigateTo(context, WelcomeScreen.route());
                }
              },
            )),
      ),
    );
  }
}

class Slider extends StatelessWidget {
  final String? image;
  final String? content;

   const Slider({Key? key, this.image, this.content}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
            width: width * 0.70,
            child: Text(
              content ?? "",
              style: const TextStyle(color: Colors.black),
            )),
        const SizedBox(
          height: 120,
        ),
        Image(image: AssetImage(image ?? "")),
      ],
    );
  }
}
