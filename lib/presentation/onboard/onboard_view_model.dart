import 'dart:async';

import 'package:udemy/domain/model/slider_object.dart';
import 'package:udemy/presentation/base/base_view_model.dart';
import 'package:udemy/presentation/onboard/slider_view_object.dart';
import 'package:udemy/res/assets.dart';
import 'package:udemy/res/strings.dart';

class OnboardViewModel extends BaseViewModel
    with OnboardViewModelInput, OnboardViewModelOutput {
  final StreamController controller = StreamController<SliderViewObject>();
  late final List<SliderObject> _list;
  int currentIndex = 0;

  @override
  void dispose() => controller.close();

  @override
  void start() {
    _list = _getSliderData();
    _postDataToView();
  }

  @override
  int next() {
    var nextIndex = currentIndex++;
    if (nextIndex >= _list.length) currentIndex = 0;
    return currentIndex;
  }

  @override
  int previous() {
    var prefIndex = currentIndex--;
    if (prefIndex == currentIndex - 1) currentIndex = _list.length - 1;
    return currentIndex;
  }

  @override
  onPageChanged(int index) {
    currentIndex = index;
    _postDataToView();
  }

  @override
  Sink get input => controller.sink;

  @override
  Stream<SliderViewObject> get output =>
      controller.stream.map((event) => event);

  List<SliderObject> _getSliderData() => [
        SliderObject(AppStrings.onBoardingTitle1,
            AppStrings.onBoardingSubTitle1, ImageAssets.onBoardingImage1),
        SliderObject(AppStrings.onBoardingTitle2,
            AppStrings.onBoardingSubTitle2, ImageAssets.onBoardingImage2),
        SliderObject(AppStrings.onBoardingTitle3,
            AppStrings.onBoardingSubTitle3, ImageAssets.onBoardingImage3),
        SliderObject(AppStrings.onBoardingTitle4,
            AppStrings.onBoardingSubTitle4, ImageAssets.onBoardingImage4),
      ];

  _postDataToView() {
    input.add(SliderViewObject(
      _list[currentIndex],
      _list.length,
      currentIndex,
    ));
  }
}

abstract class OnboardViewModelInput {
  int next();
  int previous();
  onPageChanged(int index);

  Sink get input;
}

abstract class OnboardViewModelOutput {
  Stream<SliderViewObject> get output;
}
