part of 'view.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool selected = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 500)).then((onValue) {
      selected = true;
      setState(() {});
    });

    Future.delayed(const Duration(milliseconds: 3500)).then((onValue) async{
      String? val = await storage.read(key: 'isLogin');
      if(val == "true") {
        GeneralFunctions.navigateTo(context, HomeScreen.route());
      }else{
        GeneralFunctions.navigateTo(context, FirstScreen.route());

      }

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomBackground(
        child: AnimatedOpacity(
          duration: const Duration(milliseconds: 800),
          opacity: selected ? 1 : 0,
          child: const LogoWidget(
            mainAxisAlignment: MainAxisAlignment.center,
          ),
        ),
      ),
    );
  }
}
