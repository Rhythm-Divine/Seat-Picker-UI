import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../utils/seatSelectionHelper.dart';
import '../utils/themeHelper.dart';

class ConfirmSelectionPage extends StatefulWidget {
  const ConfirmSelectionPage({super.key});

  @override
  State<ConfirmSelectionPage> createState() => _ConfirmSelectionPageState();
}

class _ConfirmSelectionPageState extends State<ConfirmSelectionPage> {
  @override
  Widget build(BuildContext context) {
    ThemeHelper themeProvider = Provider.of<ThemeHelper>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80.h,
        actions: [
          IconButton(
            onPressed: () => themeProvider.changeTheme(),
            padding: EdgeInsets.only(right: 15.w),
            iconSize: 30.sp,
            color: (themeProvider.themeMode == ThemeMode.light)
                ? Colors.white
                : Colors.black,
            icon: (themeProvider.themeMode == ThemeMode.light)
                ? const Icon(Icons.dark_mode)
                : const Icon(Icons.light_mode_outlined),
          ),
        ],
        leading: BackButton(
          color: (themeProvider.themeMode == ThemeMode.light)
              ? Colors.white
              : Colors.black,
        ),
        centerTitle: true,
        title: Text(
          "Ticket Confirmation",
          style: GoogleFonts.montserrat(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
              color: (themeProvider.themeMode == ThemeMode.light)
                  ? Colors.white
                  : Colors.black),
        ),
        backgroundColor: (themeProvider.themeMode == ThemeMode.light)
            ? const Color(0xff126DCA)
            : Color(0xffadb5bd),
      ),
      body: Container(
        // padding: const EdgeInsets.all(16.0),
        padding: EdgeInsets.symmetric(vertical: 8.h),
        child: Consumer<SelectionButtonProvider>(
          builder: (context, provider, child) {
            return (provider.selectedSeats.isEmpty)
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset(
                          "assets/images/aw.gif",
                          filterQuality: FilterQuality.high,
                          fit: BoxFit.cover,
                        ),
                        AnimatedTextKit(
                          animatedTexts: [
                            WavyAnimatedText(
                              'No Seats Selected',
                              textStyle: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.normal,
                                  letterSpacing: 3,
                                  color:
                                      themeProvider.themeMode == ThemeMode.light
                                          ? Colors.black
                                          : Colors.white,
                                  fontSize: 25.sp),
                              speed: const Duration(milliseconds: 200),
                            ),
                          ],
                          isRepeatingAnimation: true,
                        ),
                      ],
                    ),
                  )
                : Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          itemCount: provider.selectedSeats.length,
                          itemBuilder: (context, index) {
                            return Container(
                              decoration: BoxDecoration(
                                  color: (themeProvider.themeMode ==
                                          ThemeMode.light)
                                      ? Colors.blue[100]
                                      : Color(0xff212529),
                                  borderRadius: BorderRadius.circular(8.r)),
                              margin: EdgeInsets.symmetric(
                                  vertical: 8.h, horizontal: 6.w),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 6.w, vertical: 6.h),
                              width: MediaQuery.of(context).size.width,
                              height: 120.h,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Image.asset(
                                    "assets/images/download.png",
                                    color: (themeProvider.themeMode ==
                                            ThemeMode.light)
                                        ? Colors.black
                                        : Colors.white,
                                    filterQuality: FilterQuality.high,
                                    fit: BoxFit.cover,
                                  ),
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        "Seat Type",
                                        style: GoogleFonts.montserrat(
                                            letterSpacing: 1.5,
                                            fontSize: 16.sp,
                                            color: (themeProvider.themeMode ==
                                                    ThemeMode.light)
                                                ? Colors.black
                                                : Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                          "${provider.selectedSeats[index].seatType}",
                                          style: GoogleFonts.montserrat(
                                              letterSpacing: 1.5,
                                              fontSize: 16.sp,
                                              color: (themeProvider.themeMode ==
                                                      ThemeMode.light)
                                                  ? Colors.black54
                                                  : Color(0xffceeaff),
                                              fontWeight: FontWeight.bold))
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        "Seat Number",
                                        style: GoogleFonts.montserrat(
                                            letterSpacing: 1.5,
                                            fontSize: 16.sp,
                                            color: (themeProvider.themeMode ==
                                                    ThemeMode.light)
                                                ? Colors.black
                                                : Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                          "${provider.selectedSeats[index].seatIndex}",
                                          style: GoogleFonts.montserrat(
                                              fontSize: 16.sp,
                                              color: (themeProvider.themeMode ==
                                                      ThemeMode.light)
                                                  ? Colors.black54
                                                  : Color(0xffceeaff),
                                              fontWeight: FontWeight.bold))
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  );
          },
        ),
      ),
    );
  }
}
