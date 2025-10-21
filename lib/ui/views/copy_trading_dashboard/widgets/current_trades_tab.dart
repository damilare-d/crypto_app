import 'package:flutter/material.dart';

import '../../../common/app_colors.dart';
import '../../../common/text_styles.dart';

class TradesSection extends StatelessWidget {
  final String title;
  final List<Map<String, dynamic>> items;
  final void Function(Map<String, dynamic>) onTap;

  const TradesSection(
      {required this.title, required this.items, required this.onTap, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      // header with duration selector
      Row(children: [
        Text(title, style: ktsBodyText.copyWith(color: kcPrimaryText)),
        const Spacer(),
        GestureDetector(
          onTap: () => _showDurationSelector(context),
          child: Row(children: [
            Text('7d', style: ktsCaption.copyWith(color: kcSecondaryText)),
            const SizedBox(width: 8),
            const Icon(Icons.keyboard_arrow_down,
                size: 18, color: Colors.white70),
          ]),
        )
      ]),
      const SizedBox(height: 12),
      Expanded(
        child: ListView.separated(
          itemCount: items.length,
          separatorBuilder: (_, __) => const SizedBox(height: 12),
          itemBuilder: (context, idx) {
            final it = items[idx];
            return _TradeHistoryCard(item: it);
          },
        ),
      )
    ]);
  }

  void _showDurationSelector(BuildContext context) {
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
              title: const Text('7d'), onTap: () => Navigator.pop(context)),
          ListTile(
              title: const Text('30d'), onTap: () => Navigator.pop(context)),
        ]),
      ),
    );
  }
}

/// Single trade card (history/current)
class _TradeHistoryCard extends StatelessWidget {
  final Map<String, dynamic> item;
  const _TradeHistoryCard({required this.item, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final roi = item['roi'] as double;
    final pos = item['roiPositive'] as bool;
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: kcDarkGreyColor, borderRadius: BorderRadius.circular(12)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(children: [
          Text(item['pair'], style: ktsCaption.copyWith(color: kcPrimaryText)),
          const SizedBox(width: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
                color: kcGradientStart.withOpacity(0.12),
                borderRadius: BorderRadius.circular(8)),
            child: Text(item['leverage'],
                style: ktsCaption.copyWith(color: kcPrimaryText)),
          ),
          const Spacer(),
          Text('${pos ? '+' : ''}${roi.toStringAsFixed(2)}% ROI',
              style: ktsCaption.copyWith(
                  color: pos ? const Color(0xFF17B26A) : Colors.redAccent)),
        ]),
        const SizedBox(height: 8),
        const Divider(color: Colors.white12),
        const SizedBox(height: 8),
        // details rows (pro, entry/exit etc.)
        Row(children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('PRO trader',
                style: ktsCaption.copyWith(color: kcSecondaryText)),
            const SizedBox(height: 4),
            Text(item['pro']['name'],
                style: ktsBodyText.copyWith(color: kcPrimaryText)),
          ]),
          const Spacer(),
          Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
            Text('Entry', style: ktsCaption.copyWith(color: kcSecondaryText)),
            const SizedBox(height: 4),
            Text('${item['entryPrice']} USDT',
                style: ktsBodyText.copyWith(color: kcPrimaryText)),
          ]),
        ]),
        const SizedBox(height: 8),
        Row(children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('Exit', style: ktsCaption.copyWith(color: kcSecondaryText)),
            const SizedBox(height: 4),
            Text('${item['exitPrice']} USDT',
                style: ktsBodyText.copyWith(color: kcPrimaryText)),
          ]),
          const Spacer(),
          Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
            Text('Entry time',
                style: ktsCaption.copyWith(color: kcSecondaryText)),
            const SizedBox(height: 4),
            Text(item['entryTime'],
                style: ktsBodyText.copyWith(color: kcPrimaryText)),
          ]),
        ]),
      ]),
    );
  }
}
