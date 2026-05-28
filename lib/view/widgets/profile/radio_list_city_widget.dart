import 'package:flutter/material.dart';
import '../../../core/constant/app_colors.dart';
import '../../../core/shared/custom_button.dart';
import '../../../core/shared/custom_radio_tile.dart';

class RadioListCityWidget extends StatefulWidget {
  const RadioListCityWidget({super.key});

  @override
  State<RadioListCityWidget> createState() => _RadioListCityWidgetState();
}

class _RadioListCityWidgetState extends State<RadioListCityWidget> {

  String selectedCity = "صنعاء";

  final List<String> cities = [
    "صنعاء",
    "عدن",
    "إب",
    "المكلا",
    "تعز - الحوبان",
    "مارب",
    "ذمار",
    "تعز - المدينة",
    "الحديدة",
  ];

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (BuildContext context, StateSetter setModalState) {
        return Container(
          margin: const EdgeInsets.all(15),
          height: MediaQuery.of(context).size.height * 0.77,

          child: Column(
            children: [
              SizedBox(height: 10,),
              Expanded(
                child: ListView.builder(
                  itemCount: cities.length,
                  itemBuilder: (context, index) {
                    return CustomRadioTile<String>(
                      title: cities[index],
                      value: cities[index],

                      groupValue: selectedCity,
                      onChanged: (value) {
                        setModalState(() {
                          selectedCity = value!;
                        });
                      },
                    );
                  },
                ),
              ),

              SizedBox(height: 30),

              // زر الإغلاق في الأسفل
              CustomButton(
                onPressed: () => Navigator.pop(context),
                backgroundColor: AppColors.red400,
                 height: 40,
                 borderRadius: 30,
                 label:  "إغلاق",
              ),
            ],
          ),
        );
      },
    );
  }
}
