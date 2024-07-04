import 'package:chan_s_application4/core/app_export.dart';
import 'package:chan_s_application4/widgets/app_bar/appbar_leading_circleimage.dart';
import 'package:chan_s_application4/widgets/app_bar/appbar_title.dart';
import 'package:chan_s_application4/widgets/app_bar/appbar_trailing_image.dart';
import 'package:chan_s_application4/widgets/app_bar/custom_app_bar.dart';
import 'package:chan_s_application4/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:chan_s_application4/presentation/emergency_dialog/emergency_dialog.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
            body: SizedBox(
                height: 650.v,
                width: 380.h,

                child: Stack(alignment: Alignment.bottomCenter, children: [
                  Align(
                      alignment: Alignment.center,
                      child: SizedBox(height: 800.v, width: double.maxFinite)),
                  Align(
                      alignment: Alignment.bottomCenter,
                      child: SizedBox(
                          height: 800.v,
                          width: double.maxFinite,
                          child:
                              Stack(alignment: Alignment.bottomLeft, children: [
                            Align(
                                alignment: Alignment.center,
                                child: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 14.h, vertical: 16.v),
                                    decoration: AppDecoration.outlineBlack
                                        .copyWith(
                                            borderRadius: BorderRadiusStyle
                                                .roundedBorder10),
                                    child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text("SPECIAL OFFERS",
                                              style: CustomTextStyles
                                                  .titleLargePrimary),
                                          SizedBox(height: 29.v),
                                          _buildTabForExciting(context),
                                          SizedBox(height: 26.v),
                                          _buildKwrTwenty(context),
                                          Spacer(),
                                          SizedBox(height: 85.v),
                                          CustomElevatedButton(
                                              text:
                                                  "Emergency Portable Charging",
                                              margin: EdgeInsets.only(
                                                  left: 14.h, right: 9.h,bottom: 30.v),
                                              buttonStyle: CustomButtonStyles
                                                  .outlineBlack,
                                              buttonTextStyle: CustomTextStyles
                                                  .titleSmallOnErrorContainer,
                                              onPressed: () {
                                                onTapEmergencyPortableCharging(
                                                    context);
                                              })
                                        ]))),
                            _buildKwrTwentyFour(context)
                          ])))
                ]))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 80.h,
        leading: AppbarLeadingCircleimage(
            imagePath: ImageConstant.imgEllipse4,
            margin: EdgeInsets.only(left: 20.h,top: 10.v)),
        title: AppbarTitle(
            text: "Electro Spartans", margin: EdgeInsets.only(left: 11.h,top: 10.v)),
        actions: [
          AppbarTrailingImage(
              imagePath: ImageConstant.imgArrowRight,
              margin: EdgeInsets.only(top: 40.v, right: 22.h, bottom: 100.v))
        ]);
  }

  /// Section Widget
  Widget _buildTabForExciting(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 13.h),
        padding: EdgeInsets.symmetric(horizontal: 42.h, vertical: 29.v),
        decoration: AppDecoration.outlineBlueGrayBc
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder10),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 3.v),
              Text("Tab for exciting offers..!",
                  style: theme.textTheme.titleLarge)
            ]));
  }

  /// Section Widget
  Widget _buildKwrTwenty(BuildContext context) {
    return Align(
        alignment: Alignment.centerLeft,
        child: SizedBox(
            height: 135.v,
            width: 333.h,

            child: Stack(alignment: Alignment.topLeft, children: [
              Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                      margin: EdgeInsets.only(left: 111.h,bottom : 0),
                      padding: EdgeInsets.symmetric(
                          horizontal: 40.h, vertical: 34.v),
                      decoration: AppDecoration.outlineBluegray700bc.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder10),
                      child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            SizedBox(height: 34.v),
                            Text("1KW = Rs.20",
                                style:
                                    CustomTextStyles.headlineSmallInterGray5001)
                          ]))),
              CustomImageView(
                  imagePath: ImageConstant.imgToppng2,
                  height: 107.v,
                  width: 161.h,
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.only(top: 8.v))
            ])));
  }

  /// Section Widget
  Widget _buildKwrTwentyFour(BuildContext context) {
    return Align(
        alignment: Alignment.bottomLeft,
        child: Container(
            height: 174.v,
            width: 348.h,
            margin: EdgeInsets.only(bottom: 130.v),
            child: Stack(alignment: Alignment.centerLeft, children: [
              Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                      margin: EdgeInsets.only(left: 136.h),
                      padding: EdgeInsets.symmetric(
                          horizontal: 40.h, vertical: 35.v),
                      decoration: AppDecoration.outlineBluegray700bc.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder10),
                      child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            SizedBox(height: 30.v),
                            Text("1KW = Rs.24",
                                style:
                                    CustomTextStyles.headlineSmallInterGray5001)
                          ]))),
              CustomImageView(
                  imagePath: ImageConstant.imgEvBike1,
                  height: 174.v,
                  width: 176.h,
                  alignment: Alignment.centerLeft)
            ])));
  }

  /// Displays a dialog with the [EmergencyDialog] content.
  onTapEmergencyPortableCharging(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              content: EmergencyDialog(),
              backgroundColor: Colors.transparent,
              contentPadding: EdgeInsets.zero,
              insetPadding: const EdgeInsets.only(left: 0),
            ));
  }
}
