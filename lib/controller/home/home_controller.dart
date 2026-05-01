import '../../data/models/restaurant_model.dart';
import '../../data/models/category_model.dart';
import '../../data/models/banner_model.dart';

class HomeController {
  // List<CategoryModel> getCategories() {
  //   return [
  //     CategoryModel(
  //       id: '1',
  //       name: 'كل التصنيفات',
  //       iconPath: 'assets/icons/all.png',
  //       // isSelected: false,
  //     ),
  //     CategoryModel(
  //       id: '2',
  //       name: 'توصيل يُرو',
  //       iconPath: 'assets/icons/delivery_pro.png',
  //     ),
  //     CategoryModel(
  //       id: '3',
  //       name: 'وصل لي',
  //       iconPath: 'assets/icons/deliver_me.png',
  //     ),
  //     CategoryModel(
  //       id: '4',
  //       name: 'استلم بنفسك',
  //       iconPath: 'assets/icons/pickup.png',
  //     ),
  //     CategoryModel(
  //       id: '5',
  //       name: 'خضروات',
  //       iconPath: 'assets/icons/vegetables.png',
  //     ),
  //   ];
  // }

  List<BannerModel> get getBanners {
    return [
      BannerModel(
        id: '1',
        productImage: 'assets/images/h.jpg',
        imageStore: 'assets/images/girl.jpg',
        nameStore: 'ربيع الشرق',
        offers: [
          OfferModel(
            subtitle_1: 'خصم',
            subtitle_2: 'لجميع الاصناف',
            discount: '20',
          ),
        ],
      ),
      BannerModel(
        id: '2',
        productImage: 'assets/images/p.jpg',
        imageStore: 'assets/images/girl.jpg',
        nameStore: 'مطعم بيت المندي',
        offers: [
          OfferModel(
            subtitle_1: 'خصم',
            subtitle_2: 'لقسم البروست',
            discount: '30',
          ),
          OfferModel(
            subtitle_1: 'خصم',
            subtitle_2: 'لباقي الاصناف',
            discount: '20',
          ),
        ],
      ),
      BannerModel(
        id: '3',
        productImage: 'assets/images/s.jpg',
        imageStore: 'assets/images/girl.jpg',
        nameStore: 'ربيع الشرق',
        offers: [
          OfferModel(
            subtitle_1: 'خصم',
            subtitle_2: 'لجميع الاصناف',
            discount: '25',
          ),
        ],
      ),
      BannerModel(
        id: '4',
        productImage: 'assets/images/chicken-cutlet.jpg',
        imageStore: 'assets/images/girl.jpg',
        nameStore: 'مطعم بيت المندي',
        offers: [
          OfferModel(
            subtitle_1: 'خصم',
            subtitle_2: 'لقسم البروست',
            discount: '50',
          ),
        ],
      ),
    ];
  }

  List<RestaurantModel> getRestaurants() {
    return [
      RestaurantModel(
        id: '1',
        name: 'ديستا Desta (مشروع منزلي)',
        address: 'شارع تعز - جولة المرور - حي القادسية',
        category: 'المطاعم',
        imageUrl: 'assets/images/desta.png',
        rating: 2.0,
        isOpen: false,
      ),
      RestaurantModel(
        id: '2',
        name: 'توب كركدية للمشروبات الطبيعية (مشروع منزلي)',
        address: 'الدايري - جولة الضبيبي - امام بهارات ابو',
        category: 'المطاعم',
        imageUrl: 'assets/images/top.png',
        rating: 5.0,
        isOpen: false,
      ),
      RestaurantModel(
        id: '3',
        name: 'كرميلا (مشروع منزلي)',
        address: 'عصر - جوار مستشفى سبلاس - عمارة الأز',
        category: 'المطاعم',
        imageUrl: 'assets/images/karmila.png',
        rating: 3.5,
        isOpen: false,
      ),
      RestaurantModel(
        id: '4',
        name: 'طيب المذاق Tasty (مشروع منزلي)',
        address: 'صنعاء الاصبحي خلف مترو مول',
        category: 'الحلويات والعصائر والمعجنات',
        imageUrl: 'assets/images/tasty.png',
        rating: 0.0,
        isOpen: false,
      ),
      RestaurantModel(
        id: '5',
        name: 'سبراسو Sabroso (مشروع منزلي)',
        address: 'حي النهضة',
        category: 'الحلويات والعصائر والمعجنات',
        imageUrl: 'assets/images/sabroso.png',
        rating: 3.0,
        isOpen: false,
      ),
      RestaurantModel(
        id: '6',
        name: 'الصنعانية للكعك والمخبوزات (مشروع منزلي)',
        address: 'حدة - جوار عمارة الغراسي',
        category: 'الحلويات والعصائر والمعجنات',
        imageUrl: 'assets/images/sanaa_bakery.png',
        rating: 0.0,
        isOpen: false,
      ),
      RestaurantModel(
        id: '7',
        name: 'يالنجي ورق عنب (مشروع منزلي)',
        address: 'حدة المدينة جوار صالة سام',
        category: 'المطاعم',
        imageUrl: 'assets/images/yalnagi.png',
        rating: 5.0,
        isOpen: false,
      ),
      RestaurantModel(
        id: '8',
        name: 'لغة عنب (مشروع منزلي)',
        address: 'حي النهضة - خلف سوبر ماركت الأسرة',
        category: 'المطاعم',
        imageUrl: 'assets/images/lugha_enab.png',
        rating: 5.0,
        isOpen: false,
      ),
    ];
  }
}
