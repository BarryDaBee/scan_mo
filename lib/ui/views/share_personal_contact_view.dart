import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_number/mobile_number.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:scan_mo/core/exports.dart';
import 'package:scan_mo/core/view_models/share_personal_contact_view_model.dart';

class SharePersonalContactView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SharePersonalContactViewModel>.reactive(
        disposeViewModel: false,
        onModelReady: (model) => model.initializeScreen(),
        builder: (context, model, child) {
          return Scaffold(
            body: model.isBusy
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Padding(
                    padding: EdgeInsets.symmetric(horizontal: 21.w),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 60.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: Navigator.of(context).pop,
                              child: Container(
                                height: 30.r,
                                width: 30.r,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: BrandColors.secondary),
                                child: Icon(
                                  Icons.arrow_back_ios,
                                  color: Colors.white,
                                  size: 15.r,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 221.w,
                              child: Text(
                                'Share your personal contact',
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w700,
                                  color: BrandColors.primary,
                                  fontSize: 23,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            SizedBox(),
                          ],
                        ),
                        SizedBox(height: 30.h),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 12.w, vertical: 6.h),
                          decoration: BoxDecoration(
                            color: BrandColors.secondary,
                            borderRadius: BorderRadius.circular(18),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Hero(
                                tag: 'profile',
                                child: CircleAvatar(
                                  radius: 35.r,
                                  backgroundColor: BrandColors.yellow,
                                  child: CustomText(
                                    'S',
                                    color: Colors.white,
                                    fontSize: 26,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                              CustomText(
                                model.displayName!.toUpperCase(),
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                              SizedBox(width: 20.w),
                            ],
                          ),
                        ),
                        SizedBox(height: 22.h),
                        Container(
                          height: 392.h,
                          child: Stack(
                            children: [
                              Container(
                                height: 371.h,
                                padding: EdgeInsets.all(15.r),
                                decoration: BoxDecoration(
                                  color:
                                      BrandColors.secondary.withOpacity(0.38),
                                  borderRadius: BorderRadius.circular(18),
                                ),
                                child: QrImage(
                                  data: model.user!,
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                left: 10.w,
                                child: SelectedSimCard(
                                  index: 0,
                                  simCard: model.cards[0],
                                  onSelected: () {
                                    model.switchToSim(simIndex: 0);
                                  },
                                  isActive: model.activeSimIndex == 0,
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                right: 10.w,
                                child: SelectedSimCard(
                                  index: 1,
                                  simCard: model.cards[1],
                                  onSelected: () {
                                    model.switchToSim(simIndex: 1);
                                  },
                                  isActive: model.activeSimIndex == 1,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
          );
        },
        viewModelBuilder: () => locator<SharePersonalContactViewModel>());
  }
}

class SelectedSimCard extends StatefulWidget {
  final bool isActive;
  final VoidCallback? onSelected;
  final int? index;
  final SimCard? simCard;

  const SelectedSimCard(
      {Key? key,
      this.isActive = false,
      this.onSelected,
      @required this.index,
      this.simCard})
      : super(key: key);

  @override
  State<SelectedSimCard> createState() => _SelectedSimCardState();
}

class _SelectedSimCardState extends State<SelectedSimCard>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final CurvedAnimation animation;
  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
    animation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    _controller.addListener(() {
      setState(() {});
    });
    _controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onSelected,
      child: Stack(
        children: [
          Transform.translate(
            offset: Offset(
              100 - (_controller.value * 100),
              -200 + (_controller.value * 200),
            ),
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: widget.isActive ? BrandColors.yellow : BrandColors.grey,
                borderRadius: BorderRadius.circular(18),
              ),
              height: 47.h,
              width: 135.w,
            ),
          ),
          Container(
            alignment: Alignment.center,
            color: Colors.transparent,
            height: 47.h,
            width: 135.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    SvgPicture.asset(
                      'sim'.svg,
                      color: BrandColors.secondary,
                      height: 29.h,
                      width: 26.h,
                    ),
                    Positioned(
                      left: 8.w,
                      bottom: 0,
                      child: CustomText(
                        (widget.index! + 1).toString(),
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 10.w),
                CustomText(
                  widget.simCard!.displayName ?? '9mobile',
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                  color: widget.isActive ? Colors.white : Color(0xFF7B7B7B),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
