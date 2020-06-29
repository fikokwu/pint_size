import 'dart:async';

class DashboardBlock {
   DateTime selectedDate = DateTime.now();

   StreamController<DateTime> _dataStreamController = StreamController<DateTime>();

   Stream<DateTime> get dataStream => _dataStreamController.stream;

   previousMonth(){
    selectedDate = selectedDate.subtract(Duration(days:1, hours: 730));
    _dataStreamController.add(selectedDate);

  }

  nextMonth() {
    selectedDate = selectedDate.add(Duration(days:1, hours: 730));
     _dataStreamController.sink.add(selectedDate);

  }

   dispose() {
     _dataStreamController.close();
   }
}