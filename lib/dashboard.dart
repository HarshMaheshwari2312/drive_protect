import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard Page"),
      ),
      body: Stack(
        children: [
          Positioned(
            top: 10,
            left: 0,
            child: Container(
              width: 200,
              height: 200,
              child: SfRadialGauge(
                enableLoadingAnimation: true,
                animationDuration: 4500,
                axes: <RadialAxis>[
                  RadialAxis(
                    minimum: 0,
                    maximum: 150,
                    ranges: <GaugeRange>[
                      GaugeRange(startValue: 0, endValue: 50, color: Colors.green),
                      GaugeRange(startValue: 50, endValue: 100, color: Colors.orange),
                      GaugeRange(startValue: 100, endValue: 150, color: Colors.red),
                    ],
                    pointers: <GaugePointer>[
                      NeedlePointer(value: 100, enableAnimation: true),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 10,
            right: 0, // Position it to the right side
            child: Container(
              width: 200,
              height: 200,
              child: SfRadialGauge(
                enableLoadingAnimation: true,
                animationDuration: 4500,
                axes: <RadialAxis>[
                  RadialAxis(
                    minimum: 0,
                    maximum: 100, // Adjust max value as needed
                    ranges: <GaugeRange>[
                      GaugeRange(startValue: 0, endValue: 25, color: Colors.green),
                      GaugeRange(startValue: 25, endValue: 50, color: Colors.orange),
                      GaugeRange(startValue: 50, endValue: 75, color: Colors.yellow),
                      GaugeRange(startValue: 75, endValue: 100, color: Colors.red),
                    ],

                    pointers: <GaugePointer>[
                      NeedlePointer(value: 50, enableAnimation: true),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
