import 'package:delivery_app/core/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:number_to_word_arabic/number_to_word_arabic.dart';
import '../../../controller/profile/balance_controller.dart';
import '../../../core/shared/custom_radio_tile.dart';
import '../../../core/shared/custom_button.dart';

class AddBalanceScreen extends StatefulWidget {
  const AddBalanceScreen({super.key});

  @override
  State<AddBalanceScreen> createState() => _AddBalanceScreenState();
}

class _AddBalanceScreenState extends State<AddBalanceScreen> {
  final BalanceController balanceController = BalanceController();

  final TextEditingController _controller = TextEditingController();
  String _amountInWords = "";
  String selectedCity = "محفظة جيب";
  int selectedIndex = 0;
  final FocusNode _focusNode = FocusNode();
  StateSetter? setter;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      if (setter != null) {
        setter!(() {});
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  //=========================================================

  void _onConfirmPressed(BuildContext context) {
    final text = _controller.text.trim();
    if (text.isEmpty || text == '0' || text == '0.00') {
      showEmpty(context);
    } else {
      showNotEmpty(context);
    }
  }

  void showNotEmpty(BuildContext context) async {
    final TextEditingController codeController = TextEditingController();

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (ctx) {
        return StatefulBuilder(
          builder: (ctx, setDialogState) {
            setter = setDialogState;

            return Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
              backgroundColor: AppColors.white,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 24, 20, 20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadiusGeometry.circular(8),
                      child: Image.asset(
                        balanceController.getBalance[selectedIndex].image,
                        height: 50,
                        width: 50,
                        fit: BoxFit.cover,
                      ),
                    ),

                    const SizedBox(height: 20),

                    Text(
                      'قم بادخال كود الشراء المنشأ في تطبيق\n${balanceController.getBalance[selectedIndex].name} من شراء اونلاين ثم كود شراء',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        height: 1.5,
                      ),
                    ),

                    const SizedBox(height: 16),

                    TextField(
                      onTap: () {
                        setDialogState(() {});
                      },
                      onChanged: (v) {
                        setDialogState(() {});
                      },
                      controller: codeController,
                      cursorColor: AppColors.red400,
                      textAlign: TextAlign.left,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 12,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                          borderSide: const BorderSide(
                            color: AppColors.black,
                          ),
                        ),

                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                          borderSide: const BorderSide(
                            color: AppColors.red400,
                            width: 2.0,
                          ),
                        ),

                        // الأيقونة جهة اليمين
                        prefixIcon: Icon(
                          Icons.receipt_long_outlined,
                          color: _focusNode.hasFocus
                              ? AppColors.red400
                              : AppColors.gray300,
                        ),
                      ),
                    ),

                    const SizedBox(height: 30),

                    // الأزرار
                    Row(
                      children: [
                        Expanded(
                          child: CustomButton(
                            onPressed: () => Navigator.of(ctx).pop(),
                            backgroundColor: Colors.transparent,
                            foregroundColor: AppColors.red400,
                            borderColor: AppColors.red400,
                            borderRadius: 14,
                            height: 45,
                            label:  'اغلاق',
                          ),
                        ),

                        const SizedBox(width: 12),

                        Expanded(
                          child: CustomButton(
                            onPressed: () => Navigator.of(ctx).pop(),
                            backgroundColor: AppColors.red400,
                            borderRadius: 14,
                            height: 45,
                            label: 'موافق',
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15,),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  //=========================================================

  void showEmpty(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (ctx) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
          backgroundColor: AppColors.white,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(24, 32, 24, 24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.safety_divider),

                const SizedBox(height: 24),

                const Text(
                  'يجب إدخال المبلغ',
                  style: TextStyle(
                    fontSize: 17,
                    color: AppColors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),

                const SizedBox(height: 24),

                // زر اغلاق
                CustomButton(
                  onPressed: () => Navigator.of(ctx).pop(),
                  borderColor: AppColors.red400,
                  foregroundColor: AppColors.red400,
                  backgroundColor: Colors.transparent,
                  height: 42,
                  borderRadius: 13,
                  label: 'اغلاق',
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  //=========================================================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.red400,
        centerTitle: true,
        title: Text('إضافة رصيد', style: TextStyle(color: Colors.white)),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, size: 26, color: AppColors.white),
        ),
        toolbarHeight: 65,
      ),

      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            _buildTextFormField(context),
            SizedBox(height: 20),
            Text('قم باختيار وسيلة الدفع المناسبة ثم اضغط على موافق'),
            SizedBox(height: 20),

            Expanded(
              child: ListView.builder(
                itemCount: balanceController.getBalance.length,
                itemBuilder: (context, index) {
                  var item = balanceController.getBalance[index];
                  return CustomRadioTile<String>(
                    title: item.name,
                    value: item.name,
                    leadingIcon: item.image,
                    groupValue: selectedCity,
                    onChanged: (value) {
                      setState(() {
                        selectedCity = value!;
                        selectedIndex = index;
                      });
                    },
                  );
                },
              ),
            ),
            SizedBox(height: 15),
            CustomButton(
              label: 'موافق',
              onPressed: () => _onConfirmPressed(context),
            ),
          ],
        ),
      ),
    );
  }

  //========================================================

  Container _buildTextFormField(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade900),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "أضف المبلغ هنا :",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: _controller,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  // onTapOutside: (event) {
                  //   FocusManager.instance.primaryFocus?.unfocus();
                  // },
                  style: TextStyle(fontSize: 20),
                  cursorColor: AppColors.red400,
                  decoration: const InputDecoration(
                    hintText: "0.00",
                    border: InputBorder.none,
                  ),
                  onChanged: (value) {
                    setState(() {
                      if (value.isNotEmpty) {
                        // هنا تحويل الرقم إلى كلمات
                        _amountInWords = Tafqeet.convert(value);
                      } else {
                        _amountInWords = "";
                      }
                    });
                  },
                ),
              ),
              const Text(
                "ريال يمني",
                style: TextStyle(color: AppColors.black, fontSize: 16),
              ),
            ],
          ),
          if (_amountInWords.isNotEmpty)
            Text(
              _amountInWords,
              style: const TextStyle(color: AppColors.red400, fontSize: 12),
            ),
        ],
      ),
    );
  }
}
