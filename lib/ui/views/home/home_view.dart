import 'package:crypto_app/ui/views/home/widgets/balance_card.dart';
import 'package:crypto_app/ui/views/home/widgets/copy_trading_card.dart';
import 'package:crypto_app/ui/views/home/widgets/quick_action_container.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'home_viewmodel.dart';
import '../../common/app_colors.dart';
import '../../common/text_styles.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(BuildContext context, HomeViewModel vm, Widget? child) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: kcBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // ======= custom appbar row =======
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () => vm.onTopIconTap('currency'),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 8),
                        decoration: BoxDecoration(
                          color: kcMediumGrey,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: [
                            Text(vm.currentFlagEmoji,
                                style: const TextStyle(fontSize: 16)),
                            const SizedBox(width: 8),
                            Text(vm.flags[vm.selectedFlagIndex]['code']!,
                                style:
                                    ktsBodyText.copyWith(color: kcPrimaryText)),
                            const SizedBox(width: 6),
                            const Icon(Icons.keyboard_arrow_down,
                                color: kcPrimaryText),
                          ],
                        ),
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      icon: const Icon(Icons.search, color: kcPrimaryText),
                      onPressed: () => vm.onTopIconTap('search'),
                    ),
                    IconButton(
                      icon: const Icon(Icons.support_agent_outlined,
                          color: kcPrimaryText),
                      onPressed: () => vm.onTopIconTap('support'),
                    ),
                    IconButton(
                      icon: const Icon(Icons.notifications_none,
                          color: kcPrimaryText),
                      onPressed: () => vm.onTopIconTap('notifications'),
                    ),
                    GestureDetector(
                      onTap: () {
                        // show the flags picker slow way
                        final next =
                            (vm.selectedFlagIndex + 1) % vm.flags.length;
                        vm.setFlag(next);
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Row(children: [
                          Text(vm.currentFlagEmoji),
                          const SizedBox(width: 4),
                          const Icon(Icons.keyboard_arrow_down,
                              color: kcPrimaryText),
                        ]),
                      ),
                    ),
                  ],
                ),
              ),

              // ===== balance card =====
              const SizedBox(height: 12),
              BalanceCard(vm: vm),
              const SizedBox(height: 14),

              // quick actions container
              QuickActionContainer(vm: vm,),

              const SizedBox(height: 18),

              // ===== Promo gradient card (copy trading) =====
              CopyTradingCard(
                onTap: vm.navToCopyTrading,
              ),

              const SizedBox(height: 16),

              // ===== Section title =====
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Stay updated',
                      style: ktsBodyText.copyWith(color: kcSecondaryText)),
                ),
              ),

              const SizedBox(height: 8),

              // ===== Horizontal promo carousel with indicators =====
              SizedBox(
                height: 120,
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.separated(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        scrollDirection: Axis.horizontal,
                        itemCount: vm.promoCards.length,
                        separatorBuilder: (_, __) => const SizedBox(width: 12),
                        itemBuilder: (context, index) {
                          final item = vm.promoCards[index];
                          return GestureDetector(
                            onTap: () => vm.onPromoTap(index),
                            child: _PromoCard(
                              title: item['title'],
                              subtitle: item['subtitle'],
                              urgent: item['urgent'],
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 8),
                    // indicators
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(vm.promoCards.length, (i) {
                        final active = vm.activePromoIndex == i;
                        return Container(
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          width: active ? 18 : 8,
                          height: 8,
                          decoration: BoxDecoration(
                            color: active ? kcPrimaryText : kcSecondaryText,
                            borderRadius: BorderRadius.circular(12),
                          ),
                        );
                      }),
                    )
                  ],
                ),
              ),

              const SizedBox(height: 12),

              // ===== Listed icons title =====
             const Padding(
                padding:  EdgeInsets.symmetric(horizontal: 16),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Markets', style: ktsBodyText),
                ),
              ),

              const SizedBox(height: 8),

              // ===== Crypto list (simple) =====
              SizedBox(
                height: 300,
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.separated(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        itemCount: vm.cryptos.length,
                        separatorBuilder: (_, __) => const SizedBox(height: 8),
                        itemBuilder: (context, index) {
                          final item = vm.cryptos[index];
                          return _CryptoRow(
                            name: item['name'],
                            ticker: item['ticker'],
                            amount: item['amount'],
                            change: item['change'],
                            onTap: () => vm.onCryptoTap(item),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(BuildContext context) => HomeViewModel();
}

/// ===== small helper widgets =====

class _PromoCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool urgent;
  const _PromoCard(
      {required this.title, required this.subtitle, this.urgent = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: kcMediumGrey.withOpacity(0.06),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Stack(
        children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(title, style: ktsBodyText.copyWith(color: kcPrimaryText)),
            const SizedBox(height: 8),
            Text(subtitle, style: ktsCaption),
          ]),
          if (urgent)
            Positioned(
              top: 6,
              right: 6,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.red.withOpacity(0.85),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text('URGENT',
                    style: TextStyle(color: Colors.white, fontSize: 10)),
              ),
            ),
        ],
      ),
    );
  }
}

class _CryptoRow extends StatelessWidget {
  final String name;
  final String ticker;
  final String amount;
  final double change;
  final VoidCallback onTap;

  const _CryptoRow({
    required this.name,
    required this.ticker,
    required this.amount,
    required this.change,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final positive = change >= 0;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          color: kcDarkGreyColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            CircleAvatar(
                radius: 18,
                backgroundColor: kcVeryLightGrey,
                child: Text(name[0])),
            const SizedBox(width: 12),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(name, style: ktsBodyText.copyWith(color: kcPrimaryText)),
              const SizedBox(height: 4),
              Text(ticker, style: ktsCaption),
            ]),
            const Spacer(),
            Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
              Text(amount, style: ktsBodyText.copyWith(color: kcPrimaryText)),
              const SizedBox(height: 4),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                    color: positive
                        ? Colors.green.withOpacity(0.12)
                        : Colors.red.withOpacity(0.12),
                    borderRadius: BorderRadius.circular(8)),
                child: Text(
                  '${positive ? '+' : ''}${change.toStringAsFixed(2)}%',
                  style: ktsCaption.copyWith(
                      color: positive ? Colors.green : Colors.red),
                ),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
