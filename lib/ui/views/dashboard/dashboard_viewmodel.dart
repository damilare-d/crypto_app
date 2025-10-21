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
  bool _isDialogOpen = false;

  bool get isDialogOpen => _isDialogOpen;

  final List<Widget> widgetOptions = const [
    HomeView(),
    WalletView(),
    SizedBox.shrink(),
    HistoryView(),
    ProfileView(),
  ];

  void onItemTapped(int value) async {
    if (value == 2) {
      await _toggleDashboardDialog();
      return;
    }
    selectedIndex = value;
    notifyListeners();
  }

  Future<void> _toggleDashboardDialog() async {
    if (_isDialogOpen) {
      _dialogService.completeDialog(DialogResponse(confirmed: true));
      _isDialogOpen = false;
      notifyListeners();
    } else {
      _isDialogOpen = true;
      notifyListeners();

      await _dialogService.showCustomDialog(
        variant: DialogType.dashboard,
        title: 'Dashboard Actions',
        description: 'Choose an action to perform',
      );

      // When dialog is dismissed
      _isDialogOpen = false;
      notifyListeners();
    }
  }
}
