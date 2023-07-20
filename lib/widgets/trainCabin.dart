// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:seat_picker_ui/widgets/trainSeat.dart';
import '../utils/seatClipper.dart';
import '../utils/themeHelper.dart';

class CabinWidget extends StatelessWidget {
  const CabinWidget({
    super.key,
    required this.index,
    this.searchBarText,
  });

  final int index;
  final String? searchBarText;

  @override
  Widget build(BuildContext context) {
    ThemeHelper themeProvider = Provider.of<ThemeHelper>(context, listen: true);
    return Column(
      children: [
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    ClipPath(
                      clipper: MyCustomCliperFromTop(),
                      child: Container(
                        height: 60.h,
                        width: 200.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.r),
                          color: (themeProvider.themeMode == ThemeMode.light)
                              ? const Color(0xff80CBFF)
                              : const Color(0xffadb5bd),
                        ),
                      ),
                    ),
                    //Cabin Widget orientation
                    Padding(
                      padding: EdgeInsets.only(top: 5.h),
                      child: Row(
                        children: [
                          SeatWidget(
                            searchBarText: searchBarText,
                            seatIndex: 1 + index * 8,
                            seatType: "Lower",
                          ),
                          SizedBox(
                            width: 2.w,
                          ),
                          SeatWidget(
                            searchBarText: searchBarText,
                            seatIndex: 2 + index * 8,
                            seatType: "Middle",
                          ),
                          SizedBox(
                            width: 2.w,
                          ),
                          SeatWidget(
                            searchBarText: searchBarText,
                            seatIndex: 3 + index * 8,
                            seatType: "Upper",
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    ClipPath(
                      clipper: MyCustomCliperFromTop(),
                      child: Container(
                        height: 60.h,
                        width: 100.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.r),
                          color: (themeProvider.themeMode == ThemeMode.light)
                              ? const Color(0xff80CBFF)
                              : const Color(0xffadb5bd),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5.h),
                      child: SeatWidget(
                        searchBarText: searchBarText,
                        seatIndex: 7 + index * 8,
                        seatType: "Side Lower",
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 16.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    ClipPath(
                      clipper: MyCustomCliperFromBottom(),
                      child: Container(
                        height: 60.h,
                        width: 200.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.r),
                          color: (themeProvider.themeMode == ThemeMode.light)
                              ? const Color(0xff80CBFF)
                              : const Color(0xffadb5bd),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 5.h),
                      child: Row(
                        children: [
                          SeatWidget(
                            searchBarText: searchBarText,
                            seatIndex: 4 + index * 8,
                            seatType: "Lower",
                          ),
                          SizedBox(
                            width: 2.w,
                          ),
                          SeatWidget(
                            searchBarText: searchBarText,
                            seatIndex: 5 + index * 8,
                            seatType: "Middle",
                          ),
                          SizedBox(
                            width: 2.w,
                          ),
                          SeatWidget(
                            searchBarText: searchBarText,
                            seatIndex: 6 + index * 8,
                            seatType: "Upper",
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    ClipPath(
                      clipper: MyCustomCliperFromBottom(),
                      child: Container(
                        height: 60.h,
                        width: 100.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.r),
                          color: (themeProvider.themeMode == ThemeMode.light)
                              ? const Color(0xff80CBFF)
                              : const Color(0xffadb5bd),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 5.h),
                      child: SeatWidget(
                        searchBarText: searchBarText,
                        seatIndex: 8 + index * 8,
                        seatType: "Side Upper",
                      ),
                    ),
                  ],
                ),
              ],
            ),
            // Divider(color: const Color(0xff126DCA),),
          ],
        ),
        SizedBox(height: 2.h),
      ],
    );
  }
}
