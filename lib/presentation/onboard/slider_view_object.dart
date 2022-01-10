import 'package:udemy/domain/model/slider_object.dart';

class SliderViewObject {
  final SliderObject? sliderObject;
  final int? numberOfSlides;
  final int? currentIndex;

  SliderViewObject(
    this.sliderObject,
    this.numberOfSlides,
    this.currentIndex,
  );
}
