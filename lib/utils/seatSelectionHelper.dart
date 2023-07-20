// ignore_for_file: prefer_final_fields, file_names

import 'package:flutter/material.dart';
import '../models/seatModel.dart';
class SelectionButtonProvider with ChangeNotifier {
  List<Seat> _selectedSeats = [];

  List<Seat> get selectedSeats => _selectedSeats;

  void addSeat(Seat seat) {
    _selectedSeats.add(seat);
    notifyListeners();
  }

  void removeSeat(Seat seat) {
    _selectedSeats.remove(seat);
    notifyListeners();
  }

  bool isSeatSelected(Seat seat) {
    return _selectedSeats.contains(seat);
  }
}
