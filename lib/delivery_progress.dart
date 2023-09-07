import 'package:flutter/material.dart';

class DeliveryProgressTracker extends StatefulWidget {
  const DeliveryProgressTracker({Key? key}) : super(key: key);

  @override
  State<DeliveryProgressTracker> createState() =>
      _DeliveryProgressTrackerState();
}

class _DeliveryProgressTrackerState extends State<DeliveryProgressTracker> {
  final String orderNumber = "BS87348748";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Item Travel History'),
          leading: BackButton(), // Add the BackButton widget here
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("ORDER NO. - $orderNumber"),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                      decoration: BoxDecoration(
                          color: Colors.blueAccent,
                          borderRadius: BorderRadius.circular(5)),
                      child: Center(child: Text('Tracking details')),
                    ),
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                buildTrackerContent(
                    iconData: Icons.gpp_good,
                    progressInfoText: 'ORDER PLACED',
                    progressDateText: 'April 10, 2023'),
                buildTrackerContent(
                    iconData: Icons.gpp_good,
                    progressInfoText: 'SHIPPED',
                    progressDateText: 'April 11, 2023'),
                buildTrackerContent(
                    iconData: Icons.gpp_good,
                    progressInfoText: 'DELIVERED',
                    progressDateText: 'April 13, 2023',
                    isToShowDivider: false,
                    isActive: false),
              ],
            ),
          ),
        ));
  }

  buildTrackerContent({
    required IconData iconData,
    bool isToShowDivider = true,
    bool isActive = true,
    required String progressInfoText,
    required String progressDateText,
  }) {
    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Icon(iconData),
                    SizedBox(
                      height: 5,
                    ),
                    isToShowDivider ? BrokenLineDivider() : Container(),
                  ],
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                      decoration: BoxDecoration(
                          color: Colors.blueAccent,
                          borderRadius: BorderRadius.circular(5)),
                      child: Center(child: Text(progressInfoText)),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(progressDateText)
                  ],
                )
              ],
            )
          ],
        ),
        Container(
          height: 90,
          color: isActive ? null : Colors.white.withOpacity(0.8),
        )
      ],
    );
  }
}

class BrokenLineDivider extends StatelessWidget {
  const BrokenLineDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      width: 20, // Adjust the width as needed
      child: CustomPaint(
        painter: _BrokenLinePainter(),
      ),
    );
  }
}

class _BrokenLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.grey // Color of the broken line
      ..strokeWidth = 2; // Thickness of the line

    final startY = 0.0;
    final endY = size.height;

    for (double y = startY; y < endY; y += 10) {
      canvas.drawLine(
          Offset(size.width / 2, y), Offset(size.width / 2, y + 4), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
