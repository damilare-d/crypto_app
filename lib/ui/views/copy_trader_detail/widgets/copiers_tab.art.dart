import 'package:flutter/material.dart';

import '../../../common/app_colors.dart';
import '../../../common/text_styles.dart';
import '../copy_trader_detail_viewmodel.dart';

class TraderCopiersSection extends StatelessWidget {
  final CopyTraderDetailViewModel vm;
  const TraderCopiersSection({super.key, required this.vm});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const SizedBox(height: 8),
      ...vm.copiers.map((c) {
        return Container(
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
              color: kcDarkGreyColor, borderRadius: BorderRadius.circular(12)),
          child: Row(children: [
            CircleAvatar(
                radius: 18,
                backgroundColor: kcVeryLightGrey,
                child:
                    Text(c['name'].split(' ').map((s) => s[0]).take(2).join())),
            const SizedBox(width: 12),
            Expanded(
                child: Text(c['name'],
                    style: ktsBodyText.copyWith(color: kcPrimaryText))),
            Text(c['amount'],
                style: ktsBodyText.copyWith(color: kcPrimaryText)),
          ]),
        );
      }).toList(),
      const SizedBox(height: 8),
    ]);
  }
}
