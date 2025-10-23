import 'package:crypto_app/app/app.router.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../app/app.locator.dart';

class TransactionPinViewModel extends BaseViewModel {
  final NavigationService _nav = locator<NavigationService>();

  final TextEditingController controller = TextEditingController();
  final FocusNode focusNode = FocusNode();

  String pin = '';
  bool isMasked = true;

  // Optionally store incoming data
  double? amount;
  String? currency;
  Map<String, dynamic>? trader;

  void initialise(
      {double? amount, String? currency, Map<String, dynamic>? trader}) {
    this.amount = amount;
    this.currency = currency;
    this.trader = trader;
    notifyListeners();
  }

  void onPinChanged(String value) {
    pin = value;
    notifyListeners();
  }

  void toggleMask() {
    isMasked = !isMasked;
    notifyListeners();
  }

  bool get isPinComplete => pin.length == 6;

  /// Confirm PIN: call your auth/tx endpoint here
  Future<void> confirmPin() async {
    if (!isPinComplete) return;

      await Future.delayed(const Duration(milliseconds: 600),
        _nav.navigateToSuccessView
      );
  }
}
