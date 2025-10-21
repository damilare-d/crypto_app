import 'package:crypto_app/ui/views/copy_trading_dashboard/widgets/section_tabs.dart';
import 'package:crypto_app/ui/views/copy_trading_dashboard/widgets/summary_card.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'copy_trading_dashboard_viewmodel.dart';
import '../../common/app_colors.dart';
import '../../common/text_styles.dart';

class CopyTradingDashboardView
    extends StackedView<CopyTradingDashboardViewModel> {
  const CopyTradingDashboardView({Key? key}) : super(key: key);

  @override
  Widget builder(
      BuildContext context, CopyTradingDashboardViewModel vm, Widget? child) {
    return Scaffold(
      backgroundColor: kcBackgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kcDarkGreyColor,
        title: const Text('Copy Trading Dashboard', style: ktsBodyText),
        centerTitle: true,
        automaticallyImplyLeading: true,
        leading:  IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          color: kcLightGrey,
          onPressed: (){
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              // summary card
              SummaryCard(vm: vm),

              const SizedBox(height: 16),
              // section tabs row
              SectionTabs(vm: vm),

              const SizedBox(height: 16),
              // content area
              Expanded(child: TabContent(vm: vm)),
            ],
          ),
        ),
      ),
    );
  }

  @override
  CopyTradingDashboardViewModel viewModelBuilder(BuildContext context) =>
      CopyTradingDashboardViewModel();
}
