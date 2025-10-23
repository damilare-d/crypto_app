import 'package:crypto_app/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../app/app.locator.dart';

/// ViewModel for ConfirmTransactionView
/// Expects data (amount, currency, fee, trader) to be provided either through
/// constructor/init or via navigation arguments.
class ConfirmTransactionViewModel extends BaseViewModel {
  final NavigationService _nav = locator<NavigationService>();


  // Provided/derived values (set these when constructing or in onModelReady)
  double amount = 0.0;
  String currency = 'USD';
  String flagEmoji = '🇺🇸';
  double fee = 0.0;
  Map<String, dynamic>? trader;

  // Derived display values
  String get amountDisplay => amount.toStringAsFixed(2);
  String get feeDisplay => fee.toStringAsFixed(2);

  // Example: what the user will get after fee deduction
  double get userReceives => (amount - fee);

  String get userReceivesDisplay => userReceives.toStringAsFixed(2);

  // For basic UI busy state while calling API
  bool _busy = false;
  bool get busy1 => _busy;
  set busy1(bool v) {
    _busy = v;
    notifyListeners();
  }

  /// Initialise this ViewModel with payload (call from view's onModelReady).
  void initialise(
      {required double amount,
      required String currency,
        required String flagEmoji,
      required double fee,
      Map<String, dynamic>? trader}) {
    this.amount = amount;
    this.currency = currency;
    this.flagEmoji = flagEmoji;
    this.fee = fee;
    this.trader = trader;
    notifyListeners();
  }


  Future<void> navigateToPin() async {
        _nav.navigateToTransactionPinView();}

  /// If user cancels
  void cancel() {
    _nav.back();
  }
}
