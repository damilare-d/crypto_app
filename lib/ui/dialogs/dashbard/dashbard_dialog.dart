import 'package:crypto_app/ui/common/app_colors.dart';
import 'package:crypto_app/ui/common/text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'dashbard_dialog_model.dart';

class DashboardDialog extends StackedView<DashboardDialogModel> {
  final DialogRequest request;
  final Function(DialogResponse) completer;
  const DashboardDialog({
    Key? key,
    required this.request,
    required this.completer,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    DashboardDialogModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.5),
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.85,
        margin: const EdgeInsets.symmetric(horizontal: 16),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        decoration: const BoxDecoration(
          color: kcDarkGreyColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Trade', style: ktsBodyText),
                IconButton(
                  icon: const Icon(Icons.close, color: kcSecondaryText),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
            const SizedBox(height: 8),
            // List
            Expanded(
              child: ListView.builder(
                itemCount: viewModel.tradeOptions.length,
                itemBuilder: (context, index) {
                  final item = viewModel.tradeOptions[index];
                  return _TradeOptionItem(
                    title: item['title'],
                    icon: item['icon'],
                    isNew: item['isNew'],
                    index: index,
                    options: viewModel.tradeOptions,
                  );
                },
              ),
            ),
            const SizedBox(
              height: 16,
            ),

            const Text('Earn', style: ktsBodyText),
            const SizedBox(height: 8),
            Expanded(
              child: ListView.builder(
                itemCount: viewModel.earnOptions.length,
                itemBuilder: (context, index) {
                  final item = viewModel.earnOptions[index];
                  return _TradeOptionItem(
                    title: item['title'],
                    icon: item['icon'],
                    isNew: item['isNew'],
                    index: index,
                    options: viewModel.earnOptions,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  DashboardDialogModel viewModelBuilder(BuildContext context) =>
      DashboardDialogModel();
}

class _TradeOptionItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool isNew;
  final int index;
  final List options;

  const _TradeOptionItem({
    required this.title,
    required this.icon,
    required this.isNew,
    required this.index,
    required this.options,
  });

  @override
  Widget build(BuildContext context) {
    BorderRadiusGeometry getCornerRadius(int index, List options) {
      if (index == 0) {
        return const BorderRadius.vertical(top: Radius.circular(16));
      } else if (index == options.length - 1) {
        return const BorderRadius.vertical(bottom: Radius.circular(16));
      }
      return BorderRadius.zero;
    }

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
      decoration: BoxDecoration(
          color: kcMediumGrey.withOpacity(0.15),
          borderRadius: getCornerRadius(index, options)),
      child: Row(
        children: [
          CircleAvatar(
            radius: 20,
            backgroundColor: kcGradientStart.withOpacity(0.15),
            child: Icon(icon, color: kcPrimaryText, size: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            child:
                Text(title, style: ktsCaption.copyWith(color: kcPrimaryText)),
          ),
          if (isNew)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                color: kcTextWarning.withOpacity(0.2),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text('NEW',
                  style: ktsCaption.copyWith(color: kcTextWarning),
                  textAlign: TextAlign.center),
            ),
          const SizedBox(width: 8),
          const Icon(Icons.arrow_forward_ios, color: kcSecondaryText, size: 18),
        ],
      ),
    );
  }
}
