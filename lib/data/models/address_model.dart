class AddressModel {
  final String id;
  final String address;
  final String? phoneNumber;
   bool isSelected;
  final double? latitude;
  final double? longitude;

  AddressModel({
    required this.id,
    required this.address,
    this.phoneNumber,
    this.isSelected = false,
    this.latitude,
    this.longitude,
  });

  AddressModel copyWith({
    String? id,
    String? address,
    String? phoneNumber,
    bool? isSelected,
    double? latitude,
    double? longitude,
  }) {
    return AddressModel(
      id: id ?? this.id,
      address: address ?? this.address,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      isSelected: isSelected ?? this.isSelected,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
    );
  }
}
