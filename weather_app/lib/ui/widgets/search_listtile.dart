import 'dart:developer';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/core/constants/app_colors.dart';
import 'package:weather_app/core/constants/app_text_styles.dart';
import 'package:weather_app/core/helpers/decoration_helper.dart';
import 'package:weather_app/core/helpers/helper.dart';
import 'package:weather_app/core/helpers/icon_helper.dart';
import 'package:weather_app/data/models/search.dart';
import 'package:weather_app/data/providers/providers.dart';
import 'package:weather_app/ui/widgets/hourly_forecast_widget.dart';
import 'package:weather_app/ui/widgets/uv_index_widget.dart';
import 'package:weather_app/ui/widgets/weekly_listtile_widget.dart';

class SearchListtile extends StatelessWidget {
  SearchListtile({super.key, required this.searchModel});

  SearchModel searchModel;

  @override
  Widget build(BuildContext context) {
    log('listtile çalıştı');
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
            return Container(
              height: size.height * 0.93,
              width: double.infinity,
              decoration: showModalDecoration(size),
              child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: size.shortestSide * 0.02),
                child: Column(
                  children: [
                    Row(
                      children: [
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: AutoSizeText('Cancel')),
                        const Spacer(),
                        TextButton(onPressed: () {}, child: AutoSizeText('Add'))
                      ],
                    ),
                    Expanded(
                      child: CustomScrollView(
                        physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                        slivers: [
                          SliverAppBar(
                            centerTitle: true,
                            title: titleWidget,
                            toolbarHeight: size.height * 0.2,
                            backgroundColor: Colors.transparent,
                            automaticallyImplyLeading: false,
                          ),
                          SliverAppBar(
                            automaticallyImplyLeading: false,
                            toolbarHeight: size.height * 0.18,
                            pinned: true,
                            backgroundColor: solidColor5,
                            title: const HourlyForecastWidget(),
                          ),
                          SliverList(
                              delegate: SliverChildBuilderDelegate(
                            childCount: 7,
                            (context, index) {
                              return WeeklyListtileWidget(
                                  day: 'Monday',
                                  weatherCondition:
                                      weatherIconAssetPath('clear-day'),
                                  maxTemp: 26,
                                  minTemp: 23);
                            },
                          )),
                          SliverToBoxAdapter(
                            child: Column(
                              children: [
                                conta(size),
                                conta(size),
                                conta(size),
                                conta(size),
                                conta(size),
                                conta(size),
                                conta(size),
                                conta(size),
                                conta(size),
                                conta(size)
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  //TODO: Temp providerler oluştur autodisposeli verileri ekrana bas
  //TODO: Bottomsheetteki hourlyforecastı  ve weeklyforecastı ya özelleştir ya da widgetin ortak kullanılabilir olmasını sağla
  //TODO: Bottomsheete diğer bilgilerin eklenmesini sağla
  //TODO: Eklenmiş olan bölgenin namesini shared preferenceye kaydolmasını sağla
  //TODO: Uygulama çalışırken override işlemini yap sp deki verileri al
  //TODO: SP deki verileri ikinci sayfaya uyarla
  //TODO: Weather widgetine tıklandığında gidilecek detay sayfasını oluştur
  //TODO: Weather widgetlerin sürüklenebilir olmasını düşün
  //TODO: Panel sayfasında wrap paddingini azalt ve responsive olmasını sağla
  //TODO: Konumdaki şehir isminden apiye istek atılmasını sağla

  Widget conta(Size size) => Container(
        height: size.height * 0.1,
        width: size.width,
        decoration: BoxDecoration(
            color: Colors.red,
            border: Border.all(color: solidColor5, width: 5.0)),
      );

  Widget get titleWidget => Column(
        children: [
          AutoSizeText('Osmangazi',
              style: sfPro500Weight.copyWith(fontSize: 30.0)),
          AutoSizeText('Açık', style: sfPro500Weight.copyWith(fontSize: 15.0)),
          AutoSizeText('12 C', style: sfPro500Weight.copyWith(fontSize: 35.0)),
          AutoSizeText('Y:22 D:7',
              style: sfPro500Weight.copyWith(fontSize: 15.0))
        ],
      );

  Widget secondView(Size size) => Consumer(builder: (context, ref, child) {
        final weeklyForecast = ref.watch(weeklyForecastProvider);
        final length = weeklyForecast!.length;
        return ListView.separated(
            itemCount: length,
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) {
              return WeeklyListtileWidget(
                  day: dayOfWeek(weeklyForecast[index].keys.first),
                  weatherCondition: dayIconPath(conditionFormat(
                      weeklyForecast[index].values.first.condition!.text!))!,
                  maxTemp: weeklyForecast[index].values.first.maxtempC!.floor(),
                  minTemp:
                      weeklyForecast[index].values.first.mintempC!.floor());
            },
            separatorBuilder: (context, index) {
              return Divider(
                color: Colors.blueGrey,
                thickness: 0.6,
                height: 1.0,
                indent: size.width * 0.03,
                endIndent: size.width * 0.03,
              );
            });
      });
}
