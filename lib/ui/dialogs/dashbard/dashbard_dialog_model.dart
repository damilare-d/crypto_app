import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class DashboardDialogModel extends BaseViewModel {
  final List<Map<String, dynamic>> tradeOptions = [
    {
      'title': 'Buy Crypto',
      'icon': Icons.attach_money,
      'isNew': false,
    },
    {
      'title': 'Sell Crypto',
      'icon': Icons.money_off,
      'isNew': false,
    },
    {
      'title': 'Launchpad',
      'icon': Icons.rocket_launch_outlined,
      'isNew': true,
    },
    {
      'title': 'Swap',
      'icon': Icons.swap_vert_circle_outlined,
      'isNew': false,
    },
    {
      'title': 'AI Signals',
      'icon': Icons.auto_graph,
      'isNew': true,
    },
  ];

  final List<Map<String, dynamic>> earnOptions = [
    {
      'title': 'Roqq’n’roll',
      'icon': Icons.stars,
      'isNew': true,
    },
    {
      'title': 'Savings',
      'icon': Icons.savings_outlined,
      'isNew': false,
    },
    {
      'title': 'Missions',
      'icon': Icons.flag_outlined,
      'isNew': true,
    },
    {
      'title': 'Copy Trading',
      'icon': Icons.people_alt_outlined,
      'isNew': true,
    },
  ];
}
