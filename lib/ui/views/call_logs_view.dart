import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scan_mo/core/exports.dart';
import 'package:scan_mo/core/view_models/call_log_view_model.dart';
import 'package:scan_mo/ui/widgets/call_log_tile.dart';
import 'package:scan_mo/ui/widgets/key_pad.dart';

class CallLogsView extends StatefulWidget {
  @override
  State<CallLogsView> createState() => _CallLogsViewState();
}

class _CallLogsViewState extends State<CallLogsView> {
  ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CallLogViewModel>.reactive(
        disposeViewModel: false,
        builder: (context, model, child) {
          _scrollController.addListener(() {
            if (model.showBottomSheet) {
              model.toggleBottomSheet();
            }
          });
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
                              controller: _scrollController,
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
            floatingActionButton: Container(
              margin:
                  model.showBottomSheet ? EdgeInsets.only(bottom: 40.h) : null,
              child: FloatingActionButton(
                onPressed: () {
                  model.toggleBottomSheet();
                },
                child: Icon(CupertinoIcons.number),
                shape: CircleBorder(),
                backgroundColor: AppColors.secondary,
              ),
            ),
            bottomSheet: model.showBottomSheet ? Keypad() : null,
          );
        },
        onModelReady: (model) => model.getCallLogs(),
        viewModelBuilder: () => locator<CallLogViewModel>());
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
