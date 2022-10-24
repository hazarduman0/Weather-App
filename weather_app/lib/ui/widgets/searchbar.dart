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
      width: size.width * 0.9,
      decoration: searchBarDecoration,
      child: Center(
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.01),
            child: Consumer(
              builder: (context, ref, child) {
                final textController = ref.watch(formControllerProvider);
                return TextFormField(
                  controller: textController.textEditingController,
                  cursorHeight: size.height * 0.04,
                  cursorColor: Colors.white,
                  style: sfPro400Weight.copyWith(fontSize: size.width * 0.05),
                  decoration: inputDecoration,
                  onChanged: (value) {
                    if (value.isEmpty || value.length == 1) {
                      textController.update();
                    }
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
