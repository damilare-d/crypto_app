import 'package:crypto_app/app/app.locator.dart';
import 'package:crypto_app/ui/views/history/history_view.dart';
import 'package:crypto_app/ui/views/profile/profile_view.dart';
import 'package:crypto_app/ui/views/wallet/wallet_view.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.dialogs.dart';
import '../home/home_view.dart';

class DashboardViewModel extends BaseViewModel {
  final _dialogService = locator<DialogService>();

  int selectedIndex = 0;

  final List<Widget> widgetOptions = const [
    HomeView(),
    WalletView(),
    HistoryView(),
    ProfileView(),
  ];

  void onItemTapped(int value) {
    selectedIndex = value;
    notifyListeners();
  }

  Future<void> showDashboardDialog() async {
    await _dialogService.showCustomDialog(
      variant: DialogType.dashbard,
      title: 'Dashboard Actions',
      description: 'Choose an action to perform',
    );
  }
}
