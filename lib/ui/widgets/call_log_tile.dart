import 'package:call_log/call_log.dart';
import 'package:scan_mo/core/exports.dart';

class CallLogTile extends StatelessWidget {
  final CallLogEntry callLogEntry;
  const CallLogTile({
    Key key,
    this.callLogEntry,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(callLogEntry.simDisplayName);
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                getCallIcon() ?? SizedBox(),
                SizedBox(width: 5.w),
                CustomText(
                  callLogEntry.name ?? callLogEntry.number,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ],
            ),
            Row(
              children: [
                SvgPicture.asset('sim'.svg),
                SizedBox(width: 10.w),
                CustomText(
                  callLogEntry.number,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFFC8C4EB),
                ),
              ],
            ),
          ],
        ),
        Spacer(),
        CustomText(
          '${convertToAgo(
            DateTime.fromMillisecondsSinceEpoch(callLogEntry.timestamp),
          )}',
          fontWeight: FontWeight.w400,
          fontSize: 12,
          color: Color(0xFFC8C4EB),
        ),
        SizedBox(width: 10.w),
        SvgPicture.asset('info_square'.svg),
      ],
    );
  }

  getCallIcon() {
    switch (callLogEntry.callType) {
      case CallType.incoming:
        return SvgPicture.asset(
          'incoming_arrow'.svg,
          color: Colors.blue,
        );
      case CallType.outgoing:
        return SvgPicture.asset(
          'missed_call'.svg,
          color: Color(0xFF0DEA09),
        );
      case CallType.missed:
        return SvgPicture.asset(
          'incoming_arrow'.svg,
          color: Color(0xFFD81F1F),
        );

      case CallType.rejected:
        return Icon(
          Icons.block,
          color: BrandColors.yellow,
          size: 15,
        );
      case CallType.blocked:
        return Icon(
          Icons.block,
          color: Colors.black,
          size: 15,
        );

      default:
        return SizedBox();
    }
  }

  String convertToAgo(DateTime input) {
    Duration diff = DateTime.now().difference(input);
    if (diff.inDays >= 30) {
      return '${diff.inDays ~/ 30} month(s) ago';
    } else if (diff.inDays >= 1) {
      return '${diff.inDays} day(s) ago';
    } else if (diff.inHours >= 1) {
      return '${diff.inHours} hour(s) ago';
    } else if (diff.inMinutes >= 1) {
      return '${diff.inMinutes} minute(s) ago';
    } else {
      return 'just now';
    }
  }
}
