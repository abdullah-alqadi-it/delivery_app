import 'package:delivery_app/view/widgets/profile/radio_list_city_widget.dart';
import 'package:flutter/material.dart';
import '../../../core/shared/custom_bottom_sheet.dart';

class CityBottomSheet {
  static void show(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (_) => CustomBottomSheet(
        // height: MediaQuery.of(context).size.height * 0.8,
        content: RadioListCityWidget(),
      ),
    );
  }
}
