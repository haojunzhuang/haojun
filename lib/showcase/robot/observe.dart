import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class LiveUpdatedObserveChart extends StatefulWidget {
  const LiveUpdatedObserveChart(this.data, {super.key});

  final int data;

  @override
  State<LiveUpdatedObserveChart> createState() => _ObserveAreaState();
}

class _ObserveAreaState extends State<LiveUpdatedObserveChart> {
  ChartSeriesController? _chartSeriesController;
  List<ChartSampleData>? chartData;
  int count = 0;

  @override
  void initState() {
    count = 1;
    chartData = <ChartSampleData>[
      ChartSampleData(x: 0, y: widget.data),
    ];
    super.initState();
  }

  @override
  void didUpdateWidget(covariant LiveUpdatedObserveChart oldWidget) {
    super.didUpdateWidget(oldWidget);
    addDataPoint(widget.data);
  }

  /// Add the data point into the line series
  void addDataPoint(int data) {
    chartData!.add(ChartSampleData(x: count, y: data));
    count = count + 1;

    _chartSeriesController?.updateDataSource(
      addedDataIndexes: <int>[chartData!.length - 1],
    );
  }

  /// Returns the chart with add and remove points options.
  SfCartesianChart _buildAddRemovePointsChart() {
    return SfCartesianChart(
      plotAreaBorderWidth: 0,
      primaryXAxis: NumericAxis(
          majorGridLines: const MajorGridLines(width: 0),
          edgeLabelPlacement: EdgeLabelPlacement.shift),
      primaryYAxis: NumericAxis(
          axisLine: const AxisLine(width: 0),
          majorTickLines: const MajorTickLines(size: 0)),
      series: _getAddRemovePointSeries(),
    );
  }

  /// Returns the list of chart series which need to render
  /// on the chart with add and remove points.
  List<LineSeries<ChartSampleData, num>> _getAddRemovePointSeries() {
    return <LineSeries<ChartSampleData, num>>[
      LineSeries<ChartSampleData, num>(
          onRendererCreated: (ChartSeriesController controller) {
            _chartSeriesController = controller;
          },
          animationDuration: 0,
          dataSource: chartData!,
          xValueMapper: (ChartSampleData sales, _) => sales.x as num,
          yValueMapper: (ChartSampleData sales, _) => sales.y,
          width: 2),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return _buildAddRemovePointsChart();
  }
}

///Chart sample data
class ChartSampleData {
  /// Holds the datapoint values like x, y, etc.,
  ChartSampleData(
      {this.x,
      this.y,
      this.xValue,
      this.yValue,
      this.secondSeriesYValue,
      this.thirdSeriesYValue,
      this.pointColor,
      this.size,
      this.text,
      this.open,
      this.close,
      this.low,
      this.high,
      this.volume});

  /// Holds x value of the datapoint
  final dynamic x;

  /// Holds y value of the datapoint
  final num? y;

  /// Holds x value of the datapoint
  final dynamic xValue;

  /// Holds y value of the datapoint
  final num? yValue;

  /// Holds y value of the datapoint(for 2nd series)
  final num? secondSeriesYValue;

  /// Holds y value of the datapoint(for 3nd series)
  final num? thirdSeriesYValue;

  /// Holds point color of the datapoint
  final Color? pointColor;

  /// Holds size of the datapoint
  final num? size;

  /// Holds datalabel/text value mapper of the datapoint
  final String? text;

  /// Holds open value of the datapoint
  final num? open;

  /// Holds close value of the datapoint
  final num? close;

  /// Holds low value of the datapoint
  final num? low;

  /// Holds high value of the datapoint
  final num? high;

  /// Holds open value of the datapoint
  final num? volume;
}
