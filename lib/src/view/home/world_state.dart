import 'package:covid_19_app/src/app/app_color.dart';
import 'package:covid_19_app/src/services/all_data.dart';
import 'package:covid_19_app/src/view/countries/countries.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pie_chart/pie_chart.dart';

import '../../model/all_data.dart';
import '../../widget/custom_button.dart';
import '../../widget/custom_card.dart';

class WorldStateSection extends StatefulWidget {
  const WorldStateSection({super.key});

  @override
  State<WorldStateSection> createState() => _WorldStateSectionState();
}

class _WorldStateSectionState extends State<WorldStateSection>
    with TickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(duration: const Duration(seconds: 3), vsync: this)
        ..repeat();

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AllDataServices allDataServices = AllDataServices();
    return Scaffold(
      // backgroundColor: Colors.black,
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: FutureBuilder(
                future: allDataServices.fetchAllData(),
                builder: (context, AsyncSnapshot<AllDataModel> snapshot) {
                  var data = snapshot.data;
                  if (!snapshot.hasData) {
                    return SpinKitFadingCircle(
                      color: Colors.white,
                      size: 50.r,
                      controller: _controller,
                    );
                  } else {
                    return SingleChildScrollView(
                      child: Column(
                        children: [
                          PieChart(
                            chartRadius: 150.r,
                            dataMap: {
                              "Total": double.parse(data!.cases.toString()),
                              "Recovered":
                                  double.parse(data.recovered.toString()),
                              "Deaths": double.parse(data.deaths.toString()),
                            },
                            chartValuesOptions: const ChartValuesOptions(
                                showChartValuesInPercentage: true),
                            legendOptions: const LegendOptions(
                                legendPosition: LegendPosition.right),
                            animationDuration:
                                const Duration(milliseconds: 1200),
                            chartType: ChartType.ring,
                            colorList: colorList,
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12.w),
                            child: Card(
                              elevation: 2,
                              child: Column(
                                children: [
                                  CustomCard(
                                    title: "Total",
                                    value: data.cases.toString(),
                                  ),
                                  CustomCard(
                                    title: "Deaths",
                                    value: data.deaths.toString(),
                                  ),
                                  CustomCard(
                                    title: "Recovered",
                                    value: data.recovered.toString(),
                                  ),
                                  CustomCard(
                                    title: "Active",
                                    value: data.active.toString(),
                                  ),
                                  CustomCard(
                                    title: "Critical",
                                    value: data.critical.toString(),
                                  ),
                                  CustomCard(
                                    title: "Todays Deaths",
                                    value: data.todayDeaths.toString(),
                                  ),
                                  CustomCard(
                                    title: "Todays Recovered",
                                    value: data.todayRecovered.toString(),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          CustomButton(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CountryList()));
                            },
                            title: "Track Countries",
                          )
                        ],
                      ),
                    );
                  }
                }),
          ),
        ],
      )),
    );
  }
}
