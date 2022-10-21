import 'package:covid_19_app/src/widget/custom_card.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class CountryDetails extends StatelessWidget {
  final data;
  const CountryDetails({Key? key, required this.data}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(data["country"]),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 50.h,
            ),
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 80.h, left: 10.w, right: 10.w),
                  child: Card(
                    child: Padding(
                      padding: EdgeInsets.only(top: 20.h),
                      child: Column(
                        children: [
                          CustomCard(
                              title: "Cases", value: data["cases"].toString()),
                          CustomCard(
                              title: "Today Cases",
                              value: data["todayCases"].toString()),
                          CustomCard(
                              title: "Today Death",
                              value: data["todayDeaths"].toString()),
                          CustomCard(
                              title: "Recovered",
                              value: data["recovered"].toString()),
                          CustomCard(
                              title: "Today Recovered",
                              value: data["todayRecovered"].toString()),
                          CustomCard(
                              title: "Death", value: data["deaths"].toString()),
                          CustomCard(
                              title: "Critical",
                              value: data["critical"].toString()),
                        ],
                      ),
                    ),
                  ),
                ),
                CircleAvatar(
                  radius: 60.r,
                  backgroundImage: NetworkImage(data["countryInfo"]["flag"]),
                )
              ],
            )
          ],
        ),
      )),
    );
  }
}
