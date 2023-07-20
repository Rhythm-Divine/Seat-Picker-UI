// ignore_for_file: file_names, avoid_unnecessary_containers, sized_box_for_whitespace
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/themeHelper.dart';
import '../widgets/trainCabin.dart';
import 'confirmScreen.dart';

class SelectionButtonPage extends StatefulWidget {
  const SelectionButtonPage({super.key});

  @override
  State<SelectionButtonPage> createState() => _SelectionButtonPageState();
}

class _SelectionButtonPageState extends State<SelectionButtonPage> {
  String? searchText;
  TextEditingController searchController = TextEditingController();


  @override
  void dispose() {
    
    super.dispose();
    searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ThemeHelper themeProvider = Provider.of<ThemeHelper>(context, listen: true);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(150.h),
        child: AppBar(
          backgroundColor: (themeProvider.themeMode == ThemeMode.light)
              ? Colors.white
              : Colors.black,
          actions: [
            IconButton(
              onPressed: () => themeProvider.changeTheme(),
              padding:
                  EdgeInsets.only(left: 0, bottom: 0, right: 15.w, top: 30.h),
              iconSize: 30.h,
              color: (themeProvider.themeMode == ThemeMode.light)
                  ? Colors.white
                  : Colors.black,
              icon: (themeProvider.themeMode == ThemeMode.light)
                  ? const Icon(Icons.dark_mode)
                  : const Icon(Icons.light_mode_outlined),
            ),
          ],
          flexibleSpace: ClipPath(
              child: Container(
            child: Stack(
              children: [
                Container(
                  child: ClipPath(
                    clipper: BannerClipper(),
                    child: Container(
                      color: (themeProvider.themeMode == ThemeMode.light)
                          ? const Color(0xffCEEAFF)
                          : const Color(0xff212529),
                      height: 200.h,
                    ),
                  ),
                ),
                ClipPath(
                  clipper: BannerClipper(),
                  child: Container(
                    color: (themeProvider.themeMode == ThemeMode.light)
                        ? const Color(0xff126DCA)
                        : const Color(0xffadb5bd),
                    height: 180.h,
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 20.w,right: 40.w),
                      child: Text(
                        "Choose Your Seats",
                        style: GoogleFonts.dancingScript(
                            fontSize: 40.sp,
                            fontWeight: FontWeight.bold,
                            color: (themeProvider.themeMode == ThemeMode.light)
                                ? Colors.white
                                : Colors.black,
                            letterSpacing: 1.5),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0.w, vertical: 8.0.h),
        child: FloatingActionButton.extended(
          onPressed: () {
            Navigator.of(context).push(
              CupertinoPageRoute(
                builder: (context) => const ConfirmSelectionPage(),
              ),
            );
          },
          backgroundColor: (themeProvider.themeMode == ThemeMode.light)
              ? const Color(0xff126DCA)
              : const Color(0xffadb5bd),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
          ),
          label: Text(
            "Confirm Selection",
            style: TextStyle(
                fontSize: 16.sp,
                fontFamily: 'Quicksand',
                fontWeight: FontWeight.bold,
                color: themeProvider.themeMode == ThemeMode.light
                    ? Colors.white
                    : Colors.black),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0.h),
        child: Column(
          children: [
            Container(
              height: 50.h,
              child: TextFormField(
                controller: searchController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(
                      left: 10.w, right: 10.w, top: 10.h, bottom: 10.h),
                  hintText: "Search",
                  hintStyle: TextStyle(
                      letterSpacing: 1.5,
                      fontFamily: 'Quicksand',
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold),
                  prefixIcon: const Icon(Icons.search),
                  iconColor: themeProvider.themeMode == ThemeMode.light
                      ? Colors.black
                      : Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8.r),
                    ),
                  ),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () {
                      searchController.clear();
                      SystemChannels.textInput.invokeMethod('TextInput.hide');
                      FocusScope.of(context).unfocus();
                    },
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.h),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Builder(
                    builder: (context) => CabinWidget(
                      index: index,
                      searchBarText: searchController.text,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BannerClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    debugPrint(size.width.toString());

    var path = Path();
    path.lineTo(0, size.height); //start point

    var firstStart = Offset(
        size.width / 5, size.height); //fist point of quadratic bezier curve

    var firstEnd = Offset(size.width / 2.45,
        size.height - 30.0.h); //second point of quadratic bezier curve)

    path.quadraticBezierTo(
        firstStart.dx, firstStart.dy, firstEnd.dx, firstEnd.dy);

    var secondStart =
        Offset(size.width - (size.width / 3.24), size.height - 80.h);

//third point of quadratic bezier curve

    var secondEnd = Offset(size.width, size.height);

    path.quadraticBezierTo(
        secondStart.dx, secondStart.dy, secondEnd.dx, secondEnd.dy);
    path.lineTo(size.width, 0);
    path.close();
    return path;
//fourth point of quadratic bezier curve
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
