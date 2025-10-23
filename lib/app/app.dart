import 'package:crypto_app/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:crypto_app/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:crypto_app/ui/views/home/home_view.dart';
import 'package:crypto_app/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:crypto_app/ui/views/dashboard/dashboard_view.dart';
import 'package:crypto_app/ui/views/wallet/wallet_view.dart';
import 'package:crypto_app/ui/views/profile/profile_view.dart';
import 'package:crypto_app/ui/views/history/history_view.dart';

import '../ui/dialogs/dashbard/dashbard_dialog.dart';
import 'package:crypto_app/ui/views/copy_trading/copy_trading_view.dart';
import 'package:crypto_app/ui/views/copy_trading_dashboard/copy_trading_dashboard_view.dart';
import 'package:crypto_app/ui/views/copy_trader_detail/copy_trader_detail_view.dart';
import 'package:crypto_app/ui/bottom_sheets/copy_trade_awareness/copy_trade_awareness_sheet.dart';
import 'package:crypto_app/ui/bottom_sheets/copy_trade_risks/copy_trade_risks_sheet.dart';
import 'package:crypto_app/ui/views/success/success_view.dart';
import 'package:crypto_app/ui/views/enter_amount/enter_amount_view.dart';
import 'package:crypto_app/ui/views/confirm_transaction/confirm_transaction_view.dart';
import 'package:crypto_app/ui/views/transaction_pin/transaction_pin_view.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
    MaterialRoute(page: DashboardView),
    MaterialRoute(page: WalletView),
    MaterialRoute(page: ProfileView),
    MaterialRoute(page: HistoryView),
    MaterialRoute(page: CopyTradingView),
    MaterialRoute(page: CopyTradingDashboardView),
    MaterialRoute(page: CopyTraderDetailView),
    MaterialRoute(page: SuccessView),
    MaterialRoute(page: EnterAmountView),
    MaterialRoute(page: ConfirmTransactionView),
    MaterialRoute(page: TransactionPinView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    // @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    StackedBottomsheet(classType: CopyTradeAwarenessSheet),
    StackedBottomsheet(classType: CopyTradeRisksSheet),
// @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    StackedDialog(classType: DashboardDialog),
// @stacked-dialog
  ],
)
class App {}
