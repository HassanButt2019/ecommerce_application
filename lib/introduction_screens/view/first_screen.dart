part of 'view.dart';



class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);



  static Route route() =>
      MaterialPageRoute(builder: (_) => const FirstScreen());

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<UserRepository>(
      create:(context)=>UserRepository(),
      child: Scaffold(
        body: CustomBackground(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
             const Padding(
                padding:  EdgeInsets.only(top:60.0),
                child:  LogoWidget(mainAxisAlignment: MainAxisAlignment.start),
              ),
              Column(
                children: [
                  CustomTextButton(
                    text: 'LOGIN',
                    background: Colors.blue,
                    foreground: Colors.white,
                    onpressed: (){
                      GeneralFunctions.navigateTo(context, LoginScreen.route());

                    },
                  ),
                  const SizedBox(height: 20,),
                  CustomTextButton(
                    text: 'SIGN UP',
                    background: Colors.white,
                    foreground: Colors.black,
                    onpressed: (){
                      GeneralFunctions.navigateTo(context, SignUpScreen.route());

                    },
                  ),
                  const SizedBox(height: 20,),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
