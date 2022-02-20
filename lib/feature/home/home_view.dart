import 'package:email_cleaner/core/constans/icon_constans.dart';
import 'package:email_cleaner/core/init/design/color.dart';
import 'package:email_cleaner/core/init/design/text_style.dart';
import 'package:email_cleaner/feature/home/models/home_models.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kcEbony,
      body: Container(
        padding: context.horizontalPaddingNormal,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: context.dynamicHeight(0.1),
            ),
            keepUpText(context),
            SizedBox(
              height: context.dynamicHeight(0.01),
            ),
            subcritionRow(context),
            homeListView()
          ],
        ),
      ),
    );
  }

  Expanded homeListView() {
    return Expanded(
      child: ListView.builder(
        itemCount: contents.length,
        itemBuilder: (context, index) {
          return Container(
            margin: context.verticalPaddingLow,
            decoration: BoxDecoration(
              borderRadius: context.lowBorderRadius,
              color: kcWhite,
            ),
            child: ListTile(
              trailing: Container(
                  decoration: BoxDecoration(
                      color: kcHawkesBlue,
                      borderRadius: context.lowBorderRadius),
                  padding: context.paddingLow,
                  child: IconConstants.delete),
              title: Text(
                contents[index].name,
                style: bodyBoldStyle.copyWith(),
              ),
              subtitle: Text(
                contents[index].url,
                overflow: TextOverflow.fade,
                maxLines: 1,
                softWrap: false,
              ),
            ),
          );
        },
      ),
    );
  }

  Row subcritionRow(BuildContext context) {
    return Row(
      children: [
        Text('Subscriptions(${contents.length})',
            style: bodyStyle.copyWith(color: kcWhite)),
        const Spacer(),
        Container(
          decoration: BoxDecoration(
            color: kcLimedSpruce,
            borderRadius: context.lowBorderRadius,
          ),
          padding: context.paddingLow,
          child: Text(
            '25% CLEANED',
            style: bodyBoldStyle.copyWith(color: kcWhite),
          ),
        ),
      ],
    );
  }

  SizedBox keepUpText(BuildContext context) {
    return SizedBox(
      width: context.dynamicWidth(0.6),
      child: Text(
        'Keep up the carbon-free work!',
        style: headlineStyle.copyWith(color: kcWhite),
        textAlign: TextAlign.left,
      ),
    );
  }
}
