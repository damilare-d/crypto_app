import 'package:flutter_test/flutter_test.dart';
import 'package:crypto_app/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('DashbardDialogModel Tests -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}
