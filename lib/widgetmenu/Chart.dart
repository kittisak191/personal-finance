import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';


class Chart extends StatefulWidget {

  @override
  _ChartState createState() => _ChartState();
}
  
class _ChartState extends State<Chart> {
    late List<GDPData> _chartData;
    late TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
    _chartData = getChartData();
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
      appBar: AppBar(
        title: Text("Chart",
        style: TextStyle(
          fontSize: 45,
          fontFamily: 'Nongnew'
          ),
        ),
        backgroundColor: Colors.orange,
        centerTitle: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
          ),
      ),
      body: SfCircularChart(
        legend: Legend(isVisible: true,
        overflowMode: LegendItemOverflowMode.wrap
        ),
        tooltipBehavior: _tooltipBehavior,
        series: <CircularSeries>[
        PieSeries<GDPData, String>(
          dataSource: _chartData,
          xValueMapper: (GDPData data,_) => data.title,
          yValueMapper: (GDPData data,_) => data.money,
          dataLabelSettings: DataLabelSettings(isVisible:true),
          enableTooltip: true)
          ],
        ),
      )
    );
  }
  List<GDPData> getChartData() {
    final List<GDPData> chartData = [
      GDPData('Food', 1000),
      GDPData('Shirt', 2000),
      GDPData('Shoes', 2500),
      GDPData('Trousers', 3000),
      GDPData('Glasses', 5000),
      GDPData('Mobile phone', 15000),
    ];
    return chartData;
  }
}

class GDPData {
  GDPData(this.title, this.money);
  final String title;
  final int money;
}