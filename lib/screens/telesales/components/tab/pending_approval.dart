import 'package:flutter/material.dart';

class TabPendingApproval extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Text(
            'TAB CHỜ DUYỆT',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          child: ListView(
            children: [
              AppointmentCard(
                customerName: 'Nguyễn Văn A',
                options: ['Đồng ý hủy', 'Yêu cầu kỹ thuật xử lý lại'],
              ),
              AppointmentCard(
                customerName: 'Trần Thị B',
                options: ['Đồng ý hủy', 'Yêu cầu kỹ thuật xử lý lại'],
              ),
              // Thêm các AppointmentCard khác ở đây nếu cần
            ],
          ),
        ),
      ],
    );
  }
}

class AppointmentCard extends StatefulWidget {
  final String customerName;
  final List<String> options;

  const AppointmentCard({
    Key? key,
    required this.customerName,
    required this.options,
  }) : super(key: key);

  @override
  _AppointmentCardState createState() => _AppointmentCardState();
}

class _AppointmentCardState extends State<AppointmentCard> {
  String? _selectedOption;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      child: Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Khách hàng: ${widget.customerName}',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: widget.options.map((option) {
                return RadioListTile<String>(
                  title: Text(option),
                  value: option,
                  groupValue: _selectedOption,
                  onChanged: (value) {
                    setState(() {
                      _selectedOption = value;
                    });
                  },
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
