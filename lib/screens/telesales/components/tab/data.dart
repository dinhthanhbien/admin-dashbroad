import 'package:flutter/material.dart';
import '../../../../constants.dart';
import 'customer_data.dart'; // Import class CustomerData

enum CustomerCareLevel {
  onTime, // Đến ngày chăm
  threeMonths, // 3 tháng chưa chăm
  sixMonths, // 6 tháng chưa chăm
  oneYear, // 1 năm chưa chăm
}

class TabData extends StatefulWidget {
  @override
  _TabDataState createState() => _TabDataState();
}

class _TabDataState extends State<TabData> {
  String selectedProvince = '';
  bool isProvinceSelected = false;
  CustomerCareLevel selectedCareLevel = CustomerCareLevel.onTime;
  Map<String, Color> provinceColors = {};

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildHeader(),
        _buildBody(),
      ],
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: defaultPadding),
      child: Text(
        'TAB DỮ LIỆU',
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildSelectProvincePrompt() {
    return Center(
      child: Text('Chọn tỉnh để xem thông tin khách hàng.'),
    );
  }

  Widget _buildBody() {
    return Row(
      children: [
        SizedBox(
          width: 200, // Thay đổi giá trị này theo nhu cầu của bạn
          child: _buildProvinceList(),
        ),
        SizedBox(width: defaultPadding),
        Expanded(
          child: Container(
            padding: EdgeInsets.all(defaultPadding),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 20,
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildCareLevelSelector(),
                SizedBox(height: defaultPadding),
                isProvinceSelected
                    ? _buildCustomerInfo()
                    : _buildSelectProvincePrompt(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCareLevelSelector() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Mức chăm sóc:',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5),
        DropdownButton<CustomerCareLevel>(
          value: selectedCareLevel,
          onChanged: (value) {
            setState(() {
              selectedCareLevel = value!;
            });
          },
          items: CustomerCareLevel.values.map((level) {
            return DropdownMenuItem<CustomerCareLevel>(
              value: level,
              child: Text(_careLevelToString(level)),
            );
          }).toList(),
        ),
      ],
    );
  }

  String _careLevelToString(CustomerCareLevel level) {
    switch (level) {
      case CustomerCareLevel.onTime:
        return 'Đến ngày chăm';
      case CustomerCareLevel.threeMonths:
        return '3 tháng chưa chăm';
      case CustomerCareLevel.sixMonths:
        return '6 tháng chưa chăm';
      case CustomerCareLevel.oneYear:
        return '1 năm chưa chăm';
      default:
        return '';
    }
  }

  Widget _buildProvinceList() {
    return ListView(
      shrinkWrap: true,
      children: CustomerData.customerData.keys.map((province) {
        return ListTile(
          title: Text(
            province,
            style: TextStyle(
              color: provinceColors.containsKey(province)
                  ? provinceColors[province]
                  : null,
            ),
          ),
          onTap: () {
            setState(() {
              if (selectedProvince.isNotEmpty) {
                provinceColors
                    .remove(selectedProvince); // Xóa màu sắc của tỉnh trước
              }
              selectedProvince = province;
              provinceColors[province] = Colors.blue;
              isProvinceSelected = true;
            });
          },
        );
      }).toList(),
    );
  }

  Widget _buildCustomerInfo() {
    List<Map<String, dynamic>> filteredCustomers =
        CustomerData.customerData[selectedProvince] ?? [];

    // Lọc khách hàng theo mức chăm sóc
    filteredCustomers =
        _filterCustomersByCareLevel(filteredCustomers, selectedCareLevel);

    if (filteredCustomers.isEmpty) {
      return Center(
        child: Text('Không có khách hàng nào trong nhóm chăm sóc này.'),
      );
    }

    List<DataRow> rows = [];
    filteredCustomers.forEach((customer) {
      rows.add(DataRow(
        cells: [
          DataCell(Text(customer['name'])),
          DataCell(Text(customer['address'])),
          DataCell(Text(customer['phone'])),
          DataCell(Text(customer['model'])),
          DataCell(Text(customer['purchaseDate'])),
          DataCell(Text(customer['lastServiceDate'])),
          DataCell(
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    // Thực hiện hành động chỉnh sửa
                  },
                ),
                IconButton(
                  icon: Icon(Icons.call),
                  onPressed: () {
                    // Thực hiện hành động gọi
                  },
                ),
              ],
            ),
          ),
        ],
      ));
    });

    return DataTable(
      columns: [
        DataColumn(label: Text('Tên')),
        DataColumn(label: Text('Địa chỉ')),
        DataColumn(label: Text('SĐT')),
        DataColumn(label: Text('Model máy')),
        DataColumn(label: Text('Ngày mua máy')),
        DataColumn(label: Text('Ngày chăm gần nhất')),
        DataColumn(label: Text('Chỉnh sửa')), // Thêm cột chỉnh sửa vào bảng
      ],
      rows: rows,
    );
  }

  List<Map<String, dynamic>> _filterCustomersByCareLevel(
      List<Map<String, dynamic>> customers, CustomerCareLevel careLevel) {
    DateTime now = DateTime.now();
    return customers.where((customer) {
      DateTime lastServiceDate = DateTime.parse(customer['lastServiceDate']);
      Duration difference = now.difference(lastServiceDate);
      switch (careLevel) {
        case CustomerCareLevel.onTime:
          return difference.inDays <= 0; // Đến ngày chăm
        case CustomerCareLevel.threeMonths:
          return difference.inDays > 90 &&
              difference.inDays <= 180; // 3 tháng chưa chăm
        case CustomerCareLevel.sixMonths:
          return difference.inDays > 180 &&
              difference.inDays <= 365; // 6 tháng chưa chăm
        case CustomerCareLevel.oneYear:
          return difference.inDays > 365; // 1 năm chưa chăm
        default:
          return false;
      }
    }).toList();
  }
}
