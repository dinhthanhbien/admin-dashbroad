import 'package:flutter/material.dart';

class TabToday extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Danh sách các cuộc hẹn giả mạo
    List<Map<String, dynamic>> fakeAppointments = [
      {
        'time': '8:00 AM',
        'customerName': 'Nguyễn Văn A',
        'phoneNumber': '0123456789',
        'province': 'Tỉnh 1',
      },
      {
        'time': '10:00 AM',
        'customerName': 'Trần Thị B',
        'phoneNumber': '0987654321',
        'province': 'Tỉnh 2',
      },
      // Thêm các cuộc hẹn giả mạo khác ở đây nếu cần
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Text(
            'TAB HÔM NAY',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          child: DataTable(
            columns: [
              DataColumn(label: Text('Thời gian')),
              DataColumn(label: Text('Tên khách hàng')),
              DataColumn(label: Text('Số điện thoại')),
              DataColumn(label: Text('Tỉnh')),
            ],
            rows: fakeAppointments.map((appointment) {
              return DataRow(cells: [
                DataCell(Text(appointment['time'])),
                DataCell(Text(appointment['customerName'])),
                DataCell(Text(appointment['phoneNumber'])),
                DataCell(Text(appointment['province'])),
              ]);
            }).toList(),
          ),
        ),
      ],
    );
  }
}
