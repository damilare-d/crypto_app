import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../common/app_colors.dart';
import '../../../common/text_styles.dart';
import '../copy_trading_viewmodel.dart';

class MainCopyTradingView extends ViewModelWidget<CopyTradingViewModel> {
  final CopyTradingViewModel vm;
  const MainCopyTradingView({required this.vm, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, CopyTradingViewModel viewModel) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          children: [
            // two top gradient cards row
            Row(
              children: [
                Expanded(
                  child: _TopGradientCard(
                    colors: const [
                      Color(0xFFABE2F3),
                      Color(0xFFBDE4E5),
                      Color(0xFFEBE9D0)
                    ],
                    icon: Icons.computer,
                    title: 'My Dashboard',
                    subtitle: 'View Trades',
                    onTap: () => vm.navigateToCopyTrdngDb(),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _TopGradientCard(
                    colors: const [
                      Color(0xFFC0CFFE),
                      Color(0xFFF3DFF4),
                      Color(0xFFF9D8E5)
                    ],
                    icon: Icons.workspace_premium,
                    title: 'Become a PRO trader',
                    subtitle: 'Apply Now',
                    onTap: () {
                      // apply now
                    },
                  ),
                ),
              ],
            ),

            const SizedBox(height: 18),
            Align(
              alignment: Alignment.centerLeft,
              child: Text('PRO Traders',
                  style: ktsBodyText.copyWith(color: kcPrimaryText)),
            ),
            const SizedBox(height: 12),

            // list of pro traders
            Expanded(
              child: ListView.separated(
                itemCount: viewModel.proTraders.length,
                separatorBuilder: (_, __) => const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  final t = viewModel.proTraders[index];
                  return _ProTraderCard(
                    name: t['name'],
                    followers: t['followers'],
                    roi: t['roi'],
                    pnl: t['pnl'],
                    winRate: t['winRate'],
                    onCopy: () => viewModel.onCopyTrader(index),
                    onTap: () => viewModel.navgateToCopyTraderDetail(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TopGradientCard extends StatelessWidget {
  final List<Color> colors;
  final IconData icon;
  final String title;
  final String subtitle;
  final void Function()? onTap;

  const _TopGradientCard({
    required this.colors,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 120,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: colors,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 18,
              backgroundColor: Colors.white.withOpacity(0.18),
              child: Icon(icon, color: Colors.black),
            ),
            const Spacer(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        overflow: TextOverflow.ellipsis,
                        style: ktsBodyText.copyWith(color: Colors.black),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        subtitle,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: ktsCaption.copyWith(color: Colors.black),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 6),
                const Icon(Icons.arrow_forward_ios, size: 14),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _ProTraderCard extends StatelessWidget {
  final String name;
  final int followers;
  final double roi;
  final double pnl;
  final int winRate;
  final VoidCallback onCopy;
  final VoidCallback onTap;

  const _ProTraderCard({
    required this.name,
    required this.followers,
    required this.roi,
    required this.pnl,
    required this.winRate,
    required this.onCopy,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    const bg = kcDarkGreyColor;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 20,
                      backgroundColor: kcVeryLightGrey,
                      child: Text(
                          name.split(' ').map((s) => s[0]).take(2).join(),
                          style: ktsBodyText.copyWith(color: kcDarkGreyColor)),
                    ),
                    const SizedBox(width: 12),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(name,
                              style:
                                  ktsBodyText.copyWith(color: kcPrimaryText)),
                          const SizedBox(height: 4),
                          Row(children: [
                            const Icon(Icons.people,
                                size: 14, color: kcActiveIconColor),
                            const SizedBox(width: 6),
                            Text('$followers followers',
                                style: ktsCaption.copyWith(
                                    color: kcActiveIconColor)),
                          ])
                        ])
                  ],
                ),
                GestureDetector(
                  onTap: onCopy,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      color: kcMediumGrey.withOpacity(0.08),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(children: [
                      const Icon(Icons.copy, size: 16, color: kcPrimaryText),
                      const SizedBox(width: 8),
                      Text('Copy',
                          style: ktsCaption.copyWith(color: kcPrimaryText)),
                    ]),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),

            // middle row: ROI and graph placeholder
            Row(
              children: [
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text('ROI',
                      style: ktsCaption.copyWith(color: kcSecondaryText)),
                  const SizedBox(height: 6),
                  Text('${roi.toStringAsFixed(2)}%',
                      style:
                          ktsBodyText.copyWith(color: const Color(0xFF17B26A))),
                  const SizedBox(height: 6),
                  Text('Total PNL: \$${pnl.toStringAsFixed(2)}',
                      style: ktsCaption.copyWith(color: kcSecondaryText)),
                ]),
                const Spacer(),
                Container(
                  width: 90,
                  height: 50,
                  decoration: BoxDecoration(
                    color: kcMediumGrey.withOpacity(0.06),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Center(child: Icon(Icons.show_chart)),
                ),
              ],
            ),

            const SizedBox(height: 12),
            // bottom row: win rate and AUM
            Container(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
              decoration: BoxDecoration(
                color: kcDarkGreyColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  RichText(
                    text: TextSpan(
                      text: 'Win rate: ',
                      style: ktsCaption.copyWith(color: kcSecondaryText),
                      children: [
                        TextSpan(
                            text: '$winRate%',
                            style: ktsBodyText.copyWith(color: kcPrimaryText)),
                      ],
                    ),
                  ),
                  const Spacer(),
                  RichText(
                    text: TextSpan(
                      text: 'AUM: ',
                      style: ktsCaption.copyWith(color: kcSecondaryText),
                      children: [
                        TextSpan(
                            text: '\$${pnl.toStringAsFixed(2)}',
                            style: ktsBodyText.copyWith(color: kcPrimaryText)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
