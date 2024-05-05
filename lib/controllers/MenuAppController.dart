import 'package:flutter/material.dart';

class MenuAppController extends ChangeNotifier {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;

  void controlMenu() {
    if (!_scaffoldKey.currentState!.isDrawerOpen) {
      _scaffoldKey.currentState!.openDrawer();
    }
  }

  void logout(BuildContext context) {
    // Thực hiện các hoạt động logout ở đây (ví dụ: xóa phiên người dùng)

    // Chuyển hướng người dùng đến màn hình login
    Navigator.pushReplacementNamed(context, '/login');
  }
}
