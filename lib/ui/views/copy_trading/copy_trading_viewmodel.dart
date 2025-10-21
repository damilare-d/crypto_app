import 'package:crypto_app/app/app.locator.dart';
import 'package:crypto_app/app/app.router.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class CopyTradingViewModel extends BaseViewModel {
  final _navService = locator<NavigationService>();
  final PageController pageController = PageController();
  int currentStep = 0;

  // onboarding step controls
  void goToStep(int step) {
    currentStep = step;
    pageController.animateToPage(step,
        duration: const Duration(milliseconds: 300), curve: Curves.easeOut);
    notifyListeners();
  }

  void nextStep() {
    if (currentStep < 2) {
      goToStep(currentStep + 1);
    }
  }

  void previousStep() {
    if (currentStep > 0) {
      goToStep(currentStep - 1);
    }
  }

  // risk selection state
  int selectedRiskIndex = -1;
  void selectRisk(int idx) {
    selectedRiskIndex = idx;
    notifyListeners();
  }

  // Main view data: sample pro traders
  final List<Map<String, dynamic>> proTraders = [
    {
      'name': 'Ada Ikem',
      'followers': 1245,
      'roi': 120.42,
      'pnl': 38667.29,
      'winRate': 100,
    },
    {
      'name': 'Tom Rivers',
      'followers': 890,
      'roi': 86.12,
      'pnl': 15432.10,
      'winRate': 92,
    },
    {
      'name': 'Lola Smith',
      'followers': 432,
      'roi': 45.81,
      'pnl': 6892.5,
      'winRate': 88,
    },
  ];

  // Actions
  void onGetStartedPressed() {
    nextStep();
  }

  void onProceedPressed() {
    // finalise onboarding -> navigate to main copy trading screen (step index 3)
    goToStep(3); // we'll use page 3 as the main copy trading page
  }

  // follow / copy actions - simply notify for now
  void onFollowTrader(int index) {
    // toggle or show sheet
    // placeholder: do nothing for now
    notifyListeners();
  }

  void onCopyTrader(int index) {
    // placeholder action when copy/copy settings invoked
    notifyListeners();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

   navigateToCopyTrdngDb() => _navService.navigateToCopyTradingDashboardView();
}
