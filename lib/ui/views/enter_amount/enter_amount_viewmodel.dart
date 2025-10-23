import 'package:crypto_app/app/app.router.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../app/app.locator.dart';

class EnterAmountViewModel extends BaseViewModel {
  final NavigationService _nav = locator<NavigationService>();

  final TextEditingController amountController = TextEditingController();



  // Flags / currencies
  final List<Map<String, String>> flags = [
    {'code': 'GBP', 'label': 'United Kingdom', 'emoji': '🇬🇧', 'symbol': '£'},
    {'code': 'EUR', 'label': 'European', 'emoji': '🇪🇺', 'symbol': '€'},
    {'code': 'NGN', 'label': 'Nigeria', 'emoji': '🇳🇬', 'symbol': '₦'},
    {'code': 'USD', 'label': 'United States', 'emoji': '🇺🇸', 'symbol': '\$'},
  ];
  int selectedFlagIndex = 0;
  String get currentSymbol => flags[selectedFlagIndex]['symbol'] ?? '£';
  String get currentCode => flags[selectedFlagIndex]['code'] ?? 'EUR';
  String get currentFlagEmoji => flags[selectedFlagIndex]['emoji'] ?? '🇬🇧';

  void setFlag(int idx) {
    selectedFlagIndex = idx;
    notifyListeners();
  }

  // Example of the selected trader to copy (should be set before navigating here)
  Map<String, dynamic>? selectedTrader;

  // Transaction fee rate as fraction (1% => 0.01)
  final double feeRate = 0.01;

  // computed
  double get amount {
    final text = amountController.text.replaceAll(',', '').trim();
    if (text.isEmpty) return 0.0;
    try {
      return double.parse(text);
    } catch (_) {
      return 0.0;
    }
  }

  String get transactionFeeValue {
    final fee = amount * feeRate;
    // formatted as 2 decimals - you may want to use NumberFormat
    return fee.toStringAsFixed(2);
  }

  bool get isAmountValid => amount > 0.0;

  /// Called when user types amount
  void onAmountChanged(String value) {
    notifyListeners();
  }

  /// Use full balance example (you may load real balance from a service)
  void useMaxAmount() {
    // Example: set to a mock balance - replace with actual balance fetched from service
    amountController.text = '240.73';
    notifyListeners();
  }


  /// Navigate to confirm screen.
  /// You can pass the data in route arguments or use your shared service.
  Future<void> navigateToConfirm() async {
    if (!isAmountValid) return;

    final payload = {
      'amount': amount,
      'currency': currentSymbol,
      'flagEmoji': currentFlagEmoji,
      'fee': double.parse(transactionFeeValue),
      'trader': selectedTrader,
    };

    _nav.navigateToConfirmTransactionView(payload: payload);

    // EXAMPLE - adapt to your app's router:
    // _nav.navigateTo(Routes.confirmTransactionView, arguments: payload);
    // OR if you prefer direct view navigation with stacked_routes, use your generated router.

    // For now, demonstrate returning payload (or you can call nav):
    // _nav.navigateTo('/confirm-transaction', arguments: payload);

    // If you prefer to close a sheet and return data:
    // _dialogService.complete(DialogResponse(confirmed: true, data: payload));

    // For sample local navigation: (uncomment & adjust to your routes)
    // await _nav.navigateTo('/confirm_transaction', arguments: payload);
  }

  @override
  void dispose() {
    amountController.dispose();
    super.dispose();
  }
}
