import 'package:chan_s_application4/core/app_export.dart';
import 'package:chan_s_application4/widgets/custom_elevated_button.dart';
import 'package:chan_s_application4/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:chan_s_application4/presentation/sign_up_bottomsheet/sign_up_bottomsheet.dart';

// ignore_for_file: must_be_immutable
class SignInBottomsheet extends StatelessWidget {
  SignInBottomsheet({Key? key}) : super(key: key);

  TextEditingController mobileNumberController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.maxFinite,
        padding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 33.v),
        decoration: AppDecoration.fillBlack
            .copyWith(borderRadius: BorderRadiusStyle.customBorderTL32),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Text("Sign In", style: theme.textTheme.headlineSmall),
          SizedBox(height: 6.v),
          Text("Enter your details ",
              style: CustomTextStyles.bodyMediumGray60014),
          SizedBox(height: 27.v),
          CustomTextFormField(
              controller: mobileNumberController,
              hintText: "Mobile Number",
              textInputType: TextInputType.phone,
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 16.h, vertical: 18.v)),
          SizedBox(height: 24.v),
          CustomTextFormField(
              controller: passwordController,
              hintText: "Password",
              textInputAction: TextInputAction.done,
              textInputType: TextInputType.visiblePassword,
              suffix: Container(
                  margin: EdgeInsets.fromLTRB(30.h, 16.v, 16.h, 16.v),
                  child: CustomImageView(
                      imagePath: ImageConstant.imgEyeGray600,
                      height: 24.adaptSize,
                      width: 24.adaptSize)),
              suffixConstraints: BoxConstraints(maxHeight: 56.v),
              obscureText: true),
          SizedBox(height: 24.v),
          CustomElevatedButton(
              text: "Sign In",
              onPressed: () {
                onTapSignIn(context);
              }),
          Spacer(),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                    padding: EdgeInsets.only(top: 8.v, bottom: 7.v),
                    child: SizedBox(
                        width: 100.h, child: Divider(color: appTheme.gray600))),
                Text("Or continue with",
                    style: CustomTextStyles.bodyMediumPrimary),
                Padding(
                    padding: EdgeInsets.only(top: 8.v, bottom: 7.v),
                    child: SizedBox(
                        width: 108.h, child: Divider(color: appTheme.gray600)))
              ]),
          SizedBox(height: 22.v),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Container(
                height: 56.v,
                width: 154.h,
                padding: EdgeInsets.symmetric(vertical: 15.v),
                decoration: AppDecoration.outlineGray
                    .copyWith(borderRadius: BorderRadiusStyle.roundedBorder16),
                child: CustomImageView(
                    imagePath: ImageConstant.imgSearch1,
                    height: 23.adaptSize,
                    width: 23.adaptSize,
                    alignment: Alignment.center)),
            Container(
                height: 56.v,
                width: 146.h,
                padding: EdgeInsets.symmetric(vertical: 15.v),
                decoration: AppDecoration.outlineGray
                    .copyWith(borderRadius: BorderRadiusStyle.roundedBorder16),
                child: CustomImageView(
                    imagePath: ImageConstant.imgAppleLogoBlack,
                    height: 23.v,
                    width: 19.h,
                    alignment: Alignment.center))
          ]),
          SizedBox(height: 18.v),
          Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                  padding: EdgeInsets.only(left: 44.h),
                  child: Row(children: [
                    Text("Register your account ?",
                        style: CustomTextStyles.bodyMediumGray600),
                    GestureDetector(
                        onTap: () {
                          onTapTxtSignUp(context);
                        },
                        child: Padding(
                            padding: EdgeInsets.only(left: 6.h),
                            child: Text("Sign up",
                                style: CustomTextStyles.bodyMediumSoraPrimary)))
                  ]))),
          SizedBox(height: 23.v)
        ]));
  }

  /// Navigates to the homeContainerScreen when the action is triggered.
  onTapSignIn(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.homeContainerScreen);
  }

  /// Shows a modal bottom sheet with [SignUpBottomsheet]
  /// widget content.
  /// The sheet is displayed on top of the current view with scrolling enabled if
  /// content exceeds viewport height.
  onTapTxtSignUp(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) => SignUpBottomsheet(),
        isScrollControlled: true);
  }
}
