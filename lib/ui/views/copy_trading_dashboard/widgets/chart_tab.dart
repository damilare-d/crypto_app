import 'package:flutter/material.dart';

import '../../../common/app_colors.dart';
import '../../../common/text_styles.dart';
import '../copy_trading_dashboard_viewmodel.dart';

class ChartSection extends StatelessWidget {
  final CopyTradingDashboardViewModel vm;
  const ChartSection({required this.vm, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      // header row: title & amount
      Row(
        children: [
          Text('Copy trading PNL',
              style: ktsBodyText.copyWith(color: kcPrimaryText)),
          const Spacer(),
          Text('\$2,120.45', style: ktsBodyText.copyWith(color: kcPrimaryText)),
        ],
      ),
      const SizedBox(height: 12),
      // Simple custom chart
      Expanded(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              color: kcDarkGreyColor, borderRadius: BorderRadius.circular(12)),
          padding: const EdgeInsets.all(12),
          child: _SimpleLineChart(data: vm.chartData),
        ),
      ),
      const SizedBox(height: 12),
      // bottom small controls
      Row(
        children: [
          Text('Duration', style: ktsCaption.copyWith(color: kcSecondaryText)),
          const SizedBox(width: 12),
          GestureDetector(
            onTap: () => _showDurationSheet(context),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                  color: kcMediumGrey.withOpacity(0.06),
                  borderRadius: BorderRadius.circular(8)),
              child: Row(children: [
                Text(vm.duration,
                    style: ktsCaption.copyWith(color: kcPrimaryText)),
                const SizedBox(width: 8),
                const Icon(Icons.keyboard_arrow_down, size: 16),
              ]),
            ),
          ),
          const Spacer(),
        ],
      ),
    ]);
  }

  void _showDurationSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (_) => Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
            color: kcDarkGreyColor,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          ListTile(
              title: const Text('7d'),
              onTap: () {
                vm.chooseDuration('7d');
                Navigator.pop(context);
              }),
          ListTile(
              title: const Text('30d'),
              onTap: () {
                vm.chooseDuration('30d');
                Navigator.pop(context);
              }),
          ListTile(
              title: const Text('90d'),
              onTap: () {
                vm.chooseDuration('90d');
                Navigator.pop(context);
              }),
        ]),
      ),
    );
  }
}

/// Very simple custom line chart using CustomPainter
class _SimpleLineChart extends StatelessWidget {
  final List<double> data;
  const _SimpleLineChart({required this.data});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _LineChartPainter(data),
      size: Size.infinite,
    );
  }
}

class _LineChartPainter extends CustomPainter {
  final List<double> data;
  _LineChartPainter(this.data);

  @override
  void paint(Canvas canvas, Size size) {
    if (data.isEmpty) return;
    final paintLine = Paint()
      ..color = const Color(0xFF17B26A)
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke
      ..isAntiAlias = true;

    final paintFill = Paint()
      ..color = const Color(0xFF17B26A).withOpacity(0.12)
      ..style = PaintingStyle.fill;

    final paddingLeft = 8.0;
    final paddingRight = 8.0;
    final paddingTop = 8.0;
    final paddingBottom = 24.0;

    final w = size.width - paddingLeft - paddingRight;
    final h = size.height - paddingTop - paddingBottom;

    final maxVal = data.reduce((a, b) => a > b ? a : b);
    final minVal = data.reduce((a, b) => a < b ? a : b);
    final range = (maxVal - minVal) == 0 ? 1 : (maxVal - minVal);

    final points = <Offset>[];
    for (var i = 0; i < data.length; i++) {
      final x = paddingLeft + (w * i / (data.length - 1));
      final y = paddingTop + h - ((data[i] - minVal) / range * h);
      points.add(Offset(x, y));
    }

    // draw fill
    final path = Path()..moveTo(points.first.dx, size.height - paddingBottom);
    for (var p in points) {
      path.lineTo(p.dx, p.dy);
    }
    path.lineTo(points.last.dx, size.height - paddingBottom);
    path.close();
    canvas.drawPath(path, paintFill);

    // draw line
    final path2 = Path()..moveTo(points.first.dx, points.first.dy);
    for (var p in points.skip(1)) path2.lineTo(p.dx, p.dy);
    canvas.drawPath(path2, paintLine);

    // y-axis ticks & labels (3 ticks)
    final textPainter = TextPainter(textDirection: TextDirection.ltr);
    for (var i = 0; i < 3; i++) {
      final val = (minVal + range * (2 - i) / 2);
      final dy = paddingTop + h * (i / 2);
      textPainter.text = TextSpan(
          text: val.toStringAsFixed(0),
          style: ktsCaption.copyWith(color: kcSecondaryText));
      textPainter.layout();
      textPainter.paint(canvas, Offset(0, dy - textPainter.height / 2));
    }
  }

  @override
  bool shouldRepaint(covariant _LineChartPainter oldDelegate) =>
      oldDelegate.data != data;
}
