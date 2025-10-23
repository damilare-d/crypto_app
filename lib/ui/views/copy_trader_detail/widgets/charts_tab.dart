import 'package:flutter/material.dart';

import '../../../common/app_colors.dart';
import '../../../common/text_styles.dart';

class TraderChartSection extends StatelessWidget {
  final List<double> data;
  final String duration;
  final VoidCallback onDurationTap;
  const TraderChartSection(
      {super.key,
      required this.data,
      required this.duration,
      required this.onDurationTap});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(children: [
        Text('Copy trader PNL',
            style: ktsBodyText.copyWith(color: kcPrimaryText)),
        const Spacer(),
        GestureDetector(
          onTap: onDurationTap,
          child: Row(children: [
            Text(duration, style: ktsCaption.copyWith(color: kcSecondaryText)),
            const SizedBox(width: 6),
            const Icon(Icons.keyboard_arrow_down, size: 16),
          ]),
        ),
      ]),
      const SizedBox(height: 12),
      Container(
        height: 200,
        width: double.infinity,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
            color: kcDarkGreyColor, borderRadius: BorderRadius.circular(12)),
        child: _SimpleLineChart(data: data),
      ),
      const SizedBox(height: 12),
    ]);
  }
}

class _SimpleLineChart extends StatelessWidget {
  final List<double> data;
  const _SimpleLineChart({required this.data});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(painter: _LineChartPainter(data), size: Size.infinite);
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

    final padding = 8.0;
    final w = size.width - padding * 2;
    final h = size.height - padding * 2 - 20; // leave bottom for labels

    final maxVal = data.reduce((a, b) => a > b ? a : b);
    final minVal = data.reduce((a, b) => a < b ? a : b);
    final range = (maxVal - minVal) == 0 ? 1 : maxVal - minVal;

    final points = <Offset>[];
    for (var i = 0; i < data.length; i++) {
      final dx = padding + (w * i / (data.length - 1));
      final dy = padding + h - ((data[i] - minVal) / range * h);
      points.add(Offset(dx, dy));
    }

    // fill path
    final path = Path()..moveTo(points.first.dx, size.height - padding - 20);
    for (var p in points) path.lineTo(p.dx, p.dy);
    path.lineTo(points.last.dx, size.height - padding - 20);
    path.close();
    canvas.drawPath(path, paintFill);

    // line path
    final path2 = Path()..moveTo(points.first.dx, points.first.dy);
    for (var p in points.skip(1)) path2.lineTo(p.dx, p.dy);
    canvas.drawPath(path2, paintLine);
  }

  @override
  bool shouldRepaint(covariant _LineChartPainter oldDelegate) =>
      oldDelegate.data != data;
}
