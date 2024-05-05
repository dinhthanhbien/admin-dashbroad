import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class TabTotalMonth extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Text(
            'TAB TỔNG THÁNG',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(height: 20.0),
        Expanded(
          child: ListView(
            children: [
              _buildCallResultChart(),
              SizedBox(height: 20.0),
              _buildRevenueComparisonChart(),
              SizedBox(height: 20.0),
              _buildTeamRevenueChart(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCallResultChart() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Tổng hợp kết quả gọi trong ngày',
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
        Container(
          height: 200.0,
          child: Chart(
            data: paiChartSelectionData,
          ),
        ),
      ],
    );
  }

  Widget _buildRevenueComparisonChart() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Tỷ lệ doanh thu so với các bạn trong team',
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
        Container(
          height: 200.0,
          child: Chart(
            data: paiChartSelectionData,
          ),
        ),
      ],
    );
  }

  Widget _buildTeamRevenueChart() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Tổng doanh thu của cả team',
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
        Container(
          height: 200.0,
          child: Chart(
            data: paiChartSelectionData,
          ),
        ),
      ],
    );
  }
}

class Chart extends StatelessWidget {
  final List<PieChartSectionData> data;

  const Chart({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PieChart(
      PieChartData(
        sectionsSpace: 0,
        centerSpaceRadius: 70,
        startDegreeOffset: -90,
        sections: data,
      ),
    );
  }
}

List<PieChartSectionData> paiChartSelectionData = [
  PieChartSectionData(
    color: Colors.blue,
    value: 25,
    showTitle: false,
    radius: 25,
  ),
  PieChartSectionData(
    color: Color(0xFF26E5FF),
    value: 20,
    showTitle: false,
    radius: 22,
  ),
  PieChartSectionData(
    color: Color(0xFFFFCF26),
    value: 10,
    showTitle: false,
    radius: 19,
  ),
  PieChartSectionData(
    color: Color(0xFFEE2727),
    value: 15,
    showTitle: false,
    radius: 16,
  ),
  PieChartSectionData(
    color: Colors.blue.withOpacity(0.1),
    value: 25,
    showTitle: false,
    radius: 13,
  ),
];
