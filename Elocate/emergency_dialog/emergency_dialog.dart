import 'package:chan_s_application4/core/app_export.dart';
import 'package:flutter/material.dart';
import 'package:chan_s_application4/presentation/vehicle details/bike_details.dart';

class EmergencyDialog extends StatelessWidget {
  const EmergencyDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 338.h,
        padding: EdgeInsets.symmetric(horizontal: 52.h, vertical: 41.v),
        decoration: AppDecoration.fillBlack
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder35),
        child: Container(
            height: 252.v,
            width: 230.h,
            decoration: AppDecoration.outlineBlack900,
            child: Stack(alignment: Alignment.topCenter, children: [
              Align(
                  alignment: Alignment.bottomCenter,
                  child: GestureDetector(
                      onTap: () {
                        onTapView(context);
                      },
                      child: Container(
                          height: 105.v,
                          width: 228.h,
                          decoration: BoxDecoration(
                              color: theme.colorScheme.primary,
                              borderRadius: BorderRadius.circular(5.h))))),
              Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                      height: 105.v,
                      width: 228.h,
                      decoration: BoxDecoration(
                          color: theme.colorScheme.primary,
                          borderRadius: BorderRadius.circular(5.h)))),
              Align(
                  alignment: Alignment.center,
                  child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 61.h),
                      child: Column(mainAxisSize: MainAxisSize.min, children: [
                        GestureDetector(
                            onTap: () {
                              onTapTxtBIKE(context);
                            },
                            child: Text("BIKE",
                                style: theme.textTheme.displayMedium)),
                        SizedBox(height: 89.v),
                        Text("CAR", style: theme.textTheme.displayMedium)
                      ])))
            ])));
  }

  /// Navigates to the firstStationTabContainerScreen when the action is triggered.
  onTapView(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.firstStationTabContainerScreen);
  }

  /// Navigates to the firstStationTabContainerScreen when the action is triggered.

  onTapTxtBIKE(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) => bikedetails(),
        isScrollControlled: true);
  }
}
