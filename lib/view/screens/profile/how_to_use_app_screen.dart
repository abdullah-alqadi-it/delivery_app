import 'package:flutter/material.dart';
import '../../../core/constant/app_colors.dart';
import '../../../data/models/video_model.dart';
import '../../widgets/profile/how_to_use_app_card.dart';

class HowToUseAppScreen extends StatelessWidget {
  const HowToUseAppScreen({super.key, required this.listVideo});

  final List<VideoModel> listVideo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.gray200,
      appBar: AppBar(
        backgroundColor: AppColors.red400,
        centerTitle: true,
        title: Text(
          'كيفية استخدام التطبيق',
          style: TextStyle(color: AppColors.white),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, size: 26, color: AppColors.white),
        ),
        actions: [
          IconButton(
            icon: ImageIcon(
              AssetImage('assets/icons/export.png'),
              size: 20,
              color: AppColors.white,
            ),
            onPressed: () {},
          ),
        ],
        // toolbarHeight: 65,
      ),

      body: ListView.builder(
        itemCount: listVideo.length,
        itemBuilder: (_, index) {
          return HowToUseAppCard(video: listVideo[index]);
        },
      ),
    );
  }
}
