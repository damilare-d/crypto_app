import 'package:crypto_app/ui/common/app_colors.dart';
import 'package:crypto_app/ui/common/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../../common/ui_helpers.dart';
import '../../widgets/custom_button.dart';
import 'enter_amount_viewmodel.dart';

class EnterAmountView extends StackedView<EnterAmountViewModel> {
  const EnterAmountView({super.key});

  @override
  Widget builder(
      BuildContext context, EnterAmountViewModel viewModel, Widget? child) {
    return Scaffold(
      backgroundColor: kcDarkGreyColor,
      appBar: AppBar(
        backgroundColor: kcDarkGreyColor,
        title: const Text('Enter amount', style: ktsBodyText),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pop;
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: kcSecondaryText,
            )),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 16),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: kcDarkGreyColor.withOpacity(0.3),
              borderRadius: BorderRadius.circular(6),
            ),
            child: GestureDetector(
              onTap: () {
                final next =
                    (viewModel.selectedFlagIndex + 1) % viewModel.flags.length;
                viewModel.setFlag(next);
              },
              child: Row(
                children: [
                  Text(viewModel.currentFlagEmoji),
                  horizontalSpaceSmall,
                  Text(viewModel.currentCode, style: ktsBodyText),
                  const Icon(Icons.keyboard_arrow_down_rounded,
                      color: Colors.white),
                ],
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            /// Amount input
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 50,
                    child: TextField(
                      controller: viewModel.amountController,
                      keyboardType: TextInputType.number,
                      style: ktsHeadlineMedium,
                      decoration: const InputDecoration(
                        hintText: '0.00',
                        border: InputBorder.none,
                      ),
                      onChanged: viewModel.onAmountChanged,
                    ),
                  ),
                  Text(
                    viewModel.currentCode,
                    style: ktsHeadlineMedium,
                  ),
                ],
              ),
            ),
            verticalSpaceMedium,

            /// Transaction Fee Info
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: kcDarkGreyColor.withOpacity(0.3),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(
                'Transaction fee (1%) - ${viewModel.transactionFeeValue}',
                style: ktsCaption,
              ),
            ),
            verticalSpaceLarge,

            /// Balance Section
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: kcDarkGreyColor.withOpacity(0.2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('${viewModel.currentCode} Balance',
                          style: ktsCaption),
                      Text('${viewModel.currentSymbol} 10000',
                          style: ktsBodyText),
                    ],
                  ),
                  GestureDetector(
                    onTap: viewModel.useMaxAmount,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 6),
                      decoration: BoxDecoration(
                        color: kcDarkGreyColor.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: const Text('Use Max', style: ktsCaption),
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),

            CustomButton(
              buttonText: 'Continue',
              onPrimaryPressed: viewModel.navigateToConfirm,
              isDisabled: !viewModel.isAmountValid,
            ),
          ],
        ),
      ),
    );
  }

  @override
  EnterAmountViewModel viewModelBuilder(BuildContext context) =>
      EnterAmountViewModel();
}
