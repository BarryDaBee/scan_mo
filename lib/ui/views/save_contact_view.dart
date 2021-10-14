import 'dart:convert';

import 'package:scan_mo/core/exports.dart';
import 'package:scan_mo/core/view_models/save_view_model.dart';
import 'package:scan_mo/ui/widgets/custom_elevated_button.dart';

class SaveContactView extends StatelessWidget {
  SaveContactView({Key? key}) : super(key: key);

  final TextEditingController _textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var userJson =
        jsonDecode(ModalRoute.of(context)!.settings.arguments as String);

    return ViewModelBuilder<SaveContactViewModel>.reactive(
        disposeViewModel: false,
        builder: (context, model, child) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                children: [
                  SizedBox(height: 60.h),
                  Stack(
                    children: [
                      Column(
                        children: [
                          CustomText(
                            'Nice one, you\'ve received a contact',
                            fontSize: 24,
                            textAlign: TextAlign.center,
                            color: AppColors.primary,
                            fontWeight: FontWeight.w700,
                          ),
                          CircleAvatar(
                            child: CustomText(
                              userJson['name'][0],
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 40,
                            ),
                            backgroundColor:
                                AppColors.secondary.withOpacity(0.38),
                            radius: 116.r,
                          ),
                        ],
                      ),
                      Positioned(
                        left: 32.r,
                        bottom: 0,
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          width: 261.w,
                          decoration: BoxDecoration(
                              color: AppColors.secondary,
                              borderRadius: BorderRadius.circular(27)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomText(
                                userJson['name'],
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                              IconButton(
                                onPressed: () {
                                  showDialog(
                                    builder: (BuildContext context) {
                                      return SimpleDialog(
                                        contentPadding: EdgeInsets.all(10.r),
                                        backgroundColor: Colors.white,
                                        title: CustomText(
                                          'Edit Contact name',
                                          fontSize: 18,
                                          color: AppColors.primary,
                                          fontWeight: FontWeight.w700,
                                        ),
                                        children: [
                                          TextFormField(
                                            controller: _textEditingController,
                                            style: TextStyle(
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w500,
                                            ),
                                            decoration: InputDecoration(
                                              focusColor: AppColors.secondary,
                                              border: OutlineInputBorder(),
                                            ),
                                          ),
                                          SizedBox(height: 30.h),
                                          CustomElevatedButton(
                                            onPressed: () {
                                              //model.refresh();
                                              Navigator.pushNamedAndRemoveUntil(
                                                  context,
                                                  HOME_VIEW_ROUTE,
                                                  (route) => false);
                                              userJson['name'] =
                                                  _textEditingController
                                                      .value.text;
                                              model.saveContact(
                                                  jsonEncode(userJson));
                                            },
                                            text: 'Save',
                                          ),
                                        ],
                                      );
                                    },
                                    context: context,
                                  );
                                },
                                icon: Icon(
                                  Icons.edit,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    margin: EdgeInsets.only(bottom: 10.h),
                    height: 50.h,
                    decoration: BoxDecoration(
                      color: Color(0xFFC8C4EB),
                      borderRadius: BorderRadius.circular(27),
                    ),
                    child: CustomText(
                      userJson['phoneNumbers'][0],
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  Spacer(),
                  CustomElevatedButton(
                    text: 'Save',
                    onPressed: () {
                      userJson['name'] = _textEditingController.value.text;
                      model.saveContact(jsonEncode(userJson));
                    },
                  ),
                  SizedBox(height: 27.h),
                ],
              ),
            ),
          );
        },
        viewModelBuilder: () => locator<SaveContactViewModel>());
  }
}
