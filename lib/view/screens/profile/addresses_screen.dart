import 'package:flutter/material.dart';
import '../../../core/shared/primary_button.dart';

const Color kBg           = Color(0xFF1A1A1A);
const Color kCard         = Color(0xFF2A2A2A);
const Color kOrange       = Color(0xFFF5A623);
const Color kRed          = Color(0xFFD32F2F);
const Color kRedBorder    = Color(0xFFB71C1C);
const Color kTextPrimary  = Color(0xFFFFFFFF);
const Color kTextSecondary= Color(0xFF9E9E9E);
const Color kIconGrey     = Color(0xFF757575);


class AddressModel {
  final String id;
  String label;

  AddressModel({required this.id, required this.label});
}

// ─────────────────────────────────────────────
// Page
// ─────────────────────────────────────────────
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
      builder: (_) => Directionality(
        textDirection: TextDirection.rtl,
        child: AlertDialog(
          backgroundColor: kCard,
          title: const Text(
            'حذف العنوان',
            style: TextStyle(color: kTextPrimary),
          ),
          content: const Text(
            'هل أنت متأكد من حذف هذا العنوان؟',
            style: TextStyle(color: kTextSecondary),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text(
                'إلغاء',
                style: TextStyle(color: kTextSecondary),
              ),
            ),
            TextButton(
              onPressed: () {
                setState(() => _addresses.removeWhere((a) => a.id == id));
                Navigator.pop(context);
              },
              child: const Text('حذف', style: TextStyle(color: kRed)),
            ),
          ],
        ),
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
          backgroundColor: kCard,
          title: const Text(
            'إضافة عنوان',
            style: TextStyle(color: kTextPrimary),
          ),
          content: TextField(
            controller: ctrl,
            autofocus: true,
            style: const TextStyle(color: kTextPrimary),
            decoration: const InputDecoration(
              hintText: 'أدخل العنوان',
              hintStyle: TextStyle(color: kTextSecondary),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: kOrange),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: kOrange, width: 2),
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text(
                'إلغاء',
                style: TextStyle(color: kTextSecondary),
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
              child: const Text('إضافة', style: TextStyle(color: kOrange)),
            ),
          ],
        ),
      ),
    );
  }

  // ── Build ─────────────────────────────────────
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: kBg,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            'العناوين',
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          leading: IconButton(
              onPressed: (){
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back,size: 26,color: Colors.white,)
          ),
          centerTitle: true,
        ),
        body: Stack(
          children: [
            // ── List / Empty state ──────────────
            _addresses.isEmpty
                ? const Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.location_off,
                          color: kTextSecondary,
                          size: 64,
                        ),
                        SizedBox(height: 12),
                        Text(
                          'لا توجد عناوين مضافة',
                          style: TextStyle(color: kTextSecondary, fontSize: 16),
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
      ),
    );
  }
}

// ─────────────────────────────────────────────
// Address Card Widget
// ─────────────────────────────────────────────
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
        border: Border.all(color: kRedBorder, width: 1.5),
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
                  color: kRed,
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
                    color: kTextPrimary,
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
                    foregroundColor: kRed,
                    side: const BorderSide(color: kRed),
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
                  onPressed: (){},
                  style: OutlinedButton.styleFrom(
                    foregroundColor: kOrange,
                    side: const BorderSide(color: kOrange),
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
