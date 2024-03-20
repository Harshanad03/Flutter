import 'dart:async';
import 'package:chan_s_application4/core/app_export.dart';
import 'package:chan_s_application4/presentation/boobking/booking.dart';
import 'package:chan_s_application4/presentation/viewcamera/camera.dart';
import 'package:chan_s_application4/widgets/custom_elevated_button.dart';
import 'package:chan_s_application4/widgets/custom_outlined_button.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

// ignore_for_file: must_be_immutable
class FirstStationPage extends StatefulWidget {
  const FirstStationPage({Key? key})
      : super(
          key: key,
        );

  @override
  FirstStationPageState createState() => FirstStationPageState();
}

class FirstStationPageState extends State<FirstStationPage>
    with AutomaticKeepAliveClientMixin<FirstStationPage> {
  Completer<GoogleMapController> googleMapController = Completer();

  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.whiteA70001,
        body: SizedBox(
          width: SizeUtils.width,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 124.v),
                _buildUserProfile(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildRecentOrders(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 11.h,
        right: 23.h,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 11.h,
        vertical: 7.v,
      ),
      decoration: AppDecoration.outlineGray500.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder16,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 7.v),
          Padding(
            padding: EdgeInsets.only(
              left: 6.h,
              right: 3.h,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 2.v),
                  child: Text(
                    "Open",
                    style: theme.textTheme.titleMedium,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 15.h),
                  child: Text(
                    "24 hours",
                    style: theme.textTheme.bodyLarge,
                  ),
                ),
                Spacer(),
                CustomImageView(
                  imagePath: ImageConstant.imgArrowUp,
                  height: 9.v,
                  width: 14.h,
                  margin: EdgeInsets.only(
                    top: 5.v,
                    bottom: 7.v,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 12.v),
          Padding(
            padding: EdgeInsets.only(left: 4.h),
            child: Column(
              children: [
                Divider(),
                SizedBox(height: 11.v),
                Padding(
                  padding: EdgeInsets.only(left: 6.h),
                  child: _buildDoctorReviews(
                    context,
                    dayOfWeek: "Monday",
                    timeRange: "00:00 - 00:00",
                  ),
                ),
                SizedBox(height: 14.v),
                Padding(
                  padding: EdgeInsets.only(left: 6.h),
                  child: _buildDoctorReviews(
                    context,
                    dayOfWeek: "Tuesday",
                    timeRange: "00:00 - 00:00",
                  ),
                ),
                SizedBox(height: 14.v),
                Padding(
                  padding: EdgeInsets.only(left: 6.h),
                  child: _buildDoctorReviews(
                    context,
                    dayOfWeek: "Wednesday",
                    timeRange: "00:00 - 00:00",
                  ),
                ),
                SizedBox(height: 13.v),
                Padding(
                  padding: EdgeInsets.only(left: 6.h),
                  child: _buildDoctorReviews(
                    context,
                    dayOfWeek: "Thursday",
                    timeRange: "00:00 - 00:00",
                  ),
                ),
                SizedBox(height: 13.v),
                Padding(
                  padding: EdgeInsets.only(left: 6.h),
                  child: _buildDoctorReviews(
                    context,
                    dayOfWeek: "Friday",
                    timeRange: "00:00 - 00:00",
                  ),
                ),
                SizedBox(height: 14.v),
                Padding(
                  padding: EdgeInsets.only(left: 6.h),
                  child: _buildDoctorReviews(
                    context,
                    dayOfWeek: "Saturday",
                    timeRange: "00:00 - 00:00",
                  ),
                ),
                SizedBox(height: 11.v),
                Padding(
                  padding: EdgeInsets.only(left: 6.h),
                  child: _buildDoctorReviews(
                    context,
                    dayOfWeek: "Sunday",
                    timeRange: "00:00 - 00:00",
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildUserProfile(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 25.h,
        right: 16.h,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(
              left: 10.h,
              right: 24.h,
            ),
            padding: EdgeInsets.symmetric(
              horizontal: 10.h,
              vertical: 16.v,
            ),
            decoration: AppDecoration.outlineGray500.copyWith(
              borderRadius: BorderRadiusStyle.roundedBorder16,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 2.v),
                Padding(
                  padding: EdgeInsets.only(
                    left: 12.h,
                    right: 3.h,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Parking station 1",
                        style: theme.textTheme.bodyLarge,
                      ),
                      Text(
                        "Free",
                        style: theme.textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 12.v),
                Padding(
                  padding: EdgeInsets.only(
                    left: 12.h,
                    right: 3.h,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Parking station 2",
                        style: theme.textTheme.bodyLarge,
                      ),
                      Text(
                        "booked",
                        style: theme.textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 12.v),
                Padding(
                  padding: EdgeInsets.only(
                    left: 12.h,
                    right: 3.h,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Parking station 3",
                        style: theme.textTheme.bodyLarge,
                      ),
                      Text(
                        "Free",
                        style: theme.textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 12.v),
                Padding(
                  padding: EdgeInsets.only(
                    left: 12.h,
                    right: 3.h,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Parking station 4",
                        style: theme.textTheme.bodyLarge,
                      ),
                      TextButton(
                        style: ButtonStyle(
                          foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                        ),
                        onPressed: () {
                          additionProcess(context);
                        },
                        child: Text('Free'),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 12.v),



                Divider(
                  indent: 3.h,
                  endIndent: 3.h,
                ),
                SizedBox(height: 12.v),
                Padding(
                  padding: EdgeInsets.only(left: 12.h),
                  child: _buildDoctorReviews(
                    context,
                    dayOfWeek: "Cost",
                    timeRange: "30.00/Kw",
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 24.v),
          _buildRecentOrders(context),
          SizedBox(height: 18.v),
          Align(
            alignment: Alignment.center,
            child: Container(
              margin: EdgeInsets.only(
                left: 15.h,
                right: 19.h,
              ),
              padding: EdgeInsets.symmetric(
                horizontal: 11.h,
                vertical: 18.v,
              ),
              decoration: AppDecoration.outlineGray500.copyWith(
                borderRadius: BorderRadiusStyle.roundedBorder16,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: 6.h,
                      right: 3.h,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Facilities",
                          style: CustomTextStyles.titleMediumPrimaryContainer,
                        ),
                        CustomImageView(
                          imagePath: ImageConstant.imgArrowUp,
                          height: 9.v,
                          width: 14.h,
                          margin: EdgeInsets.only(bottom: 9.v),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.v),
                  Divider(),
                  Divider(),
                  SizedBox(height: 14.v),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 6.h,
                      right: 13.h,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomImageView(
                          imagePath: ImageConstant.imgThumbsUp,
                          height: 24.v,
                          width: 26.h,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 11.h,
                            top: 3.v,
                          ),
                          child: Text(
                            "Washroom",
                            style: theme.textTheme.bodyMedium,
                          ),
                        ),
                        Spacer(),
                        CustomImageView(
                          imagePath: ImageConstant.imgSettings,
                          height: 17.v,
                          width: 21.h,
                          margin: EdgeInsets.only(
                            top: 4.v,
                            bottom: 3.v,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 11.h,
                            top: 2.v,
                            bottom: 2.v,
                          ),
                          child: Text(
                            "Wi-Fi",
                            style: theme.textTheme.bodyMedium,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 2.v),
                ],
              ),
            ),
          ),
          SizedBox(height: 17.v),
          SizedBox(
            height: 203.v,
            width: 314.h,
            child: GoogleMap(
              //TODO: Add your Google Maps API key in AndroidManifest.xml and pod file
              mapType: MapType.normal,
              initialCameraPosition: CameraPosition(
                target: LatLng(
                  37.43296265331129,
                  -122.08832357078792,
                ),
                zoom: 14.4746,
              ),
              onMapCreated: (GoogleMapController controller) {
                googleMapController.complete(controller);
              },
              zoomControlsEnabled: false,
              zoomGesturesEnabled: false,
              myLocationButtonEnabled: false,
              myLocationEnabled: false,
            ),
          ),
          SizedBox(height: 23.v),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: CustomOutlinedButton(
                  text: "Locate",
                  margin: EdgeInsets.only(right: 21.h),
                ),
              ),
              Expanded(
                child: CustomElevatedButton(
                  height: 59.v,
                  text: "Book Now",
                  margin: EdgeInsets.only(left: 21.h),
                  buttonTextStyle: CustomTextStyles.titleMediumWhiteA70001,
                    onPressed: () {
                      onTapLetsGoButton(context);
                    }
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// Common widget
  Widget _buildDoctorReviews(
    BuildContext context, {
    required String dayOfWeek,
    required String timeRange,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          dayOfWeek,
          style: theme.textTheme.bodyLarge!.copyWith(
            color: appTheme.gray60001,
          ),
        ),
        Text(
          timeRange,
          style: theme.textTheme.bodyMedium!.copyWith(
            color: appTheme.gray900,
          ),
        ),
      ],
    );
  }

  onTapLetsGoButton(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) => Mybook(),
        isScrollControlled: true);
  }
  additionProcess(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) => Mycamera(),
        isScrollControlled: true);
  }
}
