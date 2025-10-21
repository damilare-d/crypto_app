import 'package:crypto_app/app/app.bottomsheets.dart';
import 'package:crypto_app/app/app.dialogs.dart';
import 'package:crypto_app/app/app.locator.dart';
import 'package:crypto_app/app/app.router.dart';
import 'package:crypto_app/ui/common/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  final _dialogService = locator<DialogService>();
  final _bottomSheetService = locator<BottomSheetService>();
  final _navService = locator<NavigationService>();

  String get counterLabel => 'Counter is: $_counter';

  int _counter = 0;

  void incrementCounter() {
    _counter++;
    rebuildUi();
  }

  void showDialog() {
    _dialogService.showCustomDialog(
      variant: DialogType.infoAlert,
      title: 'Stacked Rocks!',
      description: 'Give stacked $_counter stars on Github',
    );
  }

  void showBottomSheet() {
    _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.notice,
      title: ksHomeBottomSheetTitle,
      description: ksHomeBottomSheetDescription,
    );
  }

  // Flags / currencies
  final List<Map<String, String>> flags = [
    {'code': 'GBP', 'label': 'United Kingdom', 'emoji': '🇬🇧', 'symbol': '£'},
    {'code': 'EUR', 'label': 'European', 'emoji': '🇪🇺', 'symbol': '€'},
    {'code': 'NGN', 'label': 'Nigeria', 'emoji': '🇳🇬', 'symbol': '₦'},
    {'code': 'USD', 'label': 'United States', 'emoji': '🇺🇸', 'symbol': '\$'},
  ];
  int selectedFlagIndex = 0;

  // Balance visibility
  bool isBalanceVisible = true;

  // Action buttons
  final List<Map<String, dynamic>> quickActions = [
    {'title': 'Deposit', 'icon': Icons.download_outlined},
    {'title': 'Buy', 'icon': Icons.attach_money},
    {'title': 'Withdraw', 'icon': Icons.upload_outlined},
    {'title': 'Sell', 'icon': Icons.sell_outlined},
  ];

  // Carousel data (news/cards)
  final List<Map<String, dynamic>> promoCards = [
    {
      'title': 'Delisting Alert',
      'subtitle': 'BTC pair will be delisted — more info',
      'urgent': true,
    },
    {
      'title': 'New coin listed',
      'subtitle': 'Check out XYZ newly listed',
      'urgent': false,
    },
    {
      'title': 'Maintenance',
      'subtitle': 'Planned maintenance on the exchange',
      'urgent': false,
    },
    {
      'title': 'Promo',
      'subtitle': 'Earn rewards for referrals',
      'urgent': false,
    },
  ];
  int activePromoIndex = 0;

  // Crypto list sample
  final List<Map<String, dynamic>> cryptos = [
    {
      'image': null,
      'name': 'Bitcoin',
      'ticker': 'BTC',
      'amount': '0.0123',
      'change': 2.3
    },
    {
      'image': null,
      'name': 'Ethereum',
      'ticker': 'ETH',
      'amount': '0.2500',
      'change': -1.2
    },
    {
      'image': null,
      'name': 'XRP',
      'ticker': 'XRP',
      'amount': '1200',
      'change': 0.8
    },
  ];

  // Actions
  void toggleBalanceVisibility() {
    isBalanceVisible = !isBalanceVisible;
    notifyListeners();
  }

  void setFlag(int idx) {
    selectedFlagIndex = idx;
    notifyListeners();
  }

  void onQuickActionTap(String title) {
    // For now all quick actions are "upcoming"
    _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.notice,
      title: title,
      description: "$title is coming soon. We'll let you know when it's ready.",
    );
  }

  void onTopIconTap(String key) {
    // support keys: 'search', 'support', 'notifications', 'flag'
    _bottomSheetService.showCustomSheet(
        variant: BottomSheetType.notice,
        title: 'Upcoming',
        description: 'Feature "$key" is coming soon. Stay tuned!');
  }

  void onPromoTap(int index) {
    activePromoIndex = index;
    notifyListeners();
    _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.notice,
      title: promoCards[index]['title'],
      description: promoCards[index]['subtitle'],
    );
  }

  void onCryptoTap(Map<String, dynamic> item) {
    _bottomSheetService.showCustomSheet(
        variant: BottomSheetType.notice,
        title: item['name'],
        description: 'Amount: ${item['amount']}');
  }

  String get currentSymbol => flags[selectedFlagIndex]['symbol'] ?? '£';
  String get currentFlagEmoji => flags[selectedFlagIndex]['emoji'] ?? '🇬🇧';

  navToCopyTrading() => _navService.navigateToCopyTradingView();
}
