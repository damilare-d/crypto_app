import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.bottomsheets.dart';
import '../../../app/app.locator.dart';
import '../../common/app_strings.dart';

class CopyTraderDetailViewModel extends BaseViewModel {
  final _bottomSheetService = locator<BottomSheetService>();

  // Trader info (mock)
  final Map<String, dynamic> trader = {
    'name': 'Ada Ikem',
    'followers': 1245,
    'tradingDays': 43,
    'profitShare': '15%',
    'totalOrders': 56,
    'winRate': 92,
    'avgRoi': 120.42,
    'totalProfit': 38667.29,
    'avgLosses': '4.1%',
  };

  // Tabs: 0 = Chart, 1 = Stats, 2 = All Trades, 3 = Copiers
  int activeTab = 0;
  void setTab(int i) {
    activeTab = i;
    notifyListeners();
  }

  // All trades toggles: 0 = Current, 1 = History
  int tradesMode = 0;
  void setTradesMode(int m) {
    tradesMode = m;
    notifyListeners();
  }

  // Duration filter for trades/stats
  String duration = '7d';
  void setDuration(String d) {
    duration = d;
    notifyListeners();
  }

  // Mock chart data for the trader
  final List<double> chartData = [80, 95, 100, 120, 140, 130, 160];

  // Mock trades data
  final List<Map<String, dynamic>> tradesHistory = [
    {
      'pair': 'BTCUSDT',
      'leverage': '10X',
      'roi': 3.25,
      'roiPositive': true,
      'entryPrice': '45,780',
      'exitPrice': '45,900',
      'entryTime': '01:22pm',
      'exitTime': '02:10pm',
    },
    {
      'pair': 'ETHUSDT',
      'leverage': '5X',
      'roi': -1.45,
      'roiPositive': false,
      'entryPrice': '3,200',
      'exitPrice': '3,150',
      'entryTime': '09:00am',
      'exitTime': '11:05am',
    },
  ];

  final List<Map<String, dynamic>> currentTrades = [
    {
      'pair': 'XRPUSDT',
      'leverage': '3X',
      'roi': 2.75,
      'roiPositive': true,
      'entryPrice': '0.82',
      'entryTime': '10:15am',
    }
  ];

  // Mock copiers
  final List<Map<String, dynamic>> copiers = [
    {'name': 'John Doe', 'amount': '\$1,200'},
    {'name': 'Jane Roe', 'amount': '\$550'},
    {'name': 'Mark Twin', 'amount': '\$2,050'},
  ];

  // Actions
  void onFollowPressed() {
    // placeholder: implement follow logic
    notifyListeners();
  }

  void onMessagePressed() {
    // placeholder: open chat / sheet
    notifyListeners();
  }

  void onDurationSelect(String d) {
    duration = d;
    notifyListeners();
  }

  showBottomSheet() {
    _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.copyTradeAwareness,
      title: ksHomeBottomSheetTitle,
      description: ksHomeBottomSheetDescription,
    );
  }
}
