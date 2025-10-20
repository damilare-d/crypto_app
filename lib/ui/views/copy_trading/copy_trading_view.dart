import 'package:crypto_app/ui/views/copy_trading/widgets/main_copy_trading_view.dart';
import 'package:crypto_app/ui/views/copy_trading/widgets/onboard_copy_step.dart';
import 'package:crypto_app/ui/views/copy_trading/widgets/risk_selection_step.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'copy_trading_viewmodel.dart';
import '../../common/app_colors.dart';
import '../../common/text_styles.dart';

class CopyTradingView extends StackedView<CopyTradingViewModel> {
  const CopyTradingView({Key? key}) : super(key: key);

  @override
  Widget builder(BuildContext context, CopyTradingViewModel vm, Widget? child) {
    return Scaffold(
      backgroundColor: kcBackgroundColor,
      appBar: AppBar(
        backgroundColor: kcDarkGreyColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, size: 20),
          color: kcLightGrey,
          onPressed: () => Navigator.of(context).pop(),
        ),
        centerTitle: true,
        title: const Text('Copy Trading', style: ktsBodyText),
      ),
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: vm.pageController,
        children: [
          // step 1 onboarding
          OnboardStep(
            indicatorActiveCount: 1,
            headline: 'Copy Pro traders',
            caption:
                'Leverage expert strategies from professional traders to boost your trading results.',
            imageUrl: 'assets/images/copy_pro_traders.png',
            ctaText: 'Watch a how-to video',
            buttonGradient: const LinearGradient(
              colors: [Color(0xFF483BEB), Color(0xFF7847E1), Color(0xFFDD568D)],
            ),
            onPrimaryPressed: vm.onGetStartedPressed,
          ),

          // step 2 onboarding
          OnboardStep(
            indicatorActiveCount: 2,
            headline: 'Do less, Win more',
            caption:
                'Streamline your approach to trading and increase your winning potential effortlessly.',
            imageUrl: 'assets/images/do_less_win_more.png',
            ctaText: 'Watch a how-to video',
            buttonGradient: const LinearGradient(
              colors: [Color(0xFF483BEB), Color(0xFF7847E1), Color(0xFFDD568D)],
            ),
            onPrimaryPressed: vm.onGetStartedPressed,
          ),

          // step 3 risk selection
          RiskSelectionStep(
            onSelection: vm.selectRisk,
            selectedIndex: vm.selectedRiskIndex,
            onProceed: vm.onProceedPressed,
          ),

          // step 4: main Copy Trading view
          MainCopyTradingView(vm: vm),
        ],
      ),
    );
  }

  @override
  CopyTradingViewModel viewModelBuilder(BuildContext context) =>
      CopyTradingViewModel();
}
