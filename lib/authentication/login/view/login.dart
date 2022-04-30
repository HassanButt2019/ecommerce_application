part of 'view.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  static Route route() =>
      MaterialPageRoute(builder: (_) => const LoginScreen());

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController? _email = TextEditingController();
  final TextEditingController? _password = TextEditingController();
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
            _loginWidget(width ,context),
          ],
        ),
      ),
    );
  }

  Widget _loginWidget(double width ,BuildContext context) {
    void _showError(String error) {
      Scaffold.of(context).showSnackBar(
          SnackBar(
            content: Text(error),
            backgroundColor: Theme.of(context).errorColor,
          )
      );
    }


    return RepositoryProvider(
      create:(context)=>UserRepository(),
      child: BlocProvider(
        create: (context)=>LoginBloc(RepositoryProvider.of<UserRepository>(context)),
        child: BlocConsumer<LoginBloc, LoginState>(
            listener: (context, state){
              if (state is LoginFailure){
                _showError(state.error.toString());
              }
            },

            builder: (context, state) {
          if (state is LoginLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if(state is LoginSuccess) {

            GeneralFunctions.navigateTo(context, OnBoardingScreen.route());
          }
          if(state is LoginFailure) {
            _showError("Something Went Wrong");
          }
          return Form(
           key: _key,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      children: [
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
                        const SizedBox(
                          height: 5,
                        ),
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
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: width * 0.17,
                    ),
                    ClickableText(
                      ontap:(){
                        if (_key.currentState?.validate() ?? true) {
                          context.read<LoginBloc>().add(LogInWithEmailAndPassword(
                              email: _email!.text, password: _password!.text));
                        }

                      },
                      label: 'LOGIN IN NOW',
                    ),
                  ],
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
