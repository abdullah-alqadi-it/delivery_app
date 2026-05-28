import 'package:url_launcher/url_launcher.dart';

class YoutubeHelper {

  static String? convertUrlToId(String url) {
    // الروابط المختصرة
    if (url.contains("youtu.be/")) {
      return url.split("youtu.be/")[1].split("?")[0];
    }
    // روابط الفيديوهات القصيرة
    else if (url.contains("/shorts/")) {
      return url.split("/shorts/")[1].split("?")[0];
    }
    // روابط الفيديوهات العادية
    else if (url.contains("v=")) {
      return url.split("v=")[1].split("&")[0];
    }
    // في حالة عدم تطابق الرابط
    return null;
  }

  static Future<void> openVideo(String fullUrl) async {
    final Uri uri;

    // 1. تحقق أولاً إذا كان الرابط في الأصل رابط Shorts
    if (fullUrl.contains("/shorts/")) {
      // نفتح رابط الـ Shorts مباشرة بصيغته لكي يقرأه اليوتيوب كمقطع قصير
      uri = Uri.parse(fullUrl);
    } else {
      // 2. إذا كان رابط عادي أو مختصر، نستخرج الـ ID ونبني رابط الـ watch
      String? videoId = convertUrlToId(fullUrl);

      if (videoId != null) {
        uri = Uri.parse('https://www.youtube.com/watch?v=$videoId');
      }
      return; // نوقف الدالة إذا لم نجد ID للروابط العادية

    }

    // 3. تشغيل الرابط في التطبيق الخارجي (اليوتيوب)
    try {
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      }
    } catch (e){}
  }
}
