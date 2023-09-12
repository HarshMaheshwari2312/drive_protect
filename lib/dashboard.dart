import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Calculate a base size based on the screen width
    final double baseSize = MediaQuery.of(context).size.width * 0.4;

    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard Page"),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Container(
                height: baseSize * 2, // Adjust height as needed
                alignment: Alignment.center,
                child: SfRadialGauge(
                  enableLoadingAnimation: true,
                  animationDuration: 4500,
                  axes: <RadialAxis>[
                    RadialAxis(
                      minimum: 0,
                      maximum: 180,
                      ranges: <GaugeRange>[
                        GaugeRange(startValue: 0, endValue: 60, color: Colors.green),
                        GaugeRange(startValue: 60, endValue: 120, color: Colors.orange),
                        GaugeRange(startValue: 120, endValue: 180, color: Colors.red),
                      ],
                      pointers: <GaugePointer>[
                        NeedlePointer(value: 100, enableAnimation: true),
                      ],
                    ),
                  ],
                ),
              ),
              Text("Speed", style: TextStyle(fontSize: 20)), // Add the text "Speed" here
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Arrange meters evenly
            children: [
              Expanded(
                child: Container(
                  height: baseSize, // Use the base size
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
              Expanded(
                child: Container(
                  height: baseSize, // Use the base size
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
        ],
      ),
    );
  }
}
