import 'package:flutter/material.dart';
import 'package:crypto_app/ui/common/app_colors.dart';
import 'package:crypto_app/ui/common/text_styles.dart';
import 'package:crypto_app/ui/common/ui_helpers.dart';
import 'package:crypto_app/ui/widgets/custom_button.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'copy_trade_risks_sheet_model.dart';

class CopyTradeRisksSheet extends StackedView<CopyTradeRisksSheetModel> {
  final Function(SheetResponse response)? completer;
  final SheetRequest request;

  const CopyTradeRisksSheet({
    Key? key,
    required this.completer,
    required this.request,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    CopyTradeRisksSheetModel viewModel,
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
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
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

            /// Title
            Text(
              'Risks involved in copy trading',
              style: ktsHeadlineNormal.copyWith(color: Colors.white),
              textAlign: TextAlign.center,
            ),
            verticalSpaceTiny,

            /// Subtitle
            Text(
              'Please make sure you read the following risks involved in copy trading before making a decision.',
              style: ktsBodyText.copyWith(color: kcMediumGrey),
              textAlign: TextAlign.center,
            ),

            verticalSpaceMedium,

            /// Expandable risk sections
            ...List.generate(viewModel.risks.length, (index) {
              final risk = viewModel.risks[index];
              final isExpanded = viewModel.expandedIndex == index;

              return Column(
                children: [
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    decoration: BoxDecoration(
                      color: kcDarkGreyColor.withOpacity(0.4),
                      borderRadius: BorderRadius.vertical(
                        top: index == 0
                            ? const Radius.circular(10)
                            : Radius.zero,
                        bottom: index == viewModel.risks.length - 1
                            ? const Radius.circular(10)
                            : Radius.zero,
                      ),
                    ),
                    child: InkWell(
                      onTap: () => viewModel.toggleExpanded(index),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 12,
                          horizontal: 10,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                risk['title']!,
                                style: ktsBodyText.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Icon(
                              isExpanded
                                  ? Icons.keyboard_arrow_up
                                  : Icons.keyboard_arrow_down,
                              color: kcMediumGrey,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  if (isExpanded)
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 8,
                      ),
                      color: kcDarkGreyColor.withOpacity(0.3),
                      child: Text(
                        risk['description']!,
                        style: ktsBodyText.copyWith(color: kcMediumGrey),
                      ),
                    ),
                  if (index != viewModel.risks.length - 1)
                    Divider(
                      height: 0.5,
                      color: kcMediumGrey.withOpacity(0.3),
                      thickness: 0.5,
                    ),
                ],
              );
            }),

            verticalSpaceLarge,

            /// Bottom action button
            CustomButton(
              buttonText: 'I have read the risks',
              onPrimaryPressed: () =>
                  completer?.call(SheetResponse(confirmed: true)),
            ),
            verticalSpaceMedium,
          ],
        ),
      ),
    );
  }

  @override
  CopyTradeRisksSheetModel viewModelBuilder(BuildContext context) =>
      CopyTradeRisksSheetModel();
}
