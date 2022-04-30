
part of 'shared_widget.dart';


class LogoWidget extends StatelessWidget {
  const LogoWidget({Key? key ,required this.mainAxisAlignment}) : super(key: key);

  final MainAxisAlignment mainAxisAlignment;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(ConstantPath.getPath('Logo-img.png'))
        ),

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Welcome To ".toUpperCase(),
            style: const TextStyle(letterSpacing: 5,  color: Colors.white, fontSize: 20),
          ),
        ),
        Padding(
            padding: const EdgeInsets.all(8.0),
            child: RichText(
              text: const TextSpan(
                style: TextStyle(
                  fontSize: 22.0,
                  color: Colors.white,
                ),
                children: <TextSpan>[
                  TextSpan(
                      text: 'PONY',
                      style: TextStyle(

                          fontWeight: FontWeight.bold,
                          fontSize: 24)),
                  TextSpan(
                      text: 'COLLECTION',
                      style: TextStyle( fontSize: 24)),
                ],
              ),
            )
        ),
      ],
    );
  }
}
