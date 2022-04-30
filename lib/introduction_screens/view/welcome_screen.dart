part of 'view.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);
  static Route route() =>
      MaterialPageRoute(builder: (_) => const WelcomeScreen());

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: CustomBackground(
        bg: 'welcome_bg.png',
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 50,
            ),
            _boldText(width),
            const SizedBox(
              height: 40,
            ),
            _ligthText(width),
            const SizedBox(
              height: 40,
            ),
            optionListView(height , context)
          ],
        ),
      ),
    );
  }

  SizedBox optionListView(double height , BuildContext context) {
    return SizedBox(
            height: height * 0.50,
            child: ListView(
              children: [
                _optionTile(
                  ontap: (){
                    GeneralFunctions.navigateTo(context, HomeScreen.route());
                  },
                    icon: Icons.home_outlined,
                    title: 'Go to the Home page',
                    sub: 'Start to explore your shopping paradise'),
                const SizedBox(
                  height: 10,
                ),
                _optionTile(
                    icon: Icons.search_outlined,
                    title: 'Search your products',
                    sub: 'You can search what you need so quick'),
                const SizedBox(
                  height: 10,
                ),
                _optionTile(
                    icon: Icons.info_outlined,
                    title: 'You need the help ?',
                    sub: 'Support team can help you 24/7'),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          );
  }

  Widget _optionTile({icon, title, sub , ontap}) {
    return Container(
      margin: const EdgeInsets.only(left: 20 , right: 20),
      color: Colors.white,
      child: ListTile(
        onTap: ontap,
        tileColor: Colors.white,
        leading: Icon(
          icon,
          color: Colors.blue,
          size: 50,
        ),
        title: Text(
          title,
          style: const TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
        ),
        subtitle: Text(
          sub,
          style: TextStyle(
              color: ConstantColors.categoryHeadingColor, fontSize: 14),
        ),
      ),
    );
  }

  SizedBox _ligthText(double width) {
    return SizedBox(
        width: width * 0.90,
        child: const Text(
          "There are also country specific classified online sites like usfreeads.com for United States. There are a number of agencies throughout the world that have made a business out of the classified advertising industry. ",
          textAlign: TextAlign.start,
          textDirection: TextDirection.ltr,
          style: TextStyle(fontSize: 20, color: Colors.white),
        ));
  }

  SizedBox _boldText(double width) {
    return SizedBox(
        width: width * 0.90,
        child: const Text(
          "Welcome To Pony,\n an E-commerce App !",
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
        ));
  }
}
