// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:crypto_app/ui/views/confirm_transaction/confirm_transaction_view.dart'
    as _i13;
import 'package:crypto_app/ui/views/copy_trader_detail/copy_trader_detail_view.dart'
    as _i10;
import 'package:crypto_app/ui/views/copy_trading/copy_trading_view.dart' as _i8;
import 'package:crypto_app/ui/views/copy_trading_dashboard/copy_trading_dashboard_view.dart'
    as _i9;
import 'package:crypto_app/ui/views/dashboard/dashboard_view.dart' as _i4;
import 'package:crypto_app/ui/views/enter_amount/enter_amount_view.dart'
    as _i12;
import 'package:crypto_app/ui/views/history/history_view.dart' as _i7;
import 'package:crypto_app/ui/views/home/home_view.dart' as _i2;
import 'package:crypto_app/ui/views/profile/profile_view.dart' as _i6;
import 'package:crypto_app/ui/views/startup/startup_view.dart' as _i3;
import 'package:crypto_app/ui/views/success/success_view.dart' as _i11;
import 'package:crypto_app/ui/views/transaction_pin/transaction_pin_view.dart'
    as _i14;
import 'package:crypto_app/ui/views/wallet/wallet_view.dart' as _i5;
import 'package:flutter/material.dart' as _i15;
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i16;

class Routes {
  static const homeView = '/home-view';

  static const startupView = '/startup-view';

  static const dashboardView = '/dashboard-view';

  static const walletView = '/wallet-view';

  static const profileView = '/profile-view';

  static const historyView = '/history-view';

  static const copyTradingView = '/copy-trading-view';

  static const copyTradingDashboardView = '/copy-trading-dashboard-view';

  static const copyTraderDetailView = '/copy-trader-detail-view';

  static const successView = '/success-view';

  static const enterAmountView = '/enter-amount-view';

  static const confirmTransactionView = '/confirm-transaction-view';

  static const transactionPinView = '/transaction-pin-view';

  static const all = <String>{
    homeView,
    startupView,
    dashboardView,
    walletView,
    profileView,
    historyView,
    copyTradingView,
    copyTradingDashboardView,
    copyTraderDetailView,
    successView,
    enterAmountView,
    confirmTransactionView,
    transactionPinView,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.homeView,
      page: _i2.HomeView,
    ),
    _i1.RouteDef(
      Routes.startupView,
      page: _i3.StartupView,
    ),
    _i1.RouteDef(
      Routes.dashboardView,
      page: _i4.DashboardView,
    ),
    _i1.RouteDef(
      Routes.walletView,
      page: _i5.WalletView,
    ),
    _i1.RouteDef(
      Routes.profileView,
      page: _i6.ProfileView,
    ),
    _i1.RouteDef(
      Routes.historyView,
      page: _i7.HistoryView,
    ),
    _i1.RouteDef(
      Routes.copyTradingView,
      page: _i8.CopyTradingView,
    ),
    _i1.RouteDef(
      Routes.copyTradingDashboardView,
      page: _i9.CopyTradingDashboardView,
    ),
    _i1.RouteDef(
      Routes.copyTraderDetailView,
      page: _i10.CopyTraderDetailView,
    ),
    _i1.RouteDef(
      Routes.successView,
      page: _i11.SuccessView,
    ),
    _i1.RouteDef(
      Routes.enterAmountView,
      page: _i12.EnterAmountView,
    ),
    _i1.RouteDef(
      Routes.confirmTransactionView,
      page: _i13.ConfirmTransactionView,
    ),
    _i1.RouteDef(
      Routes.transactionPinView,
      page: _i14.TransactionPinView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.HomeView: (data) {
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.HomeView(),
        settings: data,
      );
    },
    _i3.StartupView: (data) {
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) => const _i3.StartupView(),
        settings: data,
      );
    },
    _i4.DashboardView: (data) {
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) => const _i4.DashboardView(),
        settings: data,
      );
    },
    _i5.WalletView: (data) {
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) => const _i5.WalletView(),
        settings: data,
      );
    },
    _i6.ProfileView: (data) {
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) => const _i6.ProfileView(),
        settings: data,
      );
    },
    _i7.HistoryView: (data) {
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) => const _i7.HistoryView(),
        settings: data,
      );
    },
    _i8.CopyTradingView: (data) {
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) => const _i8.CopyTradingView(),
        settings: data,
      );
    },
    _i9.CopyTradingDashboardView: (data) {
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) => const _i9.CopyTradingDashboardView(),
        settings: data,
      );
    },
    _i10.CopyTraderDetailView: (data) {
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) => const _i10.CopyTraderDetailView(),
        settings: data,
      );
    },
    _i11.SuccessView: (data) {
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) => const _i11.SuccessView(),
        settings: data,
      );
    },
    _i12.EnterAmountView: (data) {
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) => const _i12.EnterAmountView(),
        settings: data,
      );
    },
    _i13.ConfirmTransactionView: (data) {
      final args = data.getArgs<ConfirmTransactionViewArguments>(nullOk: false);
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i13.ConfirmTransactionView(key: args.key, payload: args.payload),
        settings: data,
      );
    },
    _i14.TransactionPinView: (data) {
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) => const _i14.TransactionPinView(),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;

  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class ConfirmTransactionViewArguments {
  const ConfirmTransactionViewArguments({
    this.key,
    required this.payload,
  });

  final _i15.Key? key;

  final Map<dynamic, dynamic> payload;

  @override
  String toString() {
    return '{"key": "$key", "payload": "$payload"}';
  }

  @override
  bool operator ==(covariant ConfirmTransactionViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.payload == payload;
  }

  @override
  int get hashCode {
    return key.hashCode ^ payload.hashCode;
  }
}

extension NavigatorStateExtension on _i16.NavigationService {
  Future<dynamic> navigateToHomeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.homeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToStartupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.startupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToDashboardView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.dashboardView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToWalletView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.walletView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToProfileView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.profileView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToHistoryView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.historyView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToCopyTradingView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.copyTradingView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToCopyTradingDashboardView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.copyTradingDashboardView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToCopyTraderDetailView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.copyTraderDetailView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSuccessView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.successView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToEnterAmountView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.enterAmountView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToConfirmTransactionView({
    _i15.Key? key,
    required Map<dynamic, dynamic> payload,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.confirmTransactionView,
        arguments: ConfirmTransactionViewArguments(key: key, payload: payload),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToTransactionPinView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.transactionPinView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithHomeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.homeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithStartupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.startupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithDashboardView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.dashboardView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithWalletView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.walletView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithProfileView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.profileView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithHistoryView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.historyView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithCopyTradingView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.copyTradingView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithCopyTradingDashboardView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.copyTradingDashboardView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithCopyTraderDetailView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.copyTraderDetailView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSuccessView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.successView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithEnterAmountView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.enterAmountView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithConfirmTransactionView({
    _i15.Key? key,
    required Map<dynamic, dynamic> payload,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.confirmTransactionView,
        arguments: ConfirmTransactionViewArguments(key: key, payload: payload),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithTransactionPinView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.transactionPinView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
