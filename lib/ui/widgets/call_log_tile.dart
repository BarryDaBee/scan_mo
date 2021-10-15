import 'package:call_log/call_log.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:scan_mo/core/exports.dart';
import 'package:url_launcher/url_launcher.dart';

class CallLogTile extends StatelessWidget {
  final CallLogEntry? callLogEntry;
  const CallLogTile({
    Key? key,
    this.callLogEntry,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  getCallIcon() ?? SizedBox(),
                  SizedBox(width: 5.w),
                  CustomText(
                    callLogEntry!.name ?? callLogEntry!.number!,
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
                    callLogEntry!.number ?? "Unknown",
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
              DateTime.fromMillisecondsSinceEpoch(callLogEntry!.timestamp!),
            )}',
            fontWeight: FontWeight.w400,
            fontSize: 12,
            color: Color(0xFFC8C4EB),
          ),
          SizedBox(width: 10.w),
          SvgPicture.asset('info_square'.svg),
        ],
      ),
      children: [
        Container(
          color: Color(0xFFF1F1F1),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () async {
                  var _ = await FlutterPhoneDirectCaller.callNumber(
                      callLogEntry!.number!);
                  print(_);
                },
                child: Container(
                  width: MediaQuery.of(context).size.width / 2 - 18.w,
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset('call'.svg),
                      SizedBox(width: 5.w),
                      CustomText(
                        'Call',
                        color: AppColors.secondary,
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: 2,
                color: Color(0xFFC8C4EB),
                height: 60.h,
              ),
              InkWell(
                onTap: () async {
                  await launch('sms:${callLogEntry!.number!}');
                },
                child: Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width / 2 - 18.w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset('message'.svg),
                      SizedBox(width: 5.w),
                      CustomText(
                        'Message',
                        color: AppColors.secondary,
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                      ),
                      //SizedBox(width: 58.w),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  getCallIcon() {
    switch (callLogEntry!.callType) {
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
          color: AppColors.yellow,
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
      return '${diff.inDays ~/ 30} months ago';
    } else if (diff.inDays >= 1) {
      return '${diff.inDays} days ago';
    } else if (diff.inHours >= 1) {
      return '${diff.inHours} hrs. ago';
    } else if (diff.inMinutes >= 1) {
      return '${diff.inMinutes} mins. ago';
    } else {
      return 'just now';
    }
  }
}
