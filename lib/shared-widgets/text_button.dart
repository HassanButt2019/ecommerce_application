part of 'shared_widget.dart';

class CustomTextButton extends StatelessWidget {




  const CustomTextButton({Key? key , this.text ,this.onpressed , this.background,this.foreground }) : super(key: key);
  final String? text;
  final void Function()? onpressed;
  final Color? background;
  final Color? foreground;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left:25.0,right:25),
      child: SizedBox(
        height: MediaQuery.of(context).size.height*0.07,
        width: MediaQuery.of(context).size.width*0.85,
        child: TextButton(
          onPressed:onpressed,
          child:Text(text?? "", style: const TextStyle(fontSize: 14)),
          style: ButtonStyle(
              padding:
              MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(15)),
              foregroundColor: MaterialStateProperty.all<Color>(foreground!),
              backgroundColor:
              MaterialStateProperty.all<Color>(background!),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0),
                      side: BorderSide(color: background!)))),
        ),
      ),
    );
  }
}
