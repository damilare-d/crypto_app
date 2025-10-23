import 'package:crypto_app/ui/views/copy_trader_detail/widgets/all_trades_tab.dart';
import 'package:crypto_app/ui/views/copy_trader_detail/widgets/charts_tab.dart';
import 'package:crypto_app/ui/views/copy_trader_detail/widgets/copiers_tab.art.dart';
import 'package:crypto_app/ui/views/copy_trader_detail/widgets/stats_tab.dart';
import 'package:crypto_app/ui/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'copy_trader_detail_viewmodel.dart';
import '../../common/app_colors.dart';
import '../../common/text_styles.dart';

class CopyTraderDetailView extends StackedView<CopyTraderDetailViewModel> {
  const CopyTraderDetailView({Key? key}) : super(key: key);

  @override
  Widget builder(
      BuildContext context, CopyTraderDetailViewModel vm, Widget? child) {
    // fixed height of bottom action button to pad scrolling area
    const bottomActionHeight = 70.0;

    return Scaffold(
      backgroundColor: kcBackgroundColor,
      appBar: AppBar(
        backgroundColor: kcDarkGreyColor,
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: true,
        title: Text('Trading details',
            style: ktsBodyText.copyWith(color: kcPrimaryText)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          color: kcPrimaryText,
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            // Main scrollable content
            SingleChildScrollView(
              padding: const EdgeInsets.only(bottom: bottomActionHeight + 24),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Trader header
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundColor: kcVeryLightGrey,
                            child: Text(
                              vm.trader['name']
                                  .split(' ')
                                  .map((s) => s[0])
                                  .take(2)
                                  .join(),
                              style:
                                  ktsBodyText.copyWith(color: kcDarkGreyColor),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(vm.trader['name'],
                                      style: ktsBodyText.copyWith(
                                          color: kcPrimaryText)),
                                  const SizedBox(height: 6),
                                  Row(children: [
                                    const Icon(Icons.people,
                                        size: 14, color: kcActiveIconColor),
                                    const SizedBox(width: 6),
                                    Text('${vm.trader['followers']} copiers',
                                        style: ktsCaption.copyWith(
                                            color: kcActiveIconColor)),
                                  ]),
                                ]),
                          ),
                        ],
                      ),

                      const SizedBox(height: 16),

                      // three stats row
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                            color: kcMediumGrey.withOpacity(0.06),
                            borderRadius: BorderRadius.circular(12)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _StatItem(
                                label: 'Trading days',
                                value: '${vm.trader['tradingDays']}'),
                            _StatItem(
                                label: 'Profit share',
                                value: vm.trader['profitShare']),
                            _StatItem(
                                label: 'Total orders',
                                value: '${vm.trader['totalOrders']}'),
                          ],
                        ),
                      ),

                      const SizedBox(height: 16),

                      // Certified PROtrader card
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(14),
                        decoration: BoxDecoration(
                            color: kcDarkGreyColor,
                            borderRadius: BorderRadius.circular(12)),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Certified PROtrader',
                                  style: ktsBodyText.copyWith(
                                      color: kcPrimaryText)),
                              const SizedBox(height: 12),
                              const Row(children: [
                                _Badge(
                                  icon: Icons.check_circle,
                                  label: 'High win rate',
                                  bgColor: Color(0xFF17B26A),
                                  textColor: Colors.white,
                                ),
                                SizedBox(width: 12),
                                _Badge(
                                  icon: Icons.shield,
                                  label: 'Great risk control',
                                  bgColor: Color(0xFFF79009),
                                  textColor: Colors.white,
                                ),
                              ]),
                            ]),
                      ),

                      const SizedBox(height: 16),

                      // Sections tabs
                      _DetailTabs(vm: vm),

                      const SizedBox(height: 12),

                      // Content for active tab
                      Builder(builder: (context) {
                        switch (vm.activeTab) {
                          case 0:
                            return TraderChartSection(
                                data: vm.chartData,
                                duration: vm.duration,
                                onDurationTap: () =>
                                    _showDurationSheet(context, vm));
                          case 1:
                            return TraderStatsSection(vm: vm);
                          case 2:
                            return TraderAllTradesSection(vm: vm);
                          case 3:
                            return TraderCopiersSection(vm: vm);
                          default:
                            return const SizedBox.shrink();
                        }
                      }),
                    ]),
              ),
            ),

            // Sticky bottom action button (above content)
            Positioned(
              bottom: 12,
              left: 16,
              right: 16,
              child: CustomButton(
                  onPrimaryPressed: () {
                    vm.showBottomSheet();
                  },
                  buttonText: 'Copy Trade'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  CopyTraderDetailViewModel viewModelBuilder(BuildContext context) =>
      CopyTraderDetailViewModel();

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

/// small helper widgets

class _StatItem extends StatelessWidget {
  final String label;
  final String value;
  const _StatItem({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(value, style: ktsCaption.copyWith(color: kcSecondaryText)),
      const SizedBox(width: 6),
      Text(label, style: ktsCaption.copyWith(color: kcSecondaryText)),
    ]);
  }
}

class _Badge extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color bgColor;
  final Color textColor;
  const _Badge(
      {required this.icon,
      required this.label,
      required this.bgColor,
      required this.textColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: bgColor.withOpacity(0.12),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(children: [
        CircleAvatar(
            radius: 14,
            backgroundColor: bgColor.withOpacity(0.16),
            child: Icon(icon, size: 16, color: bgColor)),
        const SizedBox(width: 8),
        Text(label, style: ktsCaption.copyWith(color: kcPrimaryText)),
      ]),
    );
  }
}

/// Tabs widget
class _DetailTabs extends ViewModelWidget<CopyTraderDetailViewModel> {
  final CopyTraderDetailViewModel vm;
  const _DetailTabs({required this.vm, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, CopyTraderDetailViewModel viewModel) {
    const labels = ['Chart', 'Stats', 'All Trades', 'Copiers'];
    return Row(
      children: List.generate(labels.length, (i) {
        final active = viewModel.activeTab == i;
        return Expanded(
          child: GestureDetector(
            onTap: () => viewModel.setTab(i),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 8),
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Center(
                      child: Text(labels[i],
                          style: ktsCaption.copyWith(
                              color:
                                  active ? kcPrimaryText : kcSecondaryText))),
                ),
                Container(
                    height: 6,
                    width: 100,
                    decoration: BoxDecoration(
                      color:
                          active ? kcIconColor : kcMediumGrey.withOpacity(0.04),
                      borderRadius: BorderRadius.circular(10),
                    ))
              ],
            ),
          ),
        );
      }),
    );
  }
}
