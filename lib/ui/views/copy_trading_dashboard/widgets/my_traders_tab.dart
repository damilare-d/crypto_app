import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../common/app_colors.dart';
import '../../../common/text_styles.dart';
import '../copy_trading_dashboard_viewmodel.dart';

class MyTradersSection extends ViewModelWidget<CopyTradingDashboardViewModel> {
  const MyTradersSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, CopyTradingDashboardViewModel viewModel) {
    return Column(children: [
      // search
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
            color: kcMediumGrey.withOpacity(0.06),
            borderRadius: BorderRadius.circular(10)),
        child: Row(children: [
          Expanded(
            child: TextField(
              onChanged: viewModel.updateTraderQuery,
              style: ktsBodyText.copyWith(color: kcPrimaryText),
              decoration: InputDecoration(
                hintText: 'Search for PRO traders',
                hintStyle: ktsCaption.copyWith(color: kcSecondaryText),
                border: InputBorder.none,
              ),
            ),
          ),
          const Icon(Icons.search, color: Colors.white70),
        ]),
      ),
      const SizedBox(height: 12),
      Expanded(
        child: ListView.separated(
          itemCount: viewModel.filteredTraders.length,
          separatorBuilder: (_, __) => const SizedBox(height: 12),
          itemBuilder: (context, i) {
            final t = viewModel.filteredTraders[i];
            return _ProTraderRow(trader: t);
          },
        ),
      )
    ]);
  }
}

class _ProTraderRow extends StatelessWidget {
  final Map<String, dynamic> trader;
  const _ProTraderRow({required this.trader, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: kcDarkGreyColor, borderRadius: BorderRadius.circular(10)),
      child: Row(children: [
        Row(children: [
          CircleAvatar(
              radius: 20,
              backgroundColor: kcVeryLightGrey,
              child: Text(
                  trader['name'].split(' ').map((s) => s[0]).take(2).join())),
          const SizedBox(width: 12),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(trader['name'],
                style: ktsBodyText.copyWith(color: kcPrimaryText)),
            const SizedBox(height: 4),
            Text('Total volume',
                style: ktsCaption.copyWith(color: kcSecondaryText)),
            Text(trader['volume'],
                style: ktsBodyText.copyWith(color: kcPrimaryText)),
          ]),
        ]),
        const Spacer(),
        Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
          Text('Trading profit',
              style: ktsCaption.copyWith(color: kcSecondaryText)),
          Text(trader['profit'],
              style: ktsBodyText.copyWith(color: kcPrimaryText)),
        ]),
      ]),
    );
  }
}
