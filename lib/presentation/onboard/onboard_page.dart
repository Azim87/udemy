import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:udemy/domain/model/slider_object.dart';
import 'package:udemy/res/dimensions.dart';

class OnBoardPage extends StatefulWidget {
  final SliderObject? object;
  const OnBoardPage({Key? key, this.object}) : super(key: key);

  @override
  _OnBoardPageState createState() => _OnBoardPageState();
}

class _OnBoardPageState extends State<OnBoardPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: AppSize.s40),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(
            widget.object?.title ?? '',
            style: Theme.of(context).textTheme.headline1,
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(
            widget.object?.subTitle ?? '',
            style: Theme.of(context).textTheme.subtitle1,
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: AppSize.s60),
        SvgPicture.asset(widget.object?.image ?? '')
      ],
    );
  }
}
