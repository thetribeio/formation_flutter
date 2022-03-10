import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:formation_flutter/models/pokemon_stats.dart';

class StateBarChart extends StatelessWidget {
  final int id;
   StateBarChart({Key? key, required this.id}) : super(key: key);

  List<PokemonStats>  pokemonsStats = [
    PokemonStats(45, 49, 49, 65, 65, 45),
    PokemonStats(60, 62, 63, 80, 80, 60),
    PokemonStats(80, 82, 83, 100, 100, 80),
    PokemonStats(39, 52, 43, 60, 50, 65),
    PokemonStats(58, 64, 58, 80, 65, 80),
    PokemonStats(78, 84, 78, 109, 85, 100),
    PokemonStats(44, 48, 65, 50, 64, 43),
    PokemonStats(59, 63, 80, 65, 80, 58),
    PokemonStats(79, 83, 100, 85, 105, 78)
  ];

  @override
  Widget build(BuildContext context) {
    return BarChart(
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
    );
  }

  BarTouchData get barTouchData => BarTouchData(
        enabled: false,
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
              rod.y.round().toString(),
              const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.normal,
              ),
            );
          },
        ),
      );

  FlTitlesData get titlesData => FlTitlesData(
        show: true,
        bottomTitles: SideTitles(
          showTitles: true,
          getTextStyles: (context, value) => const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.normal,
            fontSize: 14,
          ),
          margin: 5,
          getTitles: (double value) {
            switch (value.toInt()) {
              case 0:
                return 'PV';
              case 1:
                return 'Atq';
              case 2:
                return 'Déf';
              case 3:
                return 'Atq spé';
              case 4:
                return 'Déf spé';
              case 5:
                return 'Vitesse';
              default:
                return '';
            }
          },
        ),
        leftTitles: SideTitles(showTitles: false),
        topTitles: SideTitles(showTitles: false),
        rightTitles: SideTitles(showTitles: false),
      );

  FlBorderData get borderData => FlBorderData(
        show: false,
      );

  List<BarChartGroupData> get barGroups => [
        BarChartGroupData(
          x: 0,
          barRods: [
            BarChartRodData(y: pokemonsStats[id - 1].pv, colors: [Colors.red, Colors.grey])
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 1,
          barRods: [
            BarChartRodData(y: pokemonsStats[id - 1].attaque, colors: [Colors.red, Colors.grey])
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 2,
          barRods: [
            BarChartRodData(y: pokemonsStats[id - 1].defense, colors: [Colors.red, Colors.grey])
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 3,
          barRods: [
            BarChartRodData(y: pokemonsStats[id - 1].attaquesp, colors: [Colors.red, Colors.grey])
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 4,
          barRods: [
            BarChartRodData(y: pokemonsStats[id - 1].defensesp, colors: [Colors.red, Colors.grey])
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 5,
          barRods: [
            BarChartRodData(y: pokemonsStats[id - 1].vitesse, colors: [Colors.red, Colors.grey])
          ],
          showingTooltipIndicators: [0],
        ),
      ];
}
