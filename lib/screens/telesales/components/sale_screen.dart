import 'package:flutter/material.dart';
import 'package:admin/screens/telesales/components/tab/appointment.dart';
import 'package:admin/screens/telesales/components/tab/data.dart';
import 'package:admin/screens/telesales/components/tab/pending_approval.dart';
import 'package:admin/screens/telesales/components/tab/today.dart';
import 'package:admin/screens/telesales/components/tab/total_month.dart';
import 'package:admin/responsive.dart';

import '../../../constants.dart';
import '../../dashboard/components/header.dart';

class SaleScreen extends StatefulWidget {
  @override
  _SaleScreenState createState() => _SaleScreenState();
}

class _SaleScreenState extends State<SaleScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  // List of tabs
  final List<Widget> _tabs = [
    TabAppointment(),
    TabData(),
    TabPendingApproval(),
    TabToday(),
    TabTotalMonth(),
  ];

  // List of tab names
  final List<String> _tabNames = [
    'LỊCH HẸN',
    'DỮ LIỆU',
    'CHỜ DUYỆT',
    'HÔM NAY',
    'TỔNG THÁNG',
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Header(),
          SizedBox(height: defaultPadding),
          Responsive.isMobile(context)
              ? SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: TabBar(
                    controller: _tabController,
                    isScrollable: true,
                    indicatorColor: Colors.blue,
                    tabs: [
                      for (int index = 0; index < _tabNames.length; index++)
                        Tab(
                          text: _tabNames[index],
                        ),
                    ],
                  ),
                )
              : TabBar(
                  controller: _tabController,
                  tabs: [
                    for (int index = 0; index < _tabNames.length; index++)
                      Tab(
                        text: _tabNames[index],
                      ),
                  ],
                ),
          SizedBox(height: defaultPadding),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: _tabs,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
