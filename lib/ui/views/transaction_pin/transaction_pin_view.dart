import 'package:crypto_app/ui/common/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../common/text_styles.dart';
import '../../common/ui_helpers.dart';
import '../../widgets/custom_button.dart';
import 'transaction_pin_viewmodel.dart';

class TransactionPinView extends StackedView<TransactionPinViewModel> {
  const TransactionPinView({super.key});

  @override
  Widget builder(
      BuildContext context, TransactionPinViewModel viewModel, Widget? child) {
    return Scaffold(
      backgroundColor: kcDarkGreyColor,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /// Lock image
            Image.asset('assets/images/pin_lock.png', height: 100),

            verticalSpaceMedium,

            /// Title
            Text(
              'Confirm Transaction',
              style: ktsHeadlineNormal.copyWith(color: Colors.white),
            ),

            verticalSpaceTiny,

            /// Subtitle
            Text(
              'Input your 6 digit transaction PIN to confirm your transaction and authenticate your request.',
              textAlign: TextAlign.center,
              style: ktsBodyText.copyWith(color: kcMediumGrey),
            ),

            verticalSpaceLarge,

            /// PIN input + mask icon
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: kcDarkGreyColor.withOpacity(0.4),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  /// Hidden input field (captures digits)
                  Expanded(
                    child: GestureDetector(
                      onTap: () => viewModel.focusNode.requestFocus(),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          // Hidden TextField for input
                          Opacity(
                            opacity: 0,
                            child: TextField(
                              controller: viewModel.controller,
                              focusNode: viewModel.focusNode,
                              keyboardType: TextInputType.number,
                              maxLength: 6,
                              autofocus: true,
                              onChanged: viewModel.onPinChanged,
                              decoration: const InputDecoration(
                                counterText: '',
                                border: InputBorder.none,
                              ),
                            ),
                          ),

                          // PIN circles
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(6, (index) {
                              final isFilled = index < viewModel.pin.length;
                              return Container(
                                margin:
                                const EdgeInsets.symmetric(horizontal: 6),
                                height: 14,
                                width: 14,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: isFilled
                                      ? (viewModel.isMasked
                                      ? Colors.white
                                      : kcPrimaryColor)
                                      : kcMediumGrey.withOpacity(0.4),
                                ),
                              );
                            }),
                          ),
                        ],
                      ),
                    ),
                  ),

                  horizontalSpaceSmall,

                  /// Mask toggle icon
                  GestureDetector(
                    onTap: viewModel.toggleMask,
                    child: Icon(
                      viewModel.isMasked
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),

            verticalSpaceMedium,

            /// Confirm button
            CustomButton(
              buttonText: 'Confirm',
              onPrimaryPressed: viewModel.confirmPin,
              isDisabled: viewModel.pin.length < 6,
              isBusy: viewModel.isBusy,
            ),
          ],
        ),
      ),
    );
  }

  @override
  TransactionPinViewModel viewModelBuilder(BuildContext context) =>
      TransactionPinViewModel();
}
