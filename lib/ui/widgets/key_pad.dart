import 'package:scan_mo/core/exports.dart';
import 'package:scan_mo/core/view_models/keypad_view_model.dart';

class Keypad extends StatelessWidget {
  const Keypad({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<KeypadViewModel>.reactive(
      disposeViewModel: false,
      builder: (BuildContext context, KeypadViewModel model, Widget? child) {
        return SizedBox(
          height: model.phoneNumberInput.isNotEmpty ? 420.h : 375.h,
          child: BottomSheet(
            builder: (BuildContext context) {
              return Column(
                children: [
                  model.phoneNumberInput.isNotEmpty
                      ? Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              ConstrainedBox(
                                constraints: BoxConstraints(
                                  maxHeight: 45.h,
                                  maxWidth: 280.w,
                                ),
                                child: SingleChildScrollView(
                                  reverse: true,
                                  scrollDirection: Axis.horizontal,
                                  child: CustomText(
                                    model.phoneNumberInput,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 36,
                                  ),
                                ),
                              ),
                              SizedBox(width: 16.w),
                              GestureDetector(
                                onLongPress: model.clearAll,
                                onTap: model.popLastNumber,
                                child: SizedBox(
                                  width: 40.w,
                                  height: 30.h,
                                  child: SvgPicture.asset(
                                    'clear'.svg,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      : Container(),
                  model.phoneNumberInput.isNotEmpty ? Divider() : Container(),
                  Container(
                    child: Table(
                      children: [
                        TableRow(
                          children: [
                            TableCell(
                              child: NumKey(
                                model: model,
                                numValue: '1',
                              ),
                            ),
                            TableCell(
                              child: NumKey(
                                model: model,
                                numValue: '2',
                                subValues: 'ABC',
                              ),
                            ),
                            TableCell(
                                child: NumKey(
                                    model: model,
                                    numValue: '3',
                                    subValues: 'DEF')),
                          ],
                        ),
                        TableRow(
                          children: [
                            TableCell(
                              child: NumKey(
                                  model: model,
                                  numValue: '4',
                                  subValues: 'GHI'),
                            ),
                            TableCell(
                              child: NumKey(
                                  model: model,
                                  numValue: '5',
                                  subValues: 'JKL'),
                            ),
                            TableCell(
                              child: NumKey(
                                  model: model,
                                  numValue: '6',
                                  subValues: 'MNO'),
                            ),
                          ],
                        ),
                        TableRow(
                          children: [
                            TableCell(
                              child: NumKey(
                                model: model,
                                numValue: '7',
                                subValues: 'PQRS',
                              ),
                            ),
                            TableCell(
                              child: NumKey(
                                model: model,
                                numValue: '8',
                                subValues: 'TUV',
                              ),
                            ),
                            TableCell(
                              child: NumKey(
                                model: model,
                                numValue: '9',
                                subValues: 'WXYZ',
                              ),
                            ),
                          ],
                        ),
                        TableRow(
                          children: [
                            TableCell(
                              child: NumKey(
                                model: model,
                                numValue: '*',
                              ),
                            ),
                            TableCell(
                              child: NumKey(
                                model: model,
                                numValue: '0',
                              ),
                            ),
                            TableCell(
                              child: NumKey(
                                model: model,
                                numValue: '#',
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: InkWell(
                      onTap: model.makeCall,
                      child: Container(
                        alignment: Alignment.center,
                        height: 50.h,
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                          color: AppColors.secondary,
                          borderRadius: BorderRadius.circular(35),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'calling'.svg,
                              color: Colors.white,
                            ),
                            SizedBox(width: 14.w),
                            CustomText(
                              'CALL',
                              fontSize: 24,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
            enableDrag: false,
            onClosing: () {},
          ),
        );
      },
      viewModelBuilder: () => locator<KeypadViewModel>(),
    );
  }
}

class NumKey extends StatelessWidget {
  final VoidCallback? onKeyPressed;
  final String numValue;
  final String? subValues;
  final KeypadViewModel model;
  NumKey(
      {Key? key,
      this.onKeyPressed,
      required this.numValue,
      this.subValues,
      required this.model})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        model.updateNumberWith(numValue);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CustomText(
            numValue,
            fontWeight: FontWeight.w500,
            fontSize: 36,
          ),
          SizedBox(height: 9.h),
          subValues != null
              ? CustomText(
                  subValues,
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                  color: Color(0xFFB2B2B2),
                )
              : Container(),
        ],
      ),
    );
  }
}
