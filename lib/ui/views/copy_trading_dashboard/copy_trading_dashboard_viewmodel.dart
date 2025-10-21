import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class CopyTradingDashboardViewModel extends BaseViewModel {
  // Tabs: 0=Chart,1=CurrentTrades,2=Stats,3=MyTraders
  int activeTab = 0;
  void setTab(int i) {
    activeTab = i;
    notifyListeners();
  }

  // Duration filter
  String duration = '7d';
  void setDuration(String d) {
    duration = d;
    notifyListeners();
  }

  // Mock chart data (y-values over time)
  final List<double> chartData = [100, 120, 115, 130, 145, 138, 155];

  // Mock trading history items
  final List<Map<String, dynamic>> tradingHistory = [
    {
      'pair': 'BTCUSDT',
      'leverage': '10X',
      'roi': 3.25,
      'roiPositive': true,
      'pro': {'name': 'Ada Ikem', 'avatar': null},
      'entryPrice': '45,780',
      'exitPrice': '45,900',
      'proAmount': '\$3,200',
      'entryTime': '01:22pm',
      'exitTime': '02:10pm',
    },
    {
      'pair': 'ETHUSDT',
      'leverage': '5X',
      'roi': -1.45,
      'roiPositive': false,
      'pro': {'name': 'Tom Rivers', 'avatar': null},
      'entryPrice': '3,200',
      'exitPrice': '3,150',
      'proAmount': '\$1,200',
      'entryTime': '09:00am',
      'exitTime': '11:05am',
    },
  ];

  // Mock current trades (same structure as history)
  final List<Map<String, dynamic>> currentTrades = [
    {
      'pair': 'XRPUSDT',
      'leverage': '3X',
      'roi': 2.75,
      'roiPositive': true,
      'pro': {'name': 'Lola Smith', 'avatar': null},
      'entryPrice': '0.82',
      'exitPrice': '--',
      'proAmount': '\$600',
      'entryTime': '10:15am',
      'exitTime': '--',
    }
  ];

  // Mock stats
  final List<Map<String, dynamic>> stats = [
    {'title': 'PRO traders', 'value': '24'},
    {'title': 'Trading days', 'value': '120'},
    {'title': 'Profit-share', 'value': '15%'},
    {'title': 'Total orders', 'value': '1,254'},
    {'title': 'Average losses', 'value': '4.1%'},
    {'title': 'Total copy trades', 'value': '783'},
  ];

  // Mock trading pairs list
  final List<String> tradingPairs = [
    'BTCUSDT',
    'ETHUSDT',
    'XRPUSDT',
    'SOLUSDT'
  ];

  // Mock pro traders list (for My Traders)
  final List<Map<String, dynamic>> allTraders = [
    {'name': 'Ada Ikem', 'volume': '\$38,667.29', 'profit': '\$12,345.00'},
    {'name': 'Tom Rivers', 'volume': '\$15,432.10', 'profit': '\$6,234.90'},
    {'name': 'Lola Smith', 'volume': '\$6,892.50', 'profit': '\$2,120.00'},
    {'name': 'Rita Okoro', 'volume': '\$2,200.00', 'profit': '\$600.00'},
  ];

  // Search & filtered traders
  String traderQuery = '';
  List<Map<String, dynamic>> get filteredTraders {
    if (traderQuery.trim().isEmpty) return allTraders;
    final q = traderQuery.toLowerCase();
    return allTraders
        .where((t) => (t['name'] as String).toLowerCase().contains(q))
        .toList();
  }

  void updateTraderQuery(String q) {
    traderQuery = q;
    notifyListeners();
  }

  // Convenience action for duration popup (could be connected to a sheet)
  void chooseDuration(String d) {
    setDuration(d);
  }
}
