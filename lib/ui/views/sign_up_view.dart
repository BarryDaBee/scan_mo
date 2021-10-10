import 'package:google_fonts/google_fonts.dart';
import 'package:scan_mo/core/exports.dart';
import 'package:scan_mo/core/view_models/sign_up_view_model.dart';
import 'package:scan_mo/ui/widgets/custom_elevated_button.dart';

class SignUpView extends StatefulWidget {
  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignUpViewModel>.reactive(
        disposeViewModel: false,
        builder: (context, model, child) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            body: Padding(
              padding: EdgeInsets.only(
                  top: 70.h, left: 24.w, right: 24.w, bottom: 24.h),
              child: Column(
                // padding: EdgeInsets.zero,
                // physics: BouncingScrollPhysics(),
                children: [
                  CustomText(
                    'Personalize your experience',
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    textAlign: TextAlign.center,
                    color: BrandColors.primary,
                  ),
                  SizedBox(height: 5.h),
                  CustomText(
                    'Hey, we’re gonna need you to add your name and image, you can also pick an avatar if you want',
                    fontSize: 12,
                    textAlign: TextAlign.center,
                    color: BrandColors.primary,
                  ),
                  SizedBox(height: 26.h),
                  Form(
                    key: _formKey,
                    child: SizedBox(
                      height: 70.h,
                      width: 327.w,
                      child: TextFormField(
                        controller: _textEditingController,
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(top: 5.w, left: 10.w),
                          labelText: 'Name',
                          hintText: 'Adejare',
                          labelStyle: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: BrandColors.primary,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide: BorderSide(width: 0.5),
                          ),
                        ),
                      ),
                    ),
                  ),
                  // SizedBox(height: 25.h),
                  // CustomText(
                  //   'Pick an Avatar',
                  //   fontSize: 18,
                  //   fontWeight: FontWeight.w700,
                  //   color: BrandColors.primary,
                  // ),
                  // SizedBox(height: 15.h),
                  // Wrap(
                  //   alignment: WrapAlignment.spaceBetween,
                  //   runSpacing: 20.h,
                  //   children: List.generate(
                  //     6,
                  //     (_) => SvgPicture.asset(
                  //       'assets/images/gallery_icon.svg',
                  //       height: 100.r,
                  //       width: 100.r,
                  //     ),
                  //   ),
                  // ),
                  // SizedBox(height: 20.h),
                  // CustomText(
                  //   'Not a fan of our avatars :(',
                  //   fontSize: 18,
                  //   fontWeight: FontWeight.w700,
                  //   color: BrandColors.primary,
                  // ),
                  // SizedBox(height: 3.h),
                  // CustomText(
                  //   'You\'re welcome to add a picture, we don\'t mind',
                  //   fontSize: 12,
                  //   color: BrandColors.primary,
                  // ),
                  // SizedBox(height: 18.h),
                  // Container(
                  //   height: 68.h,
                  //   width: 342.w,
                  //   alignment: Alignment.center,
                  //   decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.circular(5),
                  //     border: Border.all(
                  //         width: 1,
                  //         color: BrandColors.primary,
                  //         style: BorderStyle.solid),
                  //     color: BrandColors.grey,
                  //   ),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     children: [
                  //       SvgPicture.asset('assets/images/gallery_icon.svg'),
                  //       SizedBox(width: 14.w),
                  //       CustomText('Click here to add your image',
                  //           color: BrandColors.primary, fontSize: 10)
                  //     ],
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: 68.h,
                  //   width: 320.w,
                  // ),
                  Spacer(),
                  CustomElevatedButton(
                    text: "Done",
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        model.setUserName(_textEditingController.value.text);
                        print(_textEditingController.value.text);
                        model.markAsOldUser();
                        Navigator.pushNamed(context, HOME_VIEW_ROUTE);
                      }
                    },
                  ),
                ],
              ),
            ),
          );
        },
        viewModelBuilder: () => locator<SignUpViewModel>());
  }
}
