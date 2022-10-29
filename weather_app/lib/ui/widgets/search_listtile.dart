import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/core/constants/app_text_styles.dart';
import 'package:weather_app/core/helpers/decoration_helper.dart';
import 'package:weather_app/data/models/search.dart';
import 'package:weather_app/ui/widgets/uv_index_widget.dart';

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
                        TextButton(onPressed: () {
                          Navigator.pop(context);
                        }, child: Text('Vazgeç')),
                        const Spacer(),
                        TextButton(onPressed: () {}, child: Text('Ekle'))
                      ],
                    ),
                    SingleChildScrollView(
                      child: Wrap(
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: Column(
                              children: [
                                AutoSizeText('Berlin',
                                    style: sfPro700Weight.copyWith(fontSize: 40)),
                                    AutoSizeText('20 C',
                                    style: sfPro700Weight.copyWith(fontSize: 40))
                              ],
                            ),
                          ),
                          SizedBox(height: size.height * 0.05),
                          UvIndexWidget(),
                          UvIndexWidget(),
                          UvIndexWidget(),
                          UvIndexWidget(),
                          UvIndexWidget()
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
}
