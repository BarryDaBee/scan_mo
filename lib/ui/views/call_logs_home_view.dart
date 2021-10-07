import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scan_mo/core/exports.dart';
import 'package:scan_mo/core/view_models/call_log_home_view_model.dart';
import 'package:scan_mo/ui/widgets/call_log_tile.dart';

class CallLogsHomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CallLogHomeViewModel>.reactive(
        createNewModelOnInsert: true,
        builder: (context, model, child) {
          return Scaffold(
            body: model.isBusy
                ? Center(child: CircularProgressIndicator())
                : Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 60.h),
                        CustomText(
                          'Call Logs',
                          fontWeight: FontWeight.w700,
                          fontSize: 24,
                        ),
                        SizedBox(height: 20.h),
                        Expanded(
                          child: ListView.separated(
                            physics: BouncingScrollPhysics(),
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              print({
                                model.callLogs.elementAt(index).number:
                                    model.callLogs.elementAt(index).callType
                              });
                              return CallLogTile(
                                callLogEntry: model.callLogs.elementAt(index),
                              );
                            },
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return SizedBox(height: 20.h);
                            },
                            itemCount: model.callLogs.length,
                          ),
                        ),
                      ],
                    ),
                  ),
          );
        },
        onModelReady: (model) => model.getCallLogs(),
        viewModelBuilder: () => locator<CallLogHomeViewModel>());
  }
}
