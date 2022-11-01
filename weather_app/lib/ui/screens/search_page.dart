import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/core/constants/app_colors.dart';
import 'package:weather_app/data/models/search.dart';
import 'package:weather_app/data/providers/providers.dart';
import 'package:weather_app/ui/widgets/hero_widget.dart';
import 'package:weather_app/ui/widgets/search_listtile.dart';
import 'package:weather_app/ui/widgets/searchbar.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    log('arama sayfası çalıştı');
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: solidColor2,
      body: SafeArea(
          child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Column(
            children: [
              searchArea(context, size),
              SizedBox(height: size.height * 0.05),
              searchResult(size)
            ],
          ),
        ),
      )),
    );
  }

  Widget searchArea(BuildContext context, Size size) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          HeroWidget(tag: 'search', widget: const SearchBar()),
          Consumer(
            builder: (context, ref, child) {
              final controller = ref.read(formControllerProvider);
              return IconButton(
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  onPressed: () {
                    controller.textEditingController.clear();
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.close,
                      color: Colors.white, size: size.width * 0.07));
            },
          )
        ],
      );

  Widget searchResult(Size size) => Consumer(
        builder: (context, ref, child) {
          final controller = ref.watch(formControllerProvider);
          final text = controller.textEditingController.text;
          final searchResponse = ref.watch(searchProvider(text));
          return searchResponse.map(
              data: (data) => searchResponse.value == null
                  ? const SizedBox()
                  : searchResponse.value!.isNotEmpty
                      ? Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(bottom: size.height * 0.1),
                            child: ListView.separated(
                                padding: EdgeInsets.zero,
                                physics: const BouncingScrollPhysics(
                                    parent: AlwaysScrollableScrollPhysics()),
                                itemCount: searchResponse.value!.length,
                                itemBuilder: (context, index) {
                                  return SearchListtile(
                                      searchModel:
                                          searchResponse.value![index]);
                                },
                                separatorBuilder: (context, index) {
                                  return Divider(
                                    color: Colors.blueGrey,
                                    thickness: 0.6,
                                    height: 1.0,
                                    indent: size.width * 0.03,
                                    endIndent: size.width * 0.03,
                                  );
                                }),
                          ),
                        )
                      : const SizedBox(),
              error: (error) => Center(
                    child: Text('Something went wrong. Error: $error'),
                  ),
              loading: (loading) => const SizedBox());
        },
      );

  List<Widget> searchListtiles(List<SearchModel> searchs) => List.generate(
      searchs.length, (index) => SearchListtile(searchModel: searchs[index]));
}
