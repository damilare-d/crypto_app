import 'package:stacked/stacked.dart';

class CopyTradeRisksSheetModel extends BaseViewModel {
  int? expandedIndex;

  final List<Map<String, String>> risks = [
    {
      'title': 'Market risks',
      'description':
          'All investments carry risks, including potential loss of capital.',
    },
    {
      'title': 'Dependency on others',
      'description':
          'You rely on the decisions of another trader, which may not align with your own goals.',
    },
    {
      'title': 'Mismatched risk profiles',
      'description':
          'The trader you copy may take on more risk than you are comfortable with.',
    },
    {
      'title': 'Control and understanding',
      'description':
          'Copy trading reduces your control over individual trades and strategy adjustments.',
    },
    {
      'title': 'Emotional decisions',
      'description':
          'Following other traders can amplify fear or greed, affecting your judgment.',
    },
    {
      'title': 'Costs involved',
      'description':
          'Some platforms charge performance fees or commissions on copied trades.',
    },
    {
      'title': 'Diversify',
      'description':
          'Relying too heavily on a single trader’s performance can expose you to greater loss.',
    },
    {
      'title': 'Execution risks',
      'description':
          'Delays in order execution or differences in liquidity may lead to slippage.',
    },
    {
      'title': 'Copy trading investments can be complex',
      'description':
          'Ensure you fully understand how copy trading works before participating.',
    },
  ];

  void toggleExpanded(int index) {
    if (expandedIndex == index) {
      expandedIndex = null;
    } else {
      expandedIndex = index;
    }
    notifyListeners();
  }
}
