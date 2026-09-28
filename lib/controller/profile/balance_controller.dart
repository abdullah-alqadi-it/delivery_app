import '../../data/models/balance_model.dart';

class BalanceController {
  List<BalanceModel>? _cachedBalance;

   List<BalanceModel> get getBalance {
    if(_cachedBalance != null){
      return _cachedBalance!;
    }
    _cachedBalance =  [
      BalanceModel(id: 1, name: 'محفظة جيب', image: 'assets/icons/jaib2.png'),
      BalanceModel(id: 2, name: 'جوالي', image: 'assets/icons/jawali2.png'),
      BalanceModel(id: 3,
        name: 'خدمة حاسب من بنك الكريمي للتمويل الاصغر الإسلامي',
        image: 'assets/icons/kuraimi.jpg',),
      BalanceModel(id: 4, name: ' كاش  ONE', image: 'assets/icons/cash_one.png'),
      BalanceModel(id: 5, name: 'كاش', image: 'assets/icons/cash.png'),
      BalanceModel(id: 6, name: 'بيس', image: 'assets/icons/pyes.png'),
      BalanceModel(id: 7, name: 'محفظة إيزي', image: 'assets/icons/easy.png'),
      BalanceModel(id: 8, name: 'سبأكاش', image: 'assets/icons/spa_cash.png'),
      BalanceModel(
        id: 9, name: 'محفظة شامل موني', image: 'assets/icons/shamil_money.png',),
      BalanceModel(id: 10,
        name: 'موبايل موني (رقم النقظة:996600)',
        image: 'assets/icons/mobile-money.png',),
    ];
    return _cachedBalance!;
  }
}