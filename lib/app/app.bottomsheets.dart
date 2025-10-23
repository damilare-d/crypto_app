// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedBottomsheetGenerator
// **************************************************************************

import 'package:stacked_services/stacked_services.dart';

import 'app.locator.dart';
import '../ui/bottom_sheets/copy_trade_awareness/copy_trade_awareness_sheet.dart';
import '../ui/bottom_sheets/copy_trade_risks/copy_trade_risks_sheet.dart';
import '../ui/bottom_sheets/notice/notice_sheet.dart';

enum BottomSheetType {
  notice,
  copyTradeAwareness,
  copyTradeRisks,
}

void setupBottomSheetUi() {
  final bottomsheetService = locator<BottomSheetService>();

  final Map<BottomSheetType, SheetBuilder> builders = {
    BottomSheetType.notice: (context, request, completer) =>
        NoticeSheet(request: request, completer: completer),
    BottomSheetType.copyTradeAwareness: (context, request, completer) =>
        CopyTradeAwarenessSheet(request: request, completer: completer),
    BottomSheetType.copyTradeRisks: (context, request, completer) =>
        CopyTradeRisksSheet(request: request, completer: completer),
  };

  bottomsheetService.setCustomSheetBuilders(builders);
}
