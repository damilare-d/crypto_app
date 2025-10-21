
import 'package:crypto_app/ui/common/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../common/text_styles.dart';
import '../copy_trader_detail_viewmodel.dart';

class TraderStatsSection extends StatelessWidget {
  final CopyTraderDetailViewModel vm;
  const TraderStatsSection({super.key, required this.vm});

  @override
  Widget build(BuildContext context) {
    final stats = [
      {'title': 'Average ROI', 'value': '${vm.trader['avgRoi']}%'},
      {'title': 'Win rates', 'value': '${vm.trader['winRate']}%'},
      {'title': 'Total profit', 'value': '\$${vm.trader['totalProfit']}'},
      {'title': 'Average losses', 'value': vm.trader['avgLosses']},
      {'title': 'Total trades', 'value': vm.trader['totalOrders'].toString()},
    ];
    return Column(children: [
      const SizedBox(height: 8),
      ...stats.map((s) {
        return Container(
          margin: const EdgeInsets.only(bottom: 8),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
              color: kcDarkGreyColor, borderRadius: BorderRadius.circular(10)),
          child: Row(children: [
            const Icon(Icons.bar_chart, size: 18),
            const SizedBox(width: 12),
            Expanded(
                child: Text(s['title'],
                    style: ktsBodyText.copyWith(color: kcPrimaryText))),
            Text(s['value'], style: ktsBodyText.copyWith(color: kcPrimaryText)),
          ]),
        );
      }).toList(),
    ]);
  }
}
