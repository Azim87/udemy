import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:udemy/presentation/onboard/onboard_page.dart';
import 'package:udemy/presentation/onboard/onboard_view_model.dart';
import 'package:udemy/presentation/onboard/slider_view_object.dart';
import 'package:udemy/res/colors.dart';
import 'package:udemy/res/dimensions.dart';
import 'package:udemy/res/strings.dart';
import '../../routes.dart';

class OnboardScreen extends StatefulWidget {
  const OnboardScreen({Key? key}) : super(key: key);

  @override
  _OnboardScreenState createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  final PageController _controller = PageController(initialPage: 0);
  final OnboardViewModel _viewModel = OnboardViewModel();

  @override
  void initState() {
    init();
    super.initState();
  }

  void init() async {
    _viewModel.start();
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => StreamBuilder<SliderViewObject>(
      stream: _viewModel.output,
      builder: (context, snapshot) {
        if (snapshot.data != null) {
          return Scaffold(
            backgroundColor: ColorManager.white,
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.white,
              systemOverlayStyle: const SystemUiOverlayStyle(
                  statusBarColor: Colors.orange,
                  statusBarIconBrightness: Brightness.light),
            ),
            body: PageView.builder(
              itemCount: snapshot.data?.numberOfSlides,
              controller: _controller,
              onPageChanged: (i) => _viewModel.onPageChanged(i),
              itemBuilder: (cntx, index) =>
                  OnBoardPage(object: snapshot.data?.sliderObject),
            ),
            bottomSheet: Container(
              height: AppSize.s100,
              color: ColorManager.white,
              child: Column(
                children: [
                  Align(
                      alignment: Alignment.bottomRight,
                      child: TextButton(
                          onPressed: () =>
                              Navigator.pushNamed(context, Routes.login),
                          child: Text(
                            AppStrings.skip,
                            style: Theme.of(context).textTheme.subtitle2,
                          ))),
                  _buildBottomPageIndicate(snapshot.data),
                ],
              ),
            ),
          );
        }
        return const CircularProgressIndicator();
      });
  _buildBottomPageIndicate(SliderViewObject? data) => Container(
        color: ColorManager.primary,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: IconButton(
                  onPressed: () => _controller.animateToPage(
                        _viewModel.previous(),
                        duration: const Duration(microseconds: 300),
                        curve: Curves.bounceInOut,
                      ),
                  icon: Icon(
                    Icons.keyboard_arrow_left_outlined,
                    size: 35,
                    color: ColorManager.white,
                  )),
            ),
            Row(
              children: [
                for (int i = 0; i < (data?.numberOfSlides ?? 0); i++)
                  Padding(
                    padding: const EdgeInsets.all(AppPadding.p8),
                    child: _pageCircleIndex(i, data?.currentIndex ?? 0),
                  )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: IconButton(
                  onPressed: () => _controller.animateToPage(
                        _viewModel.next(),
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.bounceInOut,
                      ),
                  icon: Icon(
                    Icons.keyboard_arrow_right_outlined,
                    size: 35,
                    color: ColorManager.white,
                  )),
            ),
          ],
        ),
      );

  Widget _pageCircleIndex(int index, int? currentIndex) {
    if (index == currentIndex) {
      return const CircleAvatar(
        radius: 5,
        backgroundColor: Colors.green,
      );
    } else {
      return const CircleAvatar(
        radius: 5,
        backgroundColor: Colors.white,
      );
    }
  }
}
