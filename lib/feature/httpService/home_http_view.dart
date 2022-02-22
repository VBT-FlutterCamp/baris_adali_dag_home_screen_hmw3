import 'package:email_cleaner/core/constans/icon_constans.dart';
import 'package:email_cleaner/core/init/design/color.dart';
import 'package:email_cleaner/core/init/design/text_style.dart';

import 'package:email_cleaner/feature/httpService/service/id_service.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import 'model/id_model.dart';

class HomeHttpView extends StatefulWidget {
  const HomeHttpView({Key? key}) : super(key: key);

  @override
  _HomeHttpViewState createState() => _HomeHttpViewState();
}

class _HomeHttpViewState extends State<HomeHttpView> {
  IdServices _idService = IdServices();
  List<IdModel>? _idModel;
  bool isLoading = false;
  bool openText = false;
  void changeLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }

  Future<void> init() async {
    _idModel = await _idService.getIds();

    changeLoading();
    //isloading=true
  }

  @override
  void initState() {
    init();
    super.initState();
  }

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
        child: isLoading
            ? ListView.builder(
                itemCount: _idModel?.length,
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
                        _idModel?[index].title ?? '',
                        style: bodyBoldStyle.copyWith(),
                      ),
                      subtitle: const Text(
                        'subtitle',
                        overflow: TextOverflow.fade,
                        maxLines: 1,
                        softWrap: false,
                      ),
                    ),
                  );
                },
              )
            : const Center(
                child: CircularProgressIndicator(),
              ));
  }

  Row subcritionRow(BuildContext context) {
    return Row(
      children: [
        Text('Subscriptions(${_idModel?.length ?? ''})',
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
