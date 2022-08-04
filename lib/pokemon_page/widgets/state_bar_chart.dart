import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:formation_flutter/model/pokemon_stats.dart';

//TODO Transformer ce widget en StatefulWidget
class StateBarChart extends StatelessWidget {
  final PokemonStats stats;
  const StateBarChart({
    Key? key,
    required this.stats,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          "Valeur sélectionnée : 12", // TODO Remplacer 12 par une valeur du State
        ),
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
    // TODO Mettre à jour la valeur affichée dans le Text
  }

  BarTouchData get barTouchData => BarTouchData(
        enabled: false,
        touchCallback: (event, barTouchResponse) {
          if (!event.isInterestedForInteractions ||
              barTouchResponse?.spot == null) {
            return;
          }

          didSelectBar(
            value: barTouchResponse!.spot!.touchedRodData.y,
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
            BarChartRodData(
              y: stats.pv,
              colors: [Colors.red, Colors.grey],
            ),
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 1,
          barRods: [
            BarChartRodData(
              y: stats.attack,
              colors: [Colors.red, Colors.grey],
            ),
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 2,
          barRods: [
            BarChartRodData(
              y: stats.defense,
              colors: [Colors.red, Colors.grey],
            ),
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 3,
          barRods: [
            BarChartRodData(
              y: stats.attacksp,
              colors: [Colors.red, Colors.grey],
            ),
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 4,
          barRods: [
            BarChartRodData(
              y: stats.defensesp,
              colors: [Colors.red, Colors.grey],
            ),
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 5,
          barRods: [
            BarChartRodData(
              y: stats.speed,
              colors: [Colors.red, Colors.grey],
            ),
          ],
          showingTooltipIndicators: [0],
        ),
      ];
}
