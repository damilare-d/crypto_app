import 'package:crypto_app/ui/views/copy_trading_dashboard/widgets/stats_tab.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../common/app_colors.dart';
import '../../../common/text_styles.dart';
import '../copy_trading_dashboard_viewmodel.dart';
import 'chart_tab.dart';
import 'current_trades_tab.dart';
import 'my_traders_tab.dart';

class SectionTabs extends ViewModelWidget<CopyTradingDashboardViewModel> {
  final CopyTradingDashboardViewModel vm;
  const SectionTabs({required this.vm, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, CopyTradingDashboardViewModel viewModel) {
    const labels = ['Chart', 'Current trades', 'Stats', 'My traders'];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(labels.length, (i) {
        final active = viewModel.activeTab == i;
        return Expanded(
          child: GestureDetector(
            onTap: () => viewModel.setTab(i),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 6),
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Center(
                    child: Text(labels[i],
                        overflow: TextOverflow.ellipsis,
                        style: ktsCaption.copyWith(
                            color: active ? kcPrimaryText : kcSecondaryText)),
                  ),
                ),
                Container(
                  height: 6,
                  width: 100,
                  decoration: BoxDecoration(
                    color: active
                        ? kcIconColor
                        : kcMediumGrey.withOpacity(0.04),
                    borderRadius: BorderRadius.circular(10),
                  ),
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}


class TabContent extends ViewModelWidget<CopyTradingDashboardViewModel> {
  final CopyTradingDashboardViewModel vm;
  const TabContent({required this.vm, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, CopyTradingDashboardViewModel viewModel) {
    switch (viewModel.activeTab) {
      case 0:
        return ChartSection(vm: viewModel);
      case 1:
        return TradesSection(title: 'Trading History', items: viewModel.tradingHistory, onTap: (item){});
      case 2:
        return StatsSection(vm: viewModel);
      case 3:
        return const MyTradersSection();
      default:
        return const SizedBox.shrink();
    }
  }
}