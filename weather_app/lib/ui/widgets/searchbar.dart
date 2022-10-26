import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/core/constants/app_text_styles.dart';
import 'package:weather_app/core/helpers/decoration_helper.dart';
import 'package:weather_app/data/providers/providers.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.07,
      width: size.width * 0.8,
      decoration: searchBarDecoration,
      child: Center(
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.01),
            child: Consumer(
              builder: (context, ref, child) {
                return TextFormField(
                  cursorHeight: size.height * 0.04,
                  cursorColor: Colors.white,
                  style: sfPro400Weight.copyWith(fontSize: size.width * 0.05),
                  decoration: inputDecoration,
                  autofocus: true,
                  onChanged: (value) {
                    ref.read(searchProvider(value));
                  },
                );
              },
            )),
      ),
    );
  }

  InputDecoration get inputDecoration => const InputDecoration(
        prefixIcon: Icon(Icons.search, color: Colors.white),
        border: InputBorder.none,
      );
}
