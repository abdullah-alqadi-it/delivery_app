import 'package:flutter/material.dart';
import '../../../core/shared/custom_button.dart';
import '../../screens/profile/add_balance_screen.dart';

class BalanceBottomSheet extends StatelessWidget {
  const BalanceBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        // mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 80,
            child: Card(
              color: Colors.transparent,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(color: Colors.grey),
              ),
              child: Align(
                alignment: Alignment.center,
                child: ListTile(
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        '${0} لك',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      SizedBox(width: 5),
                      Text(
                        'ريال',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                  leading: Text(
                    'الرصيد',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
              ),
            ),
          ),

          SizedBox(height: 20),
          CustomButton(
            label: 'إضافة رصيد',
            icon: Icon(Icons.add,size: 22,),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => AddBalanceScreen()),
              );
            },
          ),
          SizedBox(height: 50),
        ],
      ),
    );
  }
}
