import 'package:flutter/material.dart';
import '../../../core/constant/app_colors.dart';
import '../../../core/shared/primary_button.dart';

class AddressModel {
  final String id;
  String label;

  AddressModel({required this.id, required this.label});
}

// ───────────────Page──────────────────────────────
class AddressesPage extends StatefulWidget {
  const AddressesPage({super.key});

  @override
  State<AddressesPage> createState() => _AddressesPageState();
}

class _AddressesPageState extends State<AddressesPage> {
  final List<AddressModel> _addresses = [
    AddressModel(id: '1', label: 'جوار مستشفى الصداقة'),
  ];

  // ── Delete ────────────────────────────────────
  void _delete(String id) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: AppColors.kCard2,
        title: const Text(
          'حذف العنوان',
          style: TextStyle(color: AppColors.black),
        ),
        content: const Text(
          'هل أنت متأكد من حذف هذا العنوان؟',
          style: TextStyle(color: AppColors.black),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              'إلغاء',
              style: TextStyle(color: AppColors.black),
            ),
          ),
          TextButton(
            onPressed: () {
              setState(() => _addresses.removeWhere((a) => a.id == id));
              Navigator.pop(context);
            },
            child: const Text(
              'حذف',
              style: TextStyle(color: const Color(0xFFEB1E49)),
            ),
          ),
        ],
      ),
    );
  }

  // ── Edit ──────────────────────────────────────
  // void _edit(AddressModel address) {
  //   Navigator.of(
  //     context,
  //   ).push(MaterialPageRoute(builder: (_) => const EditAccountPage()));
  // }

  // ── Add ───────────────────────────────────────
  void _add() {
    final ctrl = TextEditingController();
    showDialog(
      context: context,
      builder: (_) => Directionality(
        textDirection: TextDirection.rtl,
        child: AlertDialog(
          backgroundColor: AppColors.kCard2,
          title: const Text(
            'إضافة عنوان',
            style: TextStyle(color: AppColors.black),
          ),
          content: TextField(
            controller: ctrl,
            autofocus: true,
            style: const TextStyle(color: AppColors.black),
            decoration: const InputDecoration(
              hintText: 'أدخل العنوان',
              hintStyle: TextStyle(color: AppColors.black),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: AppColors.kOrange),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: AppColors.kOrange, width: 2),
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text(
                'إلغاء',
                style: TextStyle(color: AppColors.black),
              ),
            ),
            TextButton(
              onPressed: () {
                final text = ctrl.text.trim();
                if (text.isNotEmpty) {
                  setState(
                    () => _addresses.add(
                      AddressModel(
                        id: DateTime.now().millisecondsSinceEpoch.toString(),
                        label: text,
                      ),
                    ),
                  );
                }
                Navigator.pop(context);
              },
              child: const Text(
                'إضافة',
                style: TextStyle(color: AppColors.kOrange),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ── Build ─────────────────────────────────────
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: ,
      appBar: AppBar(
        backgroundColor: const Color(0xFFEB1E49),
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
          icon: Icon(Icons.arrow_back, size: 26, color: Colors.white),
        ),
        centerTitle: true,
        toolbarHeight: 65,
      ),

      body: Stack(
        children: [
          // ── List / Empty state ──────────────
          _addresses.isEmpty
              ? Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.location_off, color: Colors.white, size: 64),
                      SizedBox(height: 12),
                      Text(
                        'لا توجد عناوين مضافة',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ],
                  ),
                )
              : ListView.separated(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 120),
                  itemCount: _addresses.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 12),
                  itemBuilder: (_, i) => _AddressCard(
                    address: _addresses[i],
                    onDelete: () => _delete(_addresses[i].id),
                    // onEdit: () => _edit(_addresses[i]),
                  ),
                ),

          // ── Add Button ───────────────────
          Positioned(
            left: 16,
            right: 16,
            bottom: 16,
            child: PrimaryButton(label: 'اضافة', onTap: _add),
          ),
        ],
      ),
    );
  }
}

// ─────────────Address Card Widget────────────────────────────────
class _AddressCard extends StatelessWidget {
  final AddressModel address;
  final VoidCallback onDelete;
  // final VoidCallback onEdit;

  const _AddressCard({
    required this.address,
    required this.onDelete,
    // required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.kRedBorder, width: 1.5),
      ),
      padding: const EdgeInsets.fromLTRB(14, 14, 14, 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // ── Label row ──────────────────────
          Row(
            children: [
              // Icon badge
              Container(
                width: 38,
                height: 38,
                decoration: const BoxDecoration(
                  color: AppColors.kRedBorder,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.location_on,
                  color: Colors.white,
                  size: 20,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  address.label,
                  textAlign: TextAlign.right,
                  style: const TextStyle(
                    color: AppColors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),

          // ── Action buttons ─────────────────
          Row(
            children: [
              // Delete
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: onDelete,
                  icon: const Icon(Icons.delete_outline, size: 18),
                  label: const Text('حذف'),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: AppColors.kRedBorder,
                    side: const BorderSide(color: AppColors.kRedBorder),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              // Edit
              Expanded(
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    foregroundColor: AppColors.kOrange,
                    side: const BorderSide(color: AppColors.kOrange),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text('تعديل', style: TextStyle(fontSize: 15)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
