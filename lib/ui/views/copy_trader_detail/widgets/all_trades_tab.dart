
import 'package:flutter/material.dart';

import '../../../common/app_colors.dart';
import '../../../common/text_styles.dart';
import '../copy_trader_detail_viewmodel.dart';


class TraderAllTradesSection extends StatelessWidget {
  final CopyTraderDetailViewModel vm;
  const TraderAllTradesSection({super.key, required this.vm});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      // toggle current/history + duration
      Row(children: [
        Row(children: [
          GestureDetector(
            onTap: () => vm.setTradesMode(0),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: vm.tradesMode == 0
                    ? kcGradientStart.withOpacity(0.12)
                    : kcMediumGrey.withOpacity(0.04),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text('Current',
                  style: ktsCaption.copyWith(
                      color: vm.tradesMode == 0
                          ? kcPrimaryText
                          : kcSecondaryText)),
            ),
          ),
          const SizedBox(width: 8),
          GestureDetector(
            onTap: () => vm.setTradesMode(1),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: vm.tradesMode == 1
                    ? kcGradientStart.withOpacity(0.12)
                    : kcMediumGrey.withOpacity(0.04),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text('History',
                  style: ktsCaption.copyWith(
                      color: vm.tradesMode == 1
                          ? kcPrimaryText
                          : kcSecondaryText)),
            ),
          ),
        ]),
        const Spacer(),
        GestureDetector(
          onTap: () => _showDurationSheet(context, vm),
          child: Row(children: [
            Text(vm.duration,
                style: ktsCaption.copyWith(color: kcSecondaryText)),
            const SizedBox(width: 6),
            const Icon(Icons.keyboard_arrow_down, size: 16),
          ]),
        )
      ]),
      const SizedBox(height: 12),
      // list
      ..._buildTradesList(vm),
    ]);
  }

  List<Widget> _buildTradesList(CopyTraderDetailViewModel vm) {
    final items = vm.tradesMode == 0 ? vm.currentTrades : vm.tradesHistory;
    return items.map((item) {
      final pos = item['roiPositive'] as bool? ?? true;
      return Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
            color: kcDarkGreyColor, borderRadius: BorderRadius.circular(12)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(children: [
            Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: kcVeryLightGrey,
                    borderRadius: BorderRadius.circular(8)),
                child: Text(item['pair'],
                    style: ktsCaption.copyWith(color: kcDarkGreyColor))),
            const SizedBox(width: 8),
            Text(item['pair'],
                style: ktsCaption.copyWith(color: kcPrimaryText)),
            const SizedBox(width: 8),
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                    color: kcGradientStart.withOpacity(0.12),
                    borderRadius: BorderRadius.circular(8)),
                child: Text(item['leverage'],
                    style: ktsCaption.copyWith(color: kcPrimaryText))),
            const Spacer(),
            Text(
                '${pos ? '+' : ''}${(item['roi'] as double).toStringAsFixed(2)}% ROI',
                style: ktsCaption.copyWith(
                    color: pos ? const Color(0xFF17B26A) : Colors.redAccent)),
          ]),
          const SizedBox(height: 8),
          const Divider(color: Colors.white12),
          const SizedBox(height: 8),
          Row(children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('Entry Price',
                  style: ktsCaption.copyWith(color: kcSecondaryText)),
              const SizedBox(height: 4),
              Text('${item['entryPrice']} USDT',
                  style: ktsBodyText.copyWith(color: kcPrimaryText)),
            ]),
            const Spacer(),
            Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
              Text('Entry time',
                  style: ktsCaption.copyWith(color: kcSecondaryText)),
              const SizedBox(height: 4),
              Text(item['entryTime'] ?? '--',
                  style: ktsBodyText.copyWith(color: kcPrimaryText)),
            ]),
          ]),
          if (item.containsKey('exitPrice')) ...[
            const SizedBox(height: 8),
            Row(children: [
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text('Exit Price',
                    style: ktsCaption.copyWith(color: kcSecondaryText)),
                const SizedBox(height: 4),
                Text('${item['exitPrice']} USDT',
                    style: ktsBodyText.copyWith(color: kcPrimaryText)),
              ]),
              const Spacer(),
              Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                Text('Exit time',
                    style: ktsCaption.copyWith(color: kcSecondaryText)),
                const SizedBox(height: 4),
                Text(item['exitTime'] ?? '--',
                    style: ktsBodyText.copyWith(color: kcPrimaryText)),
              ]),
            ]),
          ],
        ]),
      );
    }).toList();
  }

  void _showDurationSheet(BuildContext context, CopyTraderDetailViewModel vm) {
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
                vm.setDuration('7d');
                Navigator.pop(context);
              }),
          ListTile(
              title: const Text('30d'),
              onTap: () {
                vm.setDuration('30d');
                Navigator.pop(context);
              }),
          ListTile(
              title: const Text('90d'),
              onTap: () {
                vm.setDuration('90d');
                Navigator.pop(context);
              }),
        ]),
      ),
    );
  }
}