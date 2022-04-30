part of 'view.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);



  static Route route() =>
      MaterialPageRoute(builder: (_) =>  const SignUpScreen());

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController? _email = TextEditingController();

  final TextEditingController? _password = TextEditingController();
  final TextEditingController? _name = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: CustomBackground(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _signUpWidget(width,context),
          ],
        ),
      ),
    );
  }

  Widget _signUpWidget(double width,context) {
    void _showError(String error) {
      // Scaffold.of(context).showSnackBar(
      //     SnackBar(
      //       content: Text(error),
      //       backgroundColor: Theme.of(context).errorColor,
      //     )
      // );
    }
    return RepositoryProvider(
      create:(context)=>UserRepository(),
      child: BlocProvider(
        create: (context)=>SignUpBloc(RepositoryProvider.of<UserRepository>(context)),
        child: BlocConsumer<SignUpBloc, SignUpState>(
          listener: (context, state){
            if (state is SignUpFailure){
              _showError(state.error.toString());
            }
          },
    builder: (context, state) {
      if (state is SignUpLoading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      if(state is SignUpSuccess) {
        GeneralFunctions.navigateTo(context, OnBoardingScreen.route());
      }
      if(state is SignUpFailure) {
        _showError("Something Went Wrong");
      }
      return
      Form(
        key: _key,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  children: [
                    CustomTextField(
                      labelText: 'Name',
                      controller: _name,
                      validator: (value) {
                        if (value == null) {
                          return 'Name is required.';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 5,),
                    CustomTextField(
                      labelText: 'Email',
                      controller: _email,
                      validator: (value) {
                        if (value == null) {
                          return 'Email is required.';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 5,),
                    CustomTextField(
                      labelText: 'Password',
                      controller: _password,
                      validator: (value) {
                        if (value == null) {
                          return 'Password is required.';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10,),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                SizedBox(width: width * 0.17,),
                ClickableText(
                  ontap: () {

                    if (_key.currentState?.validate() ?? true) {
                      context.read<SignUpBloc>().add(
                          SignUpWithEmailAndPassword(
                          email: _email!.text, password: _password!.text, name: _name!.text));
                    }
                  }, label: 'SIGN UP',),
              ],
            ),

          ],
        ),
      );

    }
        ),
      ),
    );
  }


}
