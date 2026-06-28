import 'package:flutter/material.dart';
import '../../../core/constant/app_colors.dart';
import '../../../core/functions/youtube_helper.dart';
import '../../../data/models/video_model.dart';

class HowToUseAppCard extends StatelessWidget {
  const HowToUseAppCard({super.key, required this.video});

  final VideoModel video;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0,right: 8,left: 8),
      child: SizedBox(
        height: 100,
        child: GestureDetector(
          onTap: () => YoutubeHelper.openVideo(video.videoUrl),
          child: Card(
            color: AppColors.white,
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  width: 90,
                  height: 90,
                  decoration: BoxDecoration(
                    color: AppColors.red400,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.all(16),
                  child: Image.asset(video.iconPath,),
                ),
                SizedBox(width: 8,),

                Expanded(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      video.title,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
