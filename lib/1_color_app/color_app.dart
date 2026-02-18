import 'package:flutter/material.dart';
import 'package:week4_advance_flutter/1_color_app/model/color_type.dart';
import 'package:week4_advance_flutter/1_color_app/service/color_service.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(body: Home()),
    ),
  );
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ColorService colorNotifier = ColorService();
  int _currentIndex = 0;
  void onIncrease(ColorType type) {
    colorNotifier.implementCount(type);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListenableBuilder(
        listenable: colorNotifier,
        builder: (context, child) {
          return _currentIndex == 0
              ? ColorTapsScreen(counts: colorNotifier.counts, onTap: onIncrease)
              : StatisticsScreen(counts: colorNotifier.counts);
        },
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.tap_and_play),
            label: 'Taps',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'Statistics',
          ),
        ],
      ),
    );
  }
}

class ColorTapsScreen extends StatelessWidget {
  final Map<ColorType, int> counts;
  final void Function(ColorType) onTap;

  const ColorTapsScreen({super.key, required this.counts, required this.onTap});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Color Taps')),
      body: Column(
        children: [
          ...ColorType.values.map((type) {
            return (ColorTap(
              type: type,
              onTap: () => onTap(type),
              tapCount: counts[type] ?? 0,
            ));
          }),
        ],
      ),
    );
  }
}

class ColorTap extends StatelessWidget {
  final ColorType type;
  final int tapCount;
  final VoidCallback onTap;

  const ColorTap({
    super.key,
    required this.type,
    required this.tapCount,
    required this.onTap,
  });

  Color get backgroundColor => type.color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(10),
        ),
        width: double.infinity,
        height: 100,
        child: Center(
          child: Text(
            'Taps: $tapCount',
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class StatisticsScreen extends StatelessWidget {
  final Map<ColorType, int> counts;

  const StatisticsScreen({super.key, required this.counts});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Statistics')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...ColorType.values.map((type) {
              return Text("Number of $type: ${counts[type] ?? 0}");
            }),
          ],
        ),
      ),
    );
  }
}
