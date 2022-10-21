import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String title, value;
  const CustomCard({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12.r),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15.sp),
              ),
              Text(
                value,
                style: TextStyle(fontSize: 15.sp),
              ),
            ],
          ),
          SizedBox(
            height: 5.h,
          ),
          Divider(
            thickness: 1.5.h,
          )
        ],
      ),
    );
  }
}
