import 'package:chan_s_application4/core/app_export.dart';
import 'package:chan_s_application4/presentation/home_page/home_page.dart';
import 'package:chan_s_application4/presentation/qr/qrcode.dart';
import 'package:chan_s_application4/presentation/search/search.dart';
import 'package:chan_s_application4/widgets/custom_bottom_app_bar.dart';
import 'package:chan_s_application4/widgets/custom_floating_button.dart';
import 'package:chan_s_application4/presentation/map/map.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class HomeContainerScreen extends StatelessWidget {
  HomeContainerScreen({Key? key}) : super(key: key);

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          
            body: Navigator(
                key: navigatorKey,
                initialRoute: AppRoutes.homePage,
                onGenerateRoute: (routeSetting) => PageRouteBuilder(
                    pageBuilder: (ctx, ani, ani1) =>
                        getCurrentPage(routeSetting.name!),
                    transitionDuration: Duration(seconds: 0))),
            bottomNavigationBar: _buildBottomAppBar(context),
            floatingActionButton: CustomFloatingButton(
                height: 70, width: 52, child: Icon(Icons.add)),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked));
  }

  /// Section Widget
  Widget _buildBottomAppBar(BuildContext context) {
    return CustomBottomAppBar(onChanged: (BottomBarEnum type) {
      Navigator.pushNamed(navigatorKey.currentContext!, getCurrentRoute(type));
    });
  }

  ///Handling route based on bottom click actions
  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Home:
        return AppRoutes.homePage;
      case BottomBarEnum.Search:
        return AppRoutes.firstStationPage;
      case BottomBarEnum.Linkedin:
        return AppRoutes.homeContainerScreen;
      case BottomBarEnum.Lock:
        return AppRoutes.firstStationTabContainerScreen;
      default:
        return "/";
    }
  }

  ///Handling page based on route
  Widget getCurrentPage(String currentRoute) {
    switch (currentRoute) {
      case AppRoutes.homePage:
        return HomePage();
      case AppRoutes.firstStationPage:
        return MyApp();
      case AppRoutes.homeContainerScreen:
        return Mylocat();
      case AppRoutes.firstStationTabContainerScreen:
        return Myqr();
      default:
        return DefaultWidget();
    }
  }
}
