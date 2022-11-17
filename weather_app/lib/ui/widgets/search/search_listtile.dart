import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/core/constants/app_text_styles.dart';
import 'package:weather_app/core/helpers/decoration_helper.dart';
import 'package:weather_app/data/models/search.dart';
import 'package:weather_app/data/providers/provider.dart';
import 'package:weather_app/ui/widgets/detail/detail.dart';

class SearchListtile extends StatelessWidget {
  SearchListtile({super.key, required this.searchModel});

  SearchModel searchModel;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ListTile(
      title: AutoSizeText(
        '${searchModel.name}, ${searchModel.region}',
        style: sfPro500Weight.copyWith(fontSize: 20.0),
      ),
      subtitle: AutoSizeText(
        '${searchModel.country}',
        style: sfPro400Weight.copyWith(fontSize: 15.0),
      ),
      onTap: () {
        showModalBottomSheet(
          isScrollControlled: true,
          useRootNavigator: true,
          enableDrag: false,
          elevation: 5.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(size.shortestSide * 0.03),
                topRight: Radius.circular(size.shortestSide * 0.03)),
          ),
          backgroundColor: Colors.transparent,
          context: context,
          builder: (context) {
            return WeatherDetail(
                name: searchModel.name!,
                search: true,
                decoration: showModalDecoration(size),
                header: addCancelRow(context, searchModel.name!),
                height: size.height * 0.93);
          },
        );
      },
    );
  }

  Widget addCancelRow(BuildContext context, String name) => Row(
        children: [
          cancelButton(context),
          const Spacer(),
          Consumer(builder: (context, ref, child) {
            return addButton(context, ref, name);
          }),
        ],
      );

  Widget addButton(BuildContext context, WidgetRef ref, String name) =>
      TextButton(
          onPressed: () async {
            final prefs = await SharedPreferences.getInstance();
            List<String>? locations = await prefs.getStringList('locations');
            if (locations == null) {
              locations = [];
            } else {
              if (locations.contains(name)) {
                toastWidget('Already added', Toast.LENGTH_LONG);
                return;
              }
              locations.add(name);
            }

            await prefs.setStringList('locations', locations);
            await ref.watch(addedProvider.future);
            toastWidget('Added', Toast.LENGTH_SHORT);
            Navigator.pop(context);
          },
          child: const AutoSizeText('Add'));

  Widget cancelButton(BuildContext context) => TextButton(
      onPressed: () {
        Navigator.pop(context);
      },
      child: const AutoSizeText('Cancel'));

  Future<bool?> toastWidget(String text, Toast? toast) =>
      Fluttertoast.showToast(
          msg: text,
          toastLength: toast,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          textColor: Colors.white,
          fontSize: 16.0);
}
