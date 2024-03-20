import 'package:chan_s_application4/core/app_export.dart';
import 'package:chan_s_application4/presentation/map/maptest.dart';
import 'package:chan_s_application4/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:chan_s_application4/presentation/sign_up_bottomsheet/sign_up_bottomsheet.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 1.h, vertical: 38.v),
                child: Column(children: [
                  Spacer(),
                  CustomImageView(
                      imagePath: ImageConstant.imgToppng1,
                      height: 243.v,
                      width: 372.h),
                  SizedBox(height: 15.v),
                  Container(
                      width: 271.h,
                      margin: EdgeInsets.only(left: 50.h, right: 51.h),
                      child: Text("Smart Ev Charing Transportations ",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: theme.textTheme.displaySmall!
                              .copyWith(height: 1.20))),
                  SizedBox(height: 21.v),
                  Container(
                      width: 334.h,
                      margin: EdgeInsets.symmetric(horizontal: 19.h),
                      child: Text(
                          "Electric Clean Energy Premium Cars for  daily rental. Experience the thrill at a lower price",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: CustomTextStyles.bodyMediumBarlowBluegray40001
                              .copyWith(height: 1.40)))
                ])),
            bottomNavigationBar: _buildLetsGoButton(context)));
  }

  /// Section Widget
  Widget _buildLetsGoButton(BuildContext context) {
    return CustomElevatedButton(
        height: 54.v,
        text: "Let's Go",
        margin: EdgeInsets.only(left: 23.h, right: 33.h, bottom: 68.v),
        buttonStyle: CustomButtonStyles.fillPrimary,
        buttonTextStyle: CustomTextStyles.titleLargeBarlowBluegray90001,
        onPressed: () {
          onTapLetsGoButton(context);
        });
  }

  /// Shows a modal bottom sheet with [SignUpBottomsheet]
  /// widget content.
  /// The sheet is displayed on top of the current view with scrolling enabled if
  /// content exceeds viewport height.
  onTapLetsGoButton(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) => SignUpBottomsheet(),
        isScrollControlled: true);
  }
}
