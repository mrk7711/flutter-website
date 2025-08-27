import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class HearingAidStatusScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Hearing Aid Status"),
      //   backgroundColor: Color(0xFF9B35B6),
      //   centerTitle: true,
      // ),
      body: Padding(
        padding: EdgeInsets.all(width * 0.04),
        child: Column(
          children: [
            // Battery Card
            StatusCard(
              icon: Icons.battery_full,
              title: "Battery",
              value: "85%",
              color: Colors.green,
              progress: 0.55,
            ),
            StatusCard(
              icon: Icons.bluetooth,
              title: "Connection",
              value: "Demo",
              color: Color(0xFF48C9B0),
            ),
            StatusCard(
              icon: Icons.hearing,
              title: "Mode",
              value: "Noise Reduction",
              color: Colors.purple,
            ),
            StatusCard(
              icon: Icons.volume_up,
              title: "Volume",
              value: "5",
              color: Colors.blue,
              progress: 0.8,
            ),
            StatusCard(
              icon: Icons.noise_aware,
              title: "Noise Level",
              value: "1",
              color: Color(0xFFF06292),
              progress: 0.2,
            ),
            StatusCard(
              icon: Icons.update,
              title: "Software Version",
              value: "v1.0.0",
              color: Colors.orange,
            ),
          ],
        ),
      ),
    );
  }
}

class StatusCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;
  final Color color;
  final double? progress; // اگر بخوای progress نمایش بدی

  const StatusCard({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
    required this.color,
    this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 5,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Icon(icon, color: color, size: 40),
            SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.black87)),
                  SizedBox(height: 8),
                  progress != null
                      ? LinearProgressIndicator(
                    value: progress,
                    color: color,
                    backgroundColor: Colors.grey[300],
                    minHeight: 8,
                  )
                      : Text(value,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: color)),
                ],
              ),
            ),
            if (progress == null)
              Text(value,
                  style: TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w500, color: color)),
          ],
        ),
      ),
    );
  }
}
