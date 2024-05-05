import 'package:flutter/material.dart';
import 'customer_data.dart'; // Import class CustomerData

class TabAppointment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'TAB LỊCH HẸN',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            // Bảng hiển thị thông tin lịch hẹn theo từng ngày
            DataTable(
              columns: [
                DataColumn(label: Text('Ngày')),
                DataColumn(label: Text('Cuộc hẹn')),
                DataColumn(label: Text('Tên khách hàng')),
                DataColumn(label: Text('Tuổi')),
                DataColumn(label: Text('Địa chỉ')),
                DataColumn(label: Text('Số điện thoại')),
                DataColumn(label: Text('Thao tác')),
              ],
              rows: CustomerData.appointmentData.map((appointment) {
                return DataRow(cells: [
                  DataCell(Text(appointment['date'])),
                  DataCell(Text('${appointment['appointments']}')),
                  DataCell(
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: appointment['customers']
                          .map<Widget>((customer) => Text(customer['name']))
                          .toList(),
                    ),
                  ),
                  DataCell(
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: appointment['customers']
                          .map<Widget>((customer) => Text('${customer['age']}'))
                          .toList(),
                    ),
                  ),
                  DataCell(
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: appointment['customers']
                          .map<Widget>((customer) => Text(customer['address']))
                          .toList(),
                    ),
                  ),
                  DataCell(
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: appointment['customers']
                          .map<Widget>((customer) => Text(customer['phone']))
                          .toList(),
                    ),
                  ),
                  DataCell(
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.add),
                          onPressed: () {
                            // Thực hiện hành động thêm
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.call),
                          onPressed: () {
                            // Thực hiện hành động gọi
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.edit),
                          onPressed: () {
                            // Thực hiện hành động chỉnh sửa
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            // Thực hiện hành động xóa
                          },
                        ),
                      ],
                    ),
                  ),
                ]);
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
