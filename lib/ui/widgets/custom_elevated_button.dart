import 'package:scan_mo/core/exports.dart';

class CustomElevatedButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String? text;
  CustomElevatedButton({this.onPressed, this.text});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      width: double.maxFinite,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: AppColors.secondary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        onPressed: onPressed ?? () {},
        child: CustomText(
          text ?? "Let's Go!",
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
