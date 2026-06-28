import 'package:flutter/material.dart';
import '../../../core/constant/app_colors.dart';
import '../../../core/shared/custom_button.dart';
import '../../../data/models/address_model.dart';

class AddressCard extends StatelessWidget {
  final AddressModel address;
  final VoidCallback onEdit;
  final VoidCallback onDelete;
  final VoidCallback onTap;

  const AddressCard({
    super.key,
    required this.address,
    required this.onEdit,
    required this.onDelete, 
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        color: Colors.white,
        // elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
          side: BorderSide(
            color: address.isSelected
                ? AppColors.red300
                : AppColors.gray300,
            width: 2.0,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: address.isSelected
                          ? AppColors.red300
                          : Colors.transparent,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.location_on_outlined,
                      color: address.isSelected
                          ? AppColors.white
                          : AppColors.gray300,
                      size: 24,
                    ),
                  ),
                  const SizedBox(width: 12),
      
                  Expanded(
                    child: Text(
                      address.address,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: AppColors.gray600,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15),
              Row(
                children: [
                  if (address.phoneNumber != null) ...[
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Icon(Icons.phone_outlined, size: 24),
                        const SizedBox(width: 8),
                        Text(
                          address.phoneNumber!,
                          style: const TextStyle(fontSize: 15),
                        ),
                      ],
                    ),
                  ],
                ],
              ),
      
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: CustomButton(
                      onPressed: onEdit,
                      foregroundColor: AppColors.amber100,
                      backgroundColor: AppColors.white,
                      borderColor: AppColors.amber100,
                      borderRadius: 8,
                      height: 42,
                      label:  'تعديل',
                    ),
                  ),
                  const SizedBox(width: 12),
      
                  Expanded(
                    child: CustomButton(
                      onPressed: onDelete,
                      foregroundColor: AppColors.red300,
                      backgroundColor: AppColors.red50,
                      borderColor: AppColors.red300,
                      borderRadius: 8,
                      height: 42,
                      icon: ImageIcon(AssetImage('assets/icons/Trash.png'),size: 20,),
                      label: 'حذف',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
