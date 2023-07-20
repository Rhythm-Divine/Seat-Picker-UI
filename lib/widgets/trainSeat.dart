import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../models/seatModel.dart';
import '../utils/seatSelectionHelper.dart';
import '../utils/themeHelper.dart';

//To create seats for the cabin widget
class SeatWidget extends StatefulWidget {
  SeatWidget({
    Key? key,
    required this.seatIndex,
    required this.seatType,
    this.searchBarText,
  }) : super(key: ValueKey(seatIndex));

  final int seatIndex;
  final String seatType;

  final String? searchBarText;

  @override
  State<SeatWidget> createState() => _SeatWidgetState();
}

class _SeatWidgetState extends State<SeatWidget>
    with AutomaticKeepAliveClientMixin<SeatWidget> {
  @override
  bool get wantKeepAlive => true;
  Seat seat = Seat();

  @override
  void initState() {
    super.initState();
    seat = Seat(seatIndex: widget.seatIndex, seatType: widget.seatType);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    ThemeHelper themeProvider = Provider.of<ThemeHelper>(context, listen: true);
    return Consumer<SelectionButtonProvider>(
      builder: (context, provider, child) {
        //debugging
        // log("Seat ${seat.seatIndex} - ${provider.isSeatSelected(seat)}");
        return GestureDetector(
          onTap: () {
            if (provider.selectedSeats.contains(seat)) {
              provider.removeSeat(seat);
            } else {
              provider.addSeat(seat);
            }
          },
          child: Container(
            height: 60.h,
            width:
                seat.seatType == "Side Upper" || seat.seatType == "Side Lower"
                    ? 90.w
                    : 60.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              boxShadow: [
                BoxShadow(
                  color: (widget.searchBarText == widget.seatIndex.toString())
                      ? Colors.blue.withOpacity(0.5)
                      : Colors.transparent,
                  spreadRadius: 1.r,
                  blurRadius: 2.r,
                  offset: const Offset(0, 1),
                ),
              ],
              border: Border.all(
                color: (widget.searchBarText == widget.seatIndex.toString())
                    ? const Color(0xff126DCA)
                    : Colors.transparent,
                width: 2.w,
              ),
              color: (provider.selectedSeats.contains(seat))
                  ? const Color(0xff126DCA)
                  : (themeProvider.themeMode == ThemeMode.light)
                      ? const Color(0xffCEEAFF)
                      : const Color(0xff212529),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                seat.seatType == "Side Upper" ||
                        seat.seatIndex! % 8 == 4 ||
                        seat.seatIndex! % 8 == 5 ||
                        seat.seatIndex! % 8 == 6 ||
                        seat.seatIndex! % 8 == 0
                    ? _buildSeatTypeText(context, seat)
                    : _buildSeatIndexText(context, seat),
                const SizedBox(height: 4),
                seat.seatType == "Side Upper" ||
                        seat.seatIndex! % 8 == 4 ||
                        seat.seatIndex! % 8 == 5 ||
                        seat.seatIndex! % 8 == 6 ||
                        seat.seatIndex! % 8 == 0
                    ? _buildSeatIndexText(context, seat)
                    : _buildSeatTypeText(context, seat),
              ],
            ),
          ),
        );
      },
    );
  }

  //Returns the text widget to display seat number
  Widget _buildSeatIndexText(BuildContext context, Seat seat) {
    final provider = Provider.of<SelectionButtonProvider>(context);
    ThemeHelper themeProvider = Provider.of<ThemeHelper>(context, listen: true);
    return Text(
      seat.seatIndex.toString(),
      style: TextStyle(
        fontFamily: 'Quicksand',
        fontSize: 16.sp,
        overflow: TextOverflow.ellipsis,
        color: (provider.selectedSeats.contains(seat))
            ? const Color(0xffCEEAFF)
            : (themeProvider.themeMode == ThemeMode.light)
                ? Colors.black54
                : const Color(0xffceeaff),
        fontWeight: FontWeight.bold,
      ),
    );
  }

  //Returns the text widget to display seat number
  Widget _buildSeatTypeText(BuildContext context, Seat seat) {
    final provider = Provider.of<SelectionButtonProvider>(context);
    ThemeHelper themeProvider = Provider.of<ThemeHelper>(context, listen: true);
    return Text(
      seat.seatType.toString(),
      style: TextStyle(
        fontFamily: 'Quicksand',
        fontSize: 12.sp,
        overflow: TextOverflow.ellipsis,
        letterSpacing: 1,
        color: (provider.selectedSeats.contains(seat))
            ? const Color(0xffCEEAFF)
            : (themeProvider.themeMode == ThemeMode.light)
                ? Colors.black54
                : const Color(0xffceeaff),
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
