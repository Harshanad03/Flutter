import 'package:chan_s_application4/core/app_export.dart';
import 'package:chan_s_application4/presentation/first_station_page/first_station_page.dart';
import 'package:chan_s_application4/widgets/app_bar/appbar_leading_iconbutton.dart';
import 'package:chan_s_application4/widgets/app_bar/appbar_trailing_image.dart';
import 'package:chan_s_application4/widgets/app_bar/custom_app_bar.dart';
import 'package:chan_s_application4/widgets/custom_elevated_button.dart';
import 'package:chan_s_application4/widgets/custom_outlined_button.dart';
import 'package:flutter/material.dart';

class FirstStationTabContainerScreen extends StatefulWidget {
  const FirstStationTabContainerScreen({Key? key}) : super(key: key);

  @override
  FirstStationTabContainerScreenState createState() =>
      FirstStationTabContainerScreenState();
}

// ignore_for_file: must_be_immutable
class FirstStationTabContainerScreenState
    extends State<FirstStationTabContainerScreen>
    with TickerProviderStateMixin {
  late TabController tabviewController;

  @override
  void initState() {
    super.initState();
    tabviewController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: appTheme.whiteA70001,
            body: SizedBox(
                width: double.maxFinite,
                child: Column(children: [
                  _buildTwenty(context),
                  SizedBox(height: 20.v),
                  Expanded(
                      child: SingleChildScrollView(
                          child: Column(children: [
                    Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                            padding: EdgeInsets.only(right: 18.h),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Padding(
                                      padding: EdgeInsets.only(top: 7.v),
                                      child: Text("Qi Charging Station",
                                          style: CustomTextStyles
                                              .titleSmallBluegray700)),
                                  CustomImageView(
                                      imagePath: ImageConstant.imgTwitter,
                                      height: 26.adaptSize,
                                      width: 26.adaptSize,
                                      margin: EdgeInsets.only(left: 86.h))
                                ]))),
                    SizedBox(height: 20.v),
                    _buildFortyThree(context),
                    SizedBox(height: 27.v),
                    _buildSpecs(context),
                    SizedBox(height: 29.v),
                    Text("Available Connectors",
                        style: theme.textTheme.titleSmall),
                    SizedBox(height: 13.v),
                    CustomImageView(
                        imagePath: ImageConstant.imgVectorGray100,
                        height: 38.v,
                        width: 312.h),
                    SizedBox(height: 14.v),
                    _buildFortySeven(context),
                    SizedBox(height: 27.v),
                    _buildTabview(context),
                    SizedBox(
                        height: 1039.v,
                        child: TabBarView(
                            controller: tabviewController,
                            children: [
                              FirstStationPage(),
                              FirstStationPage(),
                              FirstStationPage(),
                              FirstStationPage()
                            ]))
                  ])))
                ]))));
  }

  /// Section Widget
  Widget _buildTwenty(BuildContext context) {
    return SizedBox(
        height: 338.v,
        width: 393.h,
        child: Stack(alignment: Alignment.topCenter, children: [
          CustomImageView(
              imagePath: ImageConstant.imgEvCharging1001x565,
              height: 338.v,
              width: 393.h,
              alignment: Alignment.center),
          CustomAppBar(
              height: 45.v,
              leadingWidth: 43.h,
              leading: AppbarLeadingIconbutton(
                  imagePath: ImageConstant.imgArrowDown,
                  margin: EdgeInsets.only(left: 15.h),
                  onTap: () {
                    onTapArrowDown(context);
                  }),
              actions: [
                AppbarTrailingImage(
                    imagePath: ImageConstant.imgFavorite,
                    margin: EdgeInsets.only(left: 10.h, top: 2.v, right: 10.h))
              ])
        ]));
  }

  /// Section Widget
  Widget _buildFortyThree(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 14.h),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          CustomImageView(
              imagePath: ImageConstant.imgIsolationMode,
              height: 21.v,
              width: 16.h),
          Padding(
              padding: EdgeInsets.only(left: 10.h),
              child: Text("324 Vespucci Beach Road",
                  style: CustomTextStyles.titleSmallPoppinsGray60002)),
          Spacer(),
          Container(
              width: 117.h,
              margin: EdgeInsets.only(bottom: 2.v),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomImageView(
                        imagePath: ImageConstant.imgSignal,
                        height: 12.adaptSize,
                        width: 12.adaptSize,
                        margin: EdgeInsets.symmetric(vertical: 3.v)),
                    Padding(
                        padding: EdgeInsets.only(left: 3.h),
                        child: Text("4.8 (66 Reviews)",
                            style: theme.textTheme.labelLarge))
                  ]))
        ]));
  }

  /// Section Widget
  Widget _buildSpecs(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 18.h, right: 15.h),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          SizedBox(
              width: 63.h,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomImageView(
                        imagePath: ImageConstant.imgLayer1,
                        height: 25.v,
                        width: 15.h),
                    Padding(
                        padding: EdgeInsets.only(bottom: 2.v),
                        child: Text("07 Kw",
                            style: CustomTextStyles.bodyMediumPoppins))
                  ])),
          Padding(
              padding: EdgeInsets.only(bottom: 2.v),
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Container(
                    height: 18.adaptSize,
                    width: 18.adaptSize,
                    margin: EdgeInsets.only(top: 2.v, bottom: 1.v),
                    padding:
                        EdgeInsets.symmetric(horizontal: 4.h, vertical: 1.v),
                    decoration: AppDecoration.fillBlack.copyWith(
                        borderRadius: BorderRadiusStyle.roundedBorder10),
                    child: CustomImageView(
                        imagePath: ImageConstant.imgDollar,
                        height: 14.v,
                        width: 8.h,
                        alignment: Alignment.center)),
                Padding(
                    padding: EdgeInsets.only(left: 5.h),
                    child: Text("30.00/Kw",
                        style: CustomTextStyles.bodyMediumPoppins))
              ])),
          Padding(
              padding: EdgeInsets.only(bottom: 2.v),
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                CustomImageView(
                    imagePath: ImageConstant.imgVector,
                    height: 21.v,
                    width: 16.h,
                    margin: EdgeInsets.only(top: 1.v)),
                Padding(
                    padding: EdgeInsets.only(left: 3.h),
                    child: Text("3.5 km/ 30 min",
                        style: CustomTextStyles.bodyMediumPoppins))
              ]))
        ]));
  }

  /// Section Widget
  Widget _buildFortySeven(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 18.h, right: 23.h),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Expanded(
              child: CustomOutlinedButton(
                  text: "View", margin: EdgeInsets.only(right: 21.h))),
          Expanded(
              child: CustomElevatedButton(
                  height: 59.v,
                  text: "Route Planner",
                  margin: EdgeInsets.only(left: 21.h),
                  buttonTextStyle: theme.textTheme.titleMedium!))
        ]));
  }

  /// Section Widget
  Widget _buildTabview(BuildContext context) {
    return Container(
        height: 44.v,
        width: 323.h,
        child: TabBar(
            controller: tabviewController,
            labelPadding: EdgeInsets.zero,
            labelColor: appTheme.black900,
            labelStyle: TextStyle(
                fontSize: 15.126201629638672.fSize,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600),
            unselectedLabelColor: appTheme.gray900,
            unselectedLabelStyle: TextStyle(
                fontSize: 15.126201629638672.fSize,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400),
            indicatorColor: appTheme.black900,
            tabs: [
              Tab(child: Text("Info")),
              Tab(child: Text("Chargers")),
              Tab(child: Text("Check-ins")),
              Tab(child: Text("Reviews"))
            ]));
  }

  /// Navigates to the homeContainerScreen when the action is triggered.
  onTapArrowDown(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.homeContainerScreen);
  }
}
