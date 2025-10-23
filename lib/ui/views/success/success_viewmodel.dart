import 'package:crypto_app/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';

class SuccessViewModel extends BaseViewModel {
  final _navService = locator<NavigationService>();

  navigateToDashboard() => _navService.navigateToDashboardView();
}
