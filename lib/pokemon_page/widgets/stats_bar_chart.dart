import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:formation_flutter/model/pokemon_stats.dart';

class StatsBarChart extends StatefulWidget {
  final PokemonStats stats;
  const StatsBarChart({
    Key? key,
    required this.stats,
  }) : super(key: key);

  @override
  State<StatsBarChart> createState() => _StatsBarChartState();
}

class _StatsBarChartState extends State<StatsBarChart> {
  double? _selectedValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (_selectedValue != null) Text("Valeur sélectionnée : $_selectedValue"),
        SizedBox(
          height: 200,
          child: BarChart(
            BarChartData(
              barTouchData: barTouchData,
              titlesData: titlesData,
              borderData: borderData,
              barGroups: barGroups,
              alignment: BarChartAlignment.spaceAround,
              gridData: FlGridData(
                show: false,
              ),
              maxY: 130,
            ),
          ),
        ),
      ],
    );
  }

  void didSelectBar({
    required double value,
  }) {
    setState(() {
      _selectedValue = value;
    });
  }

  BarTouchData get barTouchData => BarTouchData(
        enabled: false,
        touchCallback: (event, barTouchResponse) {
          if (!event.isInterestedForInteractions || barTouchResponse?.spot == null) {
            return;
          }

          didSelectBar(
            value: barTouchResponse!.spot!.touchedRodData.toY,
          );
        },
        touchTooltipData: BarTouchTooltipData(
          tooltipBgColor: Colors.transparent,
          tooltipPadding: const EdgeInsets.all(0),
          tooltipMargin: 1,
          getTooltipItem: (
            BarChartGroupData group,
            int groupIndex,
            BarChartRodData rod,
            int rodIndex,
          ) {
            return BarTooltipItem(
              rod.toY.round().toString(),
              const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.normal,
              ),
            );
          },
        ),
      );

  FlTitlesData get titlesData => FlTitlesData(
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            reservedSize: 40,
            showTitles: true,
            getTitlesWidget: (value, titleMeta) {
              switch (value.toInt()) {
                case 0:
                  return const StatsBarChartTitle(text: 'PV');
                case 1:
                  return const StatsBarChartTitle(text: 'Atq');
                case 2:
                  return const StatsBarChartTitle(text: 'Déf');
                case 3:
                  return const StatsBarChartTitle(text: 'Atq S.');
                case 4:
                  return const StatsBarChartTitle(text: 'Déf S.');
                case 5:
                  return const StatsBarChartTitle(text: 'Vitesse');
                default:
                  return const StatsBarChartTitle(text: '');
              }
            },
          ),
        ),
        leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
      );

  FlBorderData get borderData => FlBorderData(
        show: false,
      );

  List<BarChartGroupData> get barGroups => [
        StatsBarChartGroupData(
          x: 0,
          y: widget.stats.pv,
        ),
        StatsBarChartGroupData(
          x: 1,
          y: widget.stats.attack,
        ),
        StatsBarChartGroupData(
          x: 2,
          y: widget.stats.defense,
        ),
        StatsBarChartGroupData(
          x: 3,
          y: widget.stats.attacksp,
        ),
        StatsBarChartGroupData(
          x: 4,
          y: widget.stats.defensesp,
        ),
        StatsBarChartGroupData(
          x: 5,
          y: widget.stats.speed,
        ),
      ];
}

class StatsBarChartTitle extends StatelessWidget {
  final String text;

  const StatsBarChartTitle({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.normal,
          fontSize: 14,
        ),
      ),
    );
  }
}

class StatsBarChartGroupData extends BarChartGroupData {
  StatsBarChartGroupData({
    required int x,
    required double y,
  }) : super(
          x: x,
          barRods: [
            BarChartRodData(
              toY: y,
              gradient: const LinearGradient(colors: [
                Colors.red,
                Colors.grey,
              ]),
            ),
          ],
          showingTooltipIndicators: [0],
        );
}
