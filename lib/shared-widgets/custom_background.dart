
part of 'shared_widget.dart';

class CustomBackground extends StatelessWidget {
  const CustomBackground({Key? key ,required this.child ,this.bg}) : super(key: key);

 final Widget? child;
 final String? bg;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
        width: width + 100,
        height: height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(ConstantPath.getPath(bg??"BG.png")),
            fit: BoxFit.fill,
            colorFilter:
            ColorFilter.mode(Colors.black.withOpacity(0.2),
                BlendMode.hardLight),
          ),
        ),
      child: child,
    );
  }
}
