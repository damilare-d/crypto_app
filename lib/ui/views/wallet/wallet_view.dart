import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'wallet_viewmodel.dart';

class WalletView extends StackedView<WalletViewModel> {
  const WalletView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    WalletViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        child: const Center(child: Text("WalletView")),
      ),
    );
  }

  @override
  WalletViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      WalletViewModel();
}
