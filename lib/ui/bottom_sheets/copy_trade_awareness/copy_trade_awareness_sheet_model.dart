import 'package:crypto_app/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:crypto_app/app/app.locator.dart';
import 'package:crypto_app/app/app.bottomsheets.dart';

class CopyTradeAwarenessSheetModel extends BaseViewModel {
  final _bottomSheetService = locator<BottomSheetService>();
  final _navigationService = locator<NavigationService>();

  bool isAgreed = false;

  void toggleAgreement(bool value) {
    isAgreed = value;
    notifyListeners();
  }

  /// Opens the risk details sheet
  Future<void> showRiskSheet() async {
    await _bottomSheetService.showCustomSheet(
      isScrollControlled: true,
      variant: BottomSheetType.copyTradeRisks,
    );
  }

  /// Proceeds when user agrees
  Future<void> navToCopyTradeDashboard() async {
    _navigationService.back(); // Closes this sheet
    _navigationService.navigateToEnterAmountView();
  }
}
