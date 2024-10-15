import 'dart:async'; 
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:battery_plus/battery_plus.dart';

class BatteryMonitorWidget extends StatefulWidget {
  const BatteryMonitorWidget({super.key});

  @override
  _BatteryMonitorWidgetState createState() => _BatteryMonitorWidgetState();
}

class _BatteryMonitorWidgetState extends State<BatteryMonitorWidget> {
  final Battery battery = Battery();
  final AudioPlayer audioPlayer = AudioPlayer();
  int batteryLevel = 0;
  late Timer batteryLevelTimer;

  @override
  void initState() {
    super.initState();

    batteryLevelTimer = Timer.periodic(const Duration(seconds: 30), (timer) {
      getBatteryLevel();
    });

    getBatteryLevel();
  }

  Future<void> getBatteryLevel() async {
    final int batteryLvl = await battery.batteryLevel;
    setState(() {
      batteryLevel = batteryLvl;
    });

    if (batteryLvl < 20) {
      playLowBatterySound();
    }
  }

  void playLowBatterySound() async {
    AssetSource source = AssetSource('audios/low_battery.mp3');
    await audioPlayer.setSource(source);
    await audioPlayer.play(source);
  }

  @override
  void dispose() {
    batteryLevelTimer.cancel();
    super.dispose();
  }

  IconData getBatteryIcon() {
    if (batteryLevel >= 99) {
      return Icons.battery_full;
    } else if (batteryLevel >= 90) {
      return Icons.battery_6_bar;
    } else if (batteryLevel >= 75) {
      return Icons.battery_5_bar;
    } else if (batteryLevel >= 50) {
      return Icons.battery_4_bar;
    } else if (batteryLevel >= 25) {
      return Icons.battery_3_bar;
    } else if (batteryLevel >= 10) {
      return Icons.battery_2_bar;
    } else {
      return Icons.battery_1_bar; 
    }
  }

  @override
  Widget build(BuildContext context) {
    Color iconColor;
    if (batteryLevel < 20) {
      iconColor = Colors.red; 
    } else {
      iconColor = Colors.green; 
    }

    return Row(
      children: [
        Transform.rotate(
          angle: 3.14 / 2,
          child: Icon(
            getBatteryIcon(),
            size: 62.0,
            color: iconColor, 
          ),
        ),
        const SizedBox(width: 8),
      ],
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    getBatteryLevel(); 
  }
}
