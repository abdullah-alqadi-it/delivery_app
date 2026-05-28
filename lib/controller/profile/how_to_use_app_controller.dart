import '../../data/models/video_model.dart';

class HowToUseAppController {
   List<VideoModel>? _cachedVideosList;

   List<VideoModel> get getVideosList {
     if(_cachedVideosList != null){
       return _cachedVideosList!;
     }
     _cachedVideosList = [
       VideoModel(
         title: 'كيفية استخدام تطبيق توصيل',
         iconPath: 'assets/icons/17.png',
         videoUrl: 'https://youtu.be/tSmpruVA8m0?si=dOYmxEqCbueAoZJx',
       ),
       VideoModel(
         title: 'معرفة العروض',
         iconPath: 'assets/icons/blmiah.png',
         videoUrl: 'https://youtube.com/shorts/5ndcp6CV9ss?feature=shared',
       ),
       VideoModel(
         title: 'معرفة دوام المطعم',
         iconPath: 'assets/icons/time_icon-1.png',
         videoUrl: 'https://youtube.com/shorts/oedO-OKSgFE?feature=shared',
       ),
       VideoModel(
         title: 'كيفية تكرار الطلبات',
         iconPath: 'assets/icons/tcrar.png',
         videoUrl: 'https://youtube.com/shorts/4HPAE06sf9k?feature=shared',
       ),
       VideoModel(
         title: 'كيفية تقييم الطلب',
         iconPath: 'assets/icons/taqiam.png',
         videoUrl: 'https://youtube.com/shorts/EIPjdtHpsG4?feature=shared',
       ),
       VideoModel(
         title: 'كيفية تغيير المنطقة',
         iconPath: 'assets/icons/Location.png',
         videoUrl: 'https://youtube.com/shorts/NDpVn2khGBw?feature=shared',
       ),
       VideoModel(
         title: 'كيفية تحديد او اضافة عنوان جديد',
         iconPath: 'assets/icons/add_city.png',
         videoUrl: 'https://youtube.com/shorts/reSp5Pmfd6Y?feature=shared',
       ),
       VideoModel(
         title: 'كيفية معرفة المطاعم القريبة',
         iconPath: 'assets/icons/meal.png',
         videoUrl: 'https://youtube.com/shorts/topthH9NT_w?feature=shared',
       ),
       VideoModel(
         title: 'شرح خدمة وصل لي(تطلب اي شئ من اي مكان)',
         iconPath: 'assets/icons/17.png',
         videoUrl: 'https://youtube.com/shorts/R-sbLLEPttw?feature=shared',
       ),
       VideoModel(
         title: 'كيفية تتبع الطلب',
         iconPath: 'assets/icons/17.png',
         videoUrl: 'https://youtube.com/shorts/rM9tLmCc5A4?feature=shared',
       ),
     ];
     return _cachedVideosList!;
   }
}
