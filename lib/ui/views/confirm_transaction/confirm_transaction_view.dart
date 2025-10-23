import 'package:crypto_app/ui/common/app_colors.dart';
import 'package:crypto_app/ui/common/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../common/ui_helpers.dart';
import '../../widgets/custom_button.dart';
import 'confirm_transaction_viewmodel.dart';

class ConfirmTransactionView extends StackedView<ConfirmTransactionViewModel> {
  final Map payload;
  const ConfirmTransactionView({super.key, required this.payload});

  @override
  Widget builder(BuildContext context, ConfirmTransactionViewModel viewModel,
      Widget? child) {
    return Scaffold(
      backgroundColor: kcDarkGreyColor,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: kcSecondaryText,
            )),
        title: const Text('Confirm transaction', style: ktsBodyText),
        backgroundColor: kcDarkGreyColor,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
                child: Text(
              viewModel.flagEmoji,
              style: ktsHeadlineMedium,
            )),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: kcDarkGreyColor.withOpacity(0.3),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      horizontalSpaceSmall,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text('Copy trading amount', style: ktsCaption),
                          Text('${viewModel.currency}${viewModel.amount}',
                              style: ktsHeadlineNormal),
                        ],
                      ),
                    ],
                  ),
                  verticalSpaceMedium,
                  _buildRow('PRO trader',
                      viewModel.trader?['trader'] ?? 'PRO Trader'),
                  _buildRow('What you get',
                      '${viewModel.currency}${viewModel.amountDisplay}'),
                  _buildRow('Transaction fee',
                      '${viewModel.currency}${viewModel.feeDisplay}'),
                ],
              ),
            ),
            const Spacer(),
            CustomButton(
              buttonText: 'Confirm transaction',
              onPrimaryPressed: viewModel.navigateToPin,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRow(String title, String value) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: ktsCaption),
            Text(value, style: ktsBodyText),
          ],
        ),
      );

  @override
  ConfirmTransactionViewModel viewModelBuilder(BuildContext context) =>
      ConfirmTransactionViewModel();

  @override
  void onViewModelReady(ConfirmTransactionViewModel viewModel) {
    viewModel.initialise(
        amount: payload['amount'],
        currency: payload['currency'],
        flagEmoji: payload['flagEmoji'],
        fee: payload['fee'],
        trader: payload['trader']);
  }
}
