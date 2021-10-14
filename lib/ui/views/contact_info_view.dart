import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:scan_mo/core/exports.dart';
import 'package:scan_mo/core/models/contact.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactInfoView extends StatelessWidget {
  String getInitials(String name) {
    List decodedName = name.split(' ');
    if (decodedName.length >= 2) {
      return decodedName.first[0].toUpperCase() +
          decodedName[1][0].toUpperCase();
    }
    return name[0].toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    final contact = ModalRoute.of(context)!.settings.arguments as Contact;

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 70.h),
          CircleAvatar(
            radius: 90.r,
            backgroundColor: Color(0xFFC8C4EB),
            child: CustomText(
              getInitials(contact.displayName ?? ''),
              fontSize: 45,
              textAlign: TextAlign.center,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 10.h),
          CustomText(
            contact.displayName!,
            fontSize: 16,
            textAlign: TextAlign.center,
            fontWeight: FontWeight.w700,
          ),
          SizedBox(height: 50.h),
          ...List.generate(
            contact.phoneNumber!.length,
            (index) => Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              margin: EdgeInsets.only(bottom: 10.h),
              height: 50.h,
              color: Color(0xFFC8C4EB),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(
                        contact.phoneNumber![index].value,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                      CustomText(
                        contact.phoneNumber![index].label,
                        color: Colors.black.withOpacity(0.3),
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ],
                  ),
                  Spacer(),
                  ContactActionButton(
                    onTap: () async {
                      await FlutterPhoneDirectCaller.callNumber(
                          contact.phoneNumber![index].value!);
                    },
                    iconChild: SvgPicture.asset('call'.svg),
                  ),
                  SizedBox(width: 10.w),
                  ContactActionButton(
                    onTap: () async {
                      await launch('sms:${contact.phoneNumber![index].value!}');
                    },
                    iconChild: SvgPicture.asset('message'.svg),
                  ),
                  SizedBox(width: 10.w),
                  ContactActionButton(
                    onTap: () {
                      Navigator.pushNamed(context, SHARE_FRIEND_CONTACT_ROUTE,
                          arguments: {
                            'name': contact.displayName!,
                            'phoneNumbers': [
                              contact.phoneNumber![index].value,
                            ],
                          });
                    },
                    iconChild: SvgPicture.asset('scan'.svg),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ContactActionButton extends StatelessWidget {
  final VoidCallback? onTap;
  final Widget? iconChild;

  const ContactActionButton({Key? key, this.onTap, required this.iconChild})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: CircleContainer(
        child: iconChild,
      ),
    );
  }
}

class CircleContainer extends StatelessWidget {
  final Widget? child;
  const CircleContainer({Key? key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 31.r,
      width: 31.r,
      padding: EdgeInsets.all(5.r),
      child: child,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
      ),
    );
  }
}
