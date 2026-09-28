import '../../data/models/address_model.dart';

class AddressController {
  List<AddressModel>?  _cachedAddresses;

  List<AddressModel> get getAddresses {
    if(_cachedAddresses != null){
      return _cachedAddresses!;
    }
    _cachedAddresses =  [
      AddressModel(id: '1', address: 'مقابل عيسى الصياد', isSelected: true),
      AddressModel(
        id: '2',
        address: 'جوار الحمادي لقطاع الدراجات النارية',
        phoneNumber: '775939490',
        isSelected: false,
      ),
    ];
    return _cachedAddresses!;
  }
}
