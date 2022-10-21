import 'package:covid_19_app/src/view/countries/details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../services/all_data.dart';

class CountryList extends StatefulWidget {
  CountryList({super.key});

  @override
  State<CountryList> createState() => _CountryListState();
}

class _CountryListState extends State<CountryList> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    AllDataServices allDataServices = AllDataServices();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
      ),
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
            child: TextFormField(
              onChanged: (value) {
                setState(() {});
              },
              controller: searchController,
              decoration: InputDecoration(
                  hintText: "Search with country name",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.r))),
            ),
          ),
          Expanded(
            child: FutureBuilder(
              future: allDataServices.countryData(),
              builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
                if (!snapshot.hasData) {
                  return ListView.builder(
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return Shimmer.fromColors(
                          baseColor: Colors.grey.shade700,
                          highlightColor: Colors.grey.shade100,
                          child: Padding(
                            padding: EdgeInsets.all(8.r),
                            child: Column(
                              children: [
                                ListTile(
                                  title: Container(
                                    height: 10,
                                    width: 89,
                                    color: Colors.white,
                                  ),
                                  subtitle: Container(
                                    height: 10,
                                    width: 89,
                                    color: Colors.white,
                                  ),
                                  leading: Container(
                                    height: 60,
                                    width: 69,
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      });
                } else {
                  return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        var data = snapshot.data![index];
                        String name = data["country"];
                        if (searchController.text.isEmpty) {
                          return Padding(
                            padding: EdgeInsets.all(8.r),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            CountryDetails(data: data)));
                              },
                              child: Column(
                                children: [
                                  ListTile(
                                    title: Text(data["country"]),
                                    subtitle: Text(data["cases"].toString()),
                                    leading: Image(
                                        height: 60.h,
                                        width: 60.w,
                                        image: NetworkImage(
                                            data["countryInfo"]["flag"])),
                                  )
                                ],
                              ),
                            ),
                          );
                        } else if (name
                            .toLowerCase()
                            .contains(searchController.text.toLowerCase())) {
                          return Padding(
                            padding: EdgeInsets.all(8.r),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            CountryDetails(data: data)));
                              },
                              child: Column(
                                children: [
                                  ListTile(
                                    title: Text(data["country"]),
                                    subtitle: Text(data["cases"].toString()),
                                    leading: Image(
                                        height: 60.h,
                                        width: 60.w,
                                        image: NetworkImage(
                                            data["countryInfo"]["flag"])),
                                  )
                                ],
                              ),
                            ),
                          );
                        }

                        return Container();
                      });
                }
              },
            ),
          )
        ],
      )),
    );
  }
}
