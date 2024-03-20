import 'package:chan_s_application4/core/app_export.dart';
import 'package:chan_s_application4/widgets/custom_elevated_button.dart';
import 'package:chan_s_application4/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:chan_s_application4/presentation/sign_in_bottomsheet/sign_in_bottomsheet.dart';

// ignore_for_file: must_be_immutable
class SignUpBottomsheet extends StatelessWidget {
  SignUpBottomsheet({Key? key}) : super(key: key);

  TextEditingController mobileNumberController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController confirmpasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.maxFinite,
        padding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 31.v),
        decoration: AppDecoration.fillBlack
            .copyWith(borderRadius: BorderRadiusStyle.customBorderTL32),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Text("Get Started", style: theme.textTheme.headlineSmall),
          SizedBox(height: 11.v),
          Text("Enter your details below",
              style: CustomTextStyles.bodyMediumBluegray4000114),
          SizedBox(height: 24.v),
          _buildMobileNumber(context),
          SizedBox(height: 24.v),
          _buildPassword(context),
          SizedBox(height: 24.v),
          _buildConfirmpassword(context),
          SizedBox(height: 24.v),
          _buildSignUp(context),
          SizedBox(height: 20.v),
          _buildTextRow(context),
          SizedBox(height: 22.v),
          _buildImageRow(context),
          SizedBox(height: 18.v),
          Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                  padding: EdgeInsets.only(left: 44.h),
                  child: Row(children: [
                    Text("Already have an account ?",
                        style: CustomTextStyles.bodyMediumBluegray40001),
                    GestureDetector(
                        onTap: () {
                          onTapTxtSignIn(context);
                        },
                        child: Padding(
                            padding: EdgeInsets.only(left: 6.h),
                            child: Text("Sign In",
                                style: CustomTextStyles.bodyMediumSoraPrimary)))
                  ]))),
          SizedBox(height: 26.v)
        ]));
  }

  /// Section Widget
  Widget _buildMobileNumber(BuildContext context) {
    return CustomTextFormField(
        controller: mobileNumberController,
        hintText: "Mobile Number",
        textInputType: TextInputType.phone,
        contentPadding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 18.v));
  }

  /// Section Widget
  Widget _buildPassword(BuildContext context) {
    return CustomTextFormField(
        controller: passwordController,
        hintText: "Password",
        textInputType: TextInputType.visiblePassword,
        suffix: Container(
            margin: EdgeInsets.fromLTRB(30.h, 16.v, 16.h, 16.v),
            child: CustomImageView(
                imagePath: ImageConstant.imgEye,
                height: 24.adaptSize,
                width: 24.adaptSize)),
        suffixConstraints: BoxConstraints(maxHeight: 56.v),
        obscureText: true);
  }

  /// Section Widget
  Widget _buildConfirmpassword(BuildContext context) {
    return CustomTextFormField(
        controller: confirmpasswordController,
        hintText: "Confirm Password",
        textInputAction: TextInputAction.done,
        textInputType: TextInputType.visiblePassword,
        suffix: Container(
            margin: EdgeInsets.fromLTRB(30.h, 16.v, 16.h, 16.v),
            child: CustomImageView(
                imagePath: ImageConstant.imgEye,
                height: 24.adaptSize,
                width: 24.adaptSize)),
        suffixConstraints: BoxConstraints(maxHeight: 56.v),
        obscureText: true);
  }

  /// Section Widget
  Widget _buildSignUp(BuildContext context) {
    return CustomElevatedButton(
        text: "Sign Up",
        onPressed: () {
          onTapSignUp(context);
        });
  }

  /// Section Widget
  Widget _buildTextRow(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
              padding: EdgeInsets.only(top: 8.v, bottom: 7.v),
              child: SizedBox(
                  width: 100.h, child: Divider(color: appTheme.blueGray90001))),
          Text("Or continue with", style: CustomTextStyles.bodyMediumPrimary),
          Padding(
              padding: EdgeInsets.only(top: 8.v, bottom: 7.v),
              child: SizedBox(
                  width: 108.h, child: Divider(color: appTheme.blueGray90001)))
        ]);
  }

  /// Section Widget
  Widget _buildImageRow(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(right: 6.h),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Container(
              height: 56.v,
              width: 154.h,
              padding: EdgeInsets.symmetric(vertical: 15.v),
              decoration: AppDecoration.outlineBlueGray
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
              decoration: AppDecoration.outlineBlueGray
                  .copyWith(borderRadius: BorderRadiusStyle.roundedBorder16),
              child: CustomImageView(
                  imagePath: ImageConstant.imgAppleLogoBlack,
                  height: 23.v,
                  width: 19.h,
                  alignment: Alignment.center))
        ]));
  }

  /// Shows a modal bottom sheet with [SignInBottomsheet]
  /// widget content.
  /// The sheet is displayed on top of the current view with scrolling enabled if
  /// content exceeds viewport height.
  onTapSignUp(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) => SignInBottomsheet(),
        isScrollControlled: true);
  }

  /// Shows a modal bottom sheet with [SignInBottomsheet]
  /// widget content.
  /// The sheet is displayed on top of the current view with scrolling enabled if
  /// content exceeds viewport height.
  onTapTxtSignIn(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) => SignInBottomsheet(),
        isScrollControlled: true);
  }
}
