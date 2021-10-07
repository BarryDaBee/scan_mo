import 'package:call_log/call_log.dart';

// // GET WHOLE CALL LOG
// Iterable<CallLogEntry> entries = await CallLog.get();
//
// // QUERY CALL LOG (ALL PARAMS ARE OPTIONAL)
// var now = DateTime.now();
// int from = now.subtract(Duration(days: 60)).millisecondsSinceEpoch;
// int to = now.subtract(Duration(days: 30)).millisecondsSinceEpoch;
// Iterable<CallLogEntry> entries = await CallLog.query(
//   dateFrom: from,
//   dateTo: to,
//   durationFrom: 0,
//   durationTo: 60,
//   name: 'John Doe',
//   number: '901700000',
//   type: CallType.incoming,
// );
class CallLogService {
  Future<Iterable<CallLogEntry>> getCallLogs() async {
    var now = DateTime.now();
    // int from = now.subtract(Duration(days: 60)).millisecondsSinceEpoch;
    // int to = now.subtract(Duration(days: 30)).millisecondsSinceEpoch;
    Iterable<CallLogEntry> entries = await CallLog.get();
    print(entries.first.name);

    return entries;
  }
}
