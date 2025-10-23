import 'package:crypto_app/ui/common/text_styles.dart';
import 'package:crypto_app/ui/widgets/custom_button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:crypto_app/ui/common/app_colors.dart';
import 'package:crypto_app/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'copy_trade_awareness_sheet_model.dart';

class CopyTradeAwarenessSheet
    extends StackedView<CopyTradeAwarenessSheetModel> {
  final Function(SheetResponse response)? completer;
  final SheetRequest request;

  const CopyTradeAwarenessSheet({
    Key? key,
    required this.completer,
    required this.request,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    CopyTradeAwarenessSheetModel viewModel,
    Widget? child,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: const BoxDecoration(
        color: kcDarkGreyColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            /// Close button
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: () =>
                    completer?.call(SheetResponse(confirmed: false)),
                icon: const Icon(Icons.close, color: Colors.white),
              ),
            ),

            /// Image
            Center(
              child: Image.asset(
                'assets/images/important_message.png',
                height: 100,
                width: 100,
              ),
            ),
            verticalSpaceSmall,

            /// Title
            Center(
              child: Text(
                'Important message!',
                textAlign: TextAlign.center,
                style: ktsHeadlineNormal.copyWith(color: Colors.white),
              ),
            ),
            verticalSpaceTiny,

            /// Description with "Learn more" text span
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: ktsBodyText.copyWith(color: kcMediumGrey),
                children: [
                  const TextSpan(
                    text:
                        "Don’t invest unless you’re prepared and understand the risks involved in copy trading. ",
                  ),
                  TextSpan(
                    text: "Learn more about the risks.",
                    style: ktsBodyText.copyWith(
                      color: kcPrimaryColor,
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.w600,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => viewModel.showRiskSheet(),
                  ),
                ],
              ),
            ),

            verticalSpaceMedium,

            /// Checkbox row
            Row(
              children: [
                Checkbox(
                  value: viewModel.isAgreed,
                  activeColor: kcPrimaryColor,
                  onChanged: (value) =>
                      viewModel.toggleAgreement(value ?? false),
                ),
                Expanded(
                  child: RichText(
                    text: TextSpan(
                      style: ktsBodyText.copyWith(color: kcMediumGrey),
                      children: [
                        const TextSpan(text: 'Check this box to agree to '),
                        TextSpan(
                          text: "Roqqu’s copy trading policy",
                          style: const TextStyle(
                            color: kcPrimaryColor,
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.w600,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              /// Later can show policy modal
                            },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            verticalSpaceSmall,

            /// Proceed button
            CustomButton(
              buttonText: 'Proceed to copy trade',
              onPrimaryPressed:
                  viewModel.isAgreed ? viewModel.navToCopyTradeDashboard : null,
              isDisabled: !viewModel.isAgreed,
            ),

            verticalSpaceLarge,
          ],
        ),
      ),
    );
  }

  @override
  CopyTradeAwarenessSheetModel viewModelBuilder(BuildContext context) =>
      CopyTradeAwarenessSheetModel();
}
