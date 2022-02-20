import 'package:email_cleaner/core/constans/icon_constans.dart';
import 'package:email_cleaner/core/init/design/color.dart';
import 'package:email_cleaner/core/init/design/text_style.dart';

import 'package:email_cleaner/feature/tabs/tabs_view.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../core/constans/text_constans.dart';

class SplashView extends StatelessWidget {
  SplashView({Key? key}) : super(key: key);
  StringConstants strings = StringConstants.instance;
  @override
  Widget build(BuildContext context) {
    String image = "assets/images/splash.png";

    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.topCenter,
          fit: StackFit.loose,
          children: [
            _splashImage(image),
            _splashFirstText(context),
            _splashSecondtext(context),
            _button(context),
          ],
        ),
      ),
    );
  }

  Positioned _button(BuildContext context) {
    return Positioned(
      bottom: 40,
      child: InkWell(
        onTap: () {
          context.navigateToPage(const TabsView());
        },
        child: Container(
            height: 40,
            width: context.dynamicWidth(0.4),
            decoration: BoxDecoration(
                color: kcHawkesBlue, borderRadius: context.lowBorderRadius),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  strings.getStarted,
                  style: bodyBoldStyle.copyWith(color: kcEbony),
                ),
                IconConstants.arrowheadRightOutline
              ],
            )),
      ),
    );
  }

  Positioned _splashSecondtext(BuildContext context) {
    return Positioned(
        top: context.dynamicHeight(0.3),
        child: SizedBox(
          width: context.dynamicWidth(0.8),
          child: Text(
            strings.splashSecond,
            style: subheadingStyle.copyWith(color: kcEbony),
            textAlign: TextAlign.center,
          ),
        ));
  }

  Positioned _splashFirstText(BuildContext context) {
    return Positioned(
        top: context.dynamicHeight(0.1),
        child: SizedBox(
          width: context.dynamicWidth(0.8),
          child: Text(
            strings.splashFirst,
            style: heading1Style.copyWith(color: kcEbony),
            textAlign: TextAlign.center,
          ),
        ));
  }

  Image _splashImage(String image) {
    return Image.asset(
      image,
      fit: BoxFit.fitWidth,
      width: double.infinity,
    );
  }
}
