import 'package:delivery_app/core/shared/custom_button.dart';
import 'package:flutter/material.dart';
import '../../../core/constant/app_colors.dart';
import '../../../data/models/address_model.dart';

class MapAddressScreen extends StatefulWidget {
  final AddressModel? addressToEdit;

  const MapAddressScreen({super.key, this.addressToEdit});

  @override
  State<MapAddressScreen> createState() => _MapAddressScreenState();
}

class _MapAddressScreenState extends State<MapAddressScreen> {
  late TextEditingController _addressController;
  late TextEditingController _phoneController;
  String _addressHintText = 'العنوان';
  final FocusNode _addressFocus = FocusNode();
  final FocusNode _phoneFocus = FocusNode();

  bool get isEditing => widget.addressToEdit != null;

  @override
  void initState() {
    super.initState();
    _addressFocus.addListener(() {
      setState(() {
        if (_addressFocus.hasFocus) {
          _addressHintText = 'مثال: شارع هائل برج النعمان شقة 602';
        } else {
          _addressHintText = 'العنوان';
        }
      });
    });
    _addressController = TextEditingController(
      text: widget.addressToEdit?.address ?? '',
    );
    _phoneController = TextEditingController(
      text: widget.addressToEdit?.phoneNumber ?? '',
    );
  }

  @override
  void dispose() {
    _addressController.dispose();
    _phoneController.dispose();
    _addressFocus.dispose();
    _phoneFocus.dispose();
    super.dispose();
  }

  void _saveAddress() {
    if (_addressController.text.trim().isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('يرجى إدخال العنوان')));
      return;
    }

    final saved = AddressModel(
      id:
          widget.addressToEdit?.id ??
          DateTime.now().millisecondsSinceEpoch.toString(),
      address: _addressController.text.trim(),
      phoneNumber: _phoneController.text.trim().isEmpty
          ? null
          : _phoneController.text.trim(),
      isSelected: widget.addressToEdit?.isSelected ?? false,
    );

    Navigator.pop(context, saved);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.red400,
        title: Text(
          'موقعك على الخريطة',
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
          icon: Icon(Icons.arrow_back, size: 26, color: Colors.white),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.help_outline, color: Colors.white),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size(double.infinity, 65),
          child: Container(
            color: const Color(0xFFEB1E49),
            child: Container(
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.4),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: TextField(
                textAlign: TextAlign.right,
                textDirection: TextDirection.rtl,
                decoration: const InputDecoration(
                  hintText: 'البحث في الخريطة',
                  hintStyle: TextStyle(color: AppColors.gray500, fontSize: 14),
                  prefixIcon: Icon(Icons.search, color: AppColors.gray500),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 10),
                ),
              ),
            ),
          ),
        ),
      ),

      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset('assets/icons/3.jpg', fit: BoxFit.cover),
          ),

          Positioned(
            bottom: 245,
            right: 16,
            left: 16,
            child: GestureDetector(
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 30,
                      height: 30,
                      decoration: const BoxDecoration(
                        color: AppColors.red100,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.my_location,
                        color: AppColors.white,
                        size: 18,
                      ),
                    ),
                    const SizedBox(width: 6),
                    const Text(
                      'الموقع الحالي',
                      style: TextStyle(
                        color: AppColors.red100,
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          Positioned(
            bottom: 16,
            left: 16,
            right: 16,
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              padding: EdgeInsets.fromLTRB(
                16,
                16,
                16,
                16,
                // MediaQuery.of(context).viewInsets.bottom + 24,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _FormField(
                    controller: _addressController,
                    focusNode: _addressFocus,
                    hintText: _addressHintText,
                    prefixIcon: Icons.home_outlined,
                    keyboardType: TextInputType.text,
                  ),

                  const SizedBox(height: 16),

                  _FormField(
                    controller: _phoneController,
                    focusNode: _phoneFocus,
                    hintText: 'رقم التواصل (اختياري)',
                    prefixIcon: Icons.phone_outlined,
                    keyboardType: TextInputType.phone,
                  ),

                  const SizedBox(height: 18),

                  CustomButton(onPressed: _saveAddress, label: 'حفظ الموقع'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//==================================================

class _FormField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final String hintText;
  final IconData prefixIcon;
  final TextInputType keyboardType;

  const _FormField({
    required this.controller,
    required this.focusNode,
    required this.hintText,
    required this.prefixIcon,
    required this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      focusNode: focusNode,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: AppColors.black, fontSize: 14),
        prefixIcon: Icon(prefixIcon, color: AppColors.gray300, size: 22),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColors.gray500),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
      ),
    );
  }
}
