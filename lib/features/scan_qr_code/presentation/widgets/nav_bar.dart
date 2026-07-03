import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:qrly_app/core/theme/app_text_style.dart';
import 'package:qrly_app/core/utils/app_color.dart';

import '../../../generate_qr_code/presentation/views/generate_qr_code_view.dart'
    show GenerateQrCodeView;
import '../../../scan_history/presentation/views/scan_history_view.dart';
import '../views/scan_qr_code_view.dart';

PersistentTabController _controller = PersistentTabController(initialIndex: 0);

// ignore: use_key_in_widget_constructors
class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      resizeToAvoidBottomInset: true,
      navBarStyle: NavBarStyle.style1,
      backgroundColor: AppColor.cardBackground,
      confineToSafeArea: true,

      decoration: NavBarDecoration(
        border: Border(top: BorderSide(color: AppColor.border, width: 1.0)),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
        colorBehindNavBar: Colors.transparent,
      ),
    );
  }
}

List<Widget> _buildScreens() {
  return [ScanQrCodeView(), GenerateQrCodeView(), ScanHistoryView()];
}

List<PersistentBottomNavBarItem> _navBarsItems() {
  return [
    PersistentBottomNavBarItem(
      title: 'Scan',
      textStyle: AppTextStyles.inter600Size12,

      inactiveIcon: SvgPicture.asset('assets/images/scan_icon.svg'),
      icon: SvgPicture.asset('assets/images/scan_icon_active.svg'),
      activeColorPrimary: AppColor.gray,
      activeColorSecondary: AppColor.iconMuted,
    ),
    PersistentBottomNavBarItem(
      title: 'Generate',
      textStyle: AppTextStyles.inter600Size12,
      inactiveIcon: SvgPicture.asset('assets/images/Generate_icon.svg'),
      icon: SvgPicture.asset('assets/images/Generate_icon_active.svg'),
      activeColorPrimary: AppColor.gray,
      activeColorSecondary: AppColor.iconMuted,
    ),
    PersistentBottomNavBarItem(
      title: 'History',
      textStyle: AppTextStyles.inter600Size12,
      inactiveIcon: SvgPicture.asset('assets/images/history_icon.svg'),
      icon: SvgPicture.asset('assets/images/history_icon_active.svg'),
      activeColorPrimary: AppColor.gray,
      inactiveColorPrimary: AppColor.iconMuted,
      activeColorSecondary: AppColor.iconMuted,
    ),
  ];
}
