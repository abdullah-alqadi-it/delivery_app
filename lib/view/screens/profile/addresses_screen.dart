import 'package:flutter/material.dart';
import '../../../controller/profile/address_controller.dart';
import '../../../core/constant/app_colors.dart';
import '../../../core/shared/custom_bottom_sheet.dart';
import '../../../core/shared/custom_button.dart';
import '../../../data/models/address_model.dart';
import '../../widgets/profile/address_card.dart';
import '../../widgets/profile/city_bottom_sheet.dart';
import 'map_address_screen.dart';

class AddressesScreen extends StatefulWidget {
  const AddressesScreen({super.key});

  @override
  State<AddressesScreen> createState() => _AddressesScreenState();
}

class _AddressesScreenState extends State<AddressesScreen> {
  final AddressController _addressController = AddressController();

  void _navigateToMapScreen({AddressModel? addressToEdit}) async {
    final result = await Navigator.push<AddressModel>(
      context,
      MaterialPageRoute(
        builder: (_) => MapAddressScreen(addressToEdit: addressToEdit),
      ),
    );

    if (result != null) {
      setState(() {
        if (addressToEdit != null) {
          // Edit address
          final index = _addressController.getAddresses.indexWhere(
            (a) => a.id == addressToEdit.id,
          );
          if (index != -1) {
            _addressController.getAddresses[index] = result;
          }
        } else {
          // Add new address
          _addressController.getAddresses.add(result);
        }
      });
    }
  }

  void _deleteAddress(String id, String address) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (_) => CustomBottomSheet(
        height: MediaQuery.of(context).size.height * 0.3,
        content: Padding(
          padding: const EdgeInsets.all(35.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'هل أنت متأكد من حذف هذا العنوان؟',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              Text(address, style: Theme.of(context).textTheme.bodyLarge),

              CustomButton(
                backgroundColor: AppColors.red600,
                label: 'حذف',
                onPressed: () {
                  setState(() {
                    _addressController.getAddresses.removeWhere(
                      (a) => a.id == id,
                    );
                  });
                  Navigator.pop(context);
                },
              ),

              CustomButton(
                backgroundColor: AppColors.amber100.withValues(alpha: 0.1),
                foregroundColor: AppColors.amber100,
                borderColor: AppColors.amber100,
                label: 'إلغاء',
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.red400,
        title: Text(
          'العناوين',
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, size: 26, color: AppColors.white),
        ),
        centerTitle: true,
      ),

      body: Column(
        children: [
          Container(
            color: AppColors.gray200,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'ادارة العناوين',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                CustomButton(
                  onPressed: () => CityBottomSheet.show(context),
                  backgroundColor: AppColors.red600,
                  borderRadius: 6,
                  height: 30,
                  width: 133,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  label: 'تغيير المدينة (صنعاء)',
                ),
              ],
            ),
          ),

          // Address list
          Expanded(
            child: _addressController.getAddresses.isEmpty
                ? Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'ليس لديك أي عناوين',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        SizedBox(height: 8),
                        CustomButton(
                          onPressed: () => _navigateToMapScreen(),
                          backgroundColor: AppColors.red600,
                          height: 35,
                          width: 105,
                          borderRadius: 4,
                          label: 'إضافة عنوان',
                        ),
                      ],
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.only(top: 12, bottom: 20),
                    itemCount: _addressController.getAddresses.length,
                    itemBuilder: (context, index) {
                      final address = _addressController.getAddresses[index];
                      return AddressCard(
                        address: address,
                        onEdit: () =>
                            _navigateToMapScreen(addressToEdit: address),
                        onDelete: () =>
                            _deleteAddress(address.id, address.address),
                        onTap: () {
                          setState(() {
                            for (var element
                                in _addressController.getAddresses) {
                              element.isSelected = (element == address);
                            }
                          });
                        },
                      );
                    },
                  ),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
            child: SizedBox(
              width: double.infinity,
              height: 52,
              child: CustomButton(
                label: 'اضافة',
                onPressed: () => _navigateToMapScreen(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
