import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/core/constants/app_text_styles.dart';
class AddedLocation extends ConsumerWidget {
  const AddedLocation({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height,
      width: size.width,
      child: const Center(
        child: Text('Added Locations', style: sfPro400Weight),
      ),
    );
  }
}
