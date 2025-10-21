import 'package:flutter/material.dart';

import '../../../common/app_colors.dart';
import '../../../common/text_styles.dart';
import '../copy_trading_dashboard_viewmodel.dart';

class StatsSection extends StatelessWidget {
  final CopyTradingDashboardViewModel vm;
  const StatsSection({required this.vm, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(children: [
        Text('Trading statistics',
            style: ktsBodyText.copyWith(color: kcPrimaryText)),
        const Spacer(),
        GestureDetector(
          onTap: () => _showDuration(context),
          child: Row(children: [
            Text(vm.duration,
                style: ktsCaption.copyWith(color: kcSecondaryText)),
            const SizedBox(width: 6),
            const Icon(Icons.keyboard_arrow_down, size: 16),
          ]),
        )
      ]),
      const SizedBox(height: 12),
      Expanded(
        child: ListView(
          children: [
            ...vm.stats.map((s) {
              return Container(
                margin: const EdgeInsets.only(bottom: 8),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                    color: kcDarkGreyColor,
                    borderRadius: BorderRadius.circular(10)),
                child: Row(children: [
                  const Icon(Icons.bar_chart, size: 20),
                  const SizedBox(width: 12),
                  Expanded(
                      child: Text(s['title'],
                          style: ktsBodyText.copyWith(color: kcPrimaryText))),
                  Text(s['value'],
                      style: ktsBodyText.copyWith(color: kcPrimaryText)),
                ]),
              );
            }).toList(),
            const SizedBox(height: 12),
            Align(
                alignment: Alignment.centerLeft,
                child: Text('Trading pairs',
                    style: ktsCaption.copyWith(color: kcSecondaryText))),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: vm.tradingPairs.map((p) {
                return Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                      color: kcMediumGrey.withOpacity(0.06),
                      borderRadius: BorderRadius.circular(8)),
                  child:
                      Text(p, style: ktsCaption.copyWith(color: kcPrimaryText)),
                );
              }).toList(),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    ]);
  }

  void _showDuration(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (_) => Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
            color: kcDarkGreyColor,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          ListTile(
              title: const Text('7d'),
              onTap: () {
                vm.chooseDuration('7d');
                Navigator.pop(context);
              }),
          ListTile(
              title: const Text('30d'),
              onTap: () {
                vm.chooseDuration('30d');
                Navigator.pop(context);
              }),
          ListTile(
              title: const Text('90d'),
              onTap: () {
                vm.chooseDuration('90d');
                Navigator.pop(context);
              }),
        ]),
      ),
    );
  }
}
