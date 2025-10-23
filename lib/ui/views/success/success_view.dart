import 'package:crypto_app/ui/common/app_colors.dart';
import 'package:crypto_app/ui/common/text_styles.dart';
import 'package:crypto_app/ui/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'success_viewmodel.dart';

class SuccessView extends StackedView<SuccessViewModel> {
  const SuccessView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SuccessViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
        backgroundColor: kcDarkGreyColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 200,
                  ),
                  Image.asset(
                    'assets/images/success.png',
                    height: 100,
                    width: 100,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const Text(
                    'Trade copied successfully',
                    style: ktsBodyText,
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  const Text(
                    'You have successfully copied BTC Master’s trade. ',
                    style: ktsCaption,
                    textAlign: TextAlign.center,
                  )
                ],
              )),
              const Spacer(),
              CustomButton(
                  onPrimaryPressed:
                    viewModel.navigateToDashboard,
                  buttonText: 'Go to dashboard'),
            ],
          ),
        ));
  }

  @override
  SuccessViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SuccessViewModel();
}
