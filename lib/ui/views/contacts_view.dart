import 'package:azlistview/azlistview.dart';
import 'package:scan_mo/core/exports.dart';
import 'package:scan_mo/core/models/contact.dart';
import 'package:scan_mo/core/view_models/contacts_view_model.dart';
import 'package:scan_mo/ui/shared/colors.dart';

class ContactsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ContactsViewModel>.reactive(
      onModelReady: (model) => model.getContacts(),
      disposeViewModel: false,
      builder: (context, model, child) => Scaffold(
        body: model.isBusy
            ? Center(child: CircularProgressIndicator())
            : Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 60.h),
                    InkWell(
                      onTap: model.getContacts,
                      child: CustomText(
                        'Contacts',
                        fontWeight: FontWeight.w700,
                        fontSize: 24,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Expanded(
                      child: AzListView(
                        data: model.contacts!,
                        itemCount: model.contacts!.length,
                        physics: BouncingScrollPhysics(),
                        indexBarOptions: IndexBarOptions(
                          needRebuild: true,
                        ),
                        itemBuilder: (context, index) {
                          return ContactCard(
                            contact: model.contacts![index],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
      ),
      viewModelBuilder: () => locator<ContactsViewModel>(),
    );
  }
}

class ContactCard extends StatelessWidget {
  final Contact? contact;

  const ContactCard({@required this.contact});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, CONTACT_INFO_ROUTE, arguments: contact!);
      },
      child: Container(
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 20.h),
              padding: EdgeInsets.all(9.r),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: BrandColors.grey,
              ),
              child: SizedBox(
                height: 32.r,
                width: 32.r,
                child: SvgPicture.asset(
                  'profile'.svg,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(width: 15.w),
            Padding(
              padding: EdgeInsets.only(
                bottom: 15.h,
              ),
              child: SizedBox(
                width: MediaQuery.of(context).size.width / 2,
                child: CustomText(
                  contact!.displayName,
                  textOverflow: TextOverflow.ellipsis,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
