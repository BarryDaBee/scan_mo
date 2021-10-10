import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scan_mo/core/exports.dart';
import 'package:scan_mo/core/view_models/call_log_view_model.dart';
import 'package:scan_mo/ui/widgets/call_log_tile.dart';

class CallLogsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CallLogViewModel>.reactive(
        disposeViewModel: false,
        builder: (context, model, child) {
          return Scaffold(
            body: Padding(
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
                  SizedBox(height: 10.h),
                  model.isBusy
                      ? Center(child: CircularProgressIndicator())
                      : Expanded(
                          child: RefreshIndicator(
                            onRefresh: () async {
                              model.getCallLogs();
                            },
                            child: ListView.builder(
                              physics: BouncingScrollPhysics(),
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return CallLogTile(
                                  callLogEntry:
                                      model.callLogs!.elementAt(index),
                                );
                              },
                              itemCount: model.callLogs!.length,
                            ),
                          ),
                        ),
                ],
              ),
            ),
          );
        },
        onModelReady: (model) => model.getCallLogs(),
        viewModelBuilder: () => locator<CallLogViewModel>());
  }
}
