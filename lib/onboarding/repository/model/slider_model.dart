import 'package:fluttertask/constants/constant_paths.dart';

class SliderModel{
   String? _image;
   String? _content;


   String get content => _content.toString();

  set content(String value) {
    _content = value;
  }

  String get image => _image.toString();

  set image(String value) {
    _image = value;
  }
}


List<SliderModel> getSlides(){
  List<SliderModel> slides = [];
  SliderModel sliderModel = SliderModel();

  sliderModel.image = ConstantPath.getPath('Bag.png');
  sliderModel.content = "Life is a succession of lessons which must be lived to be understood.";
  slides.add(sliderModel);



  sliderModel = SliderModel();
  sliderModel.image = ConstantPath.getPath("Group 137.png");
  sliderModel.content = "You come into the world with nothing, and the purpose of your life is to make something out of nothing.";
  slides.add(sliderModel);

  sliderModel = SliderModel();
  sliderModel.image = ConstantPath.getPath("Truck.png");
  sliderModel.content =" Life is what happens while you are busy making other plans.";
  slides.add(sliderModel);

  return slides;
}
