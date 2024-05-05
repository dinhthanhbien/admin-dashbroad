import 'dart:math';

class CustomerData {
  static Map<String, List<Map<String, dynamic>>> customerData = {
    'Tỉnh 1': [
      {
        'name': 'Nguyễn Văn A',
        'address': '123 Đường ABC',
        'phone': '0123456789',
        'model': 'Model A',
        'purchaseDate': '2023-01-01',
        'lastServiceDate': '2023-04-01',
      },
      {
        'name': 'Trần Thị B',
        'address': '456 Đường XYZ',
        'phone': '0987654321',
        'model': 'Model B',
        'purchaseDate': '2022-12-15',
        'lastServiceDate': '2023-03-15',
      },
    ],
    'Tỉnh 2': [
      {
        'name': 'Lê Văn C',
        'address': '789 Đường DEF',
        'phone': '0123456789',
        'model': 'Model C',
        'purchaseDate': '2023-02-10',
        'lastServiceDate': '2023-05-10',
      },
      {
        'name': 'Phạm Thị D',
        'address': '101 Đường GHI',
        'phone': '0987654321',
        'model': 'Model D',
        'purchaseDate': '2023-01-20',
        'lastServiceDate': '2023-04-20',
      },
    ],
    // Add more fake customer data for other provinces here
  };

  static final List<Map<String, dynamic>> appointmentData = [
    {
      'date': '2022-04-25',
      'appointments': 5,
      'customers': [
        {
          'name': 'Nguyễn Văn A',
          'age': _calculateAge(30),
          // Tính tuổi từ số ngày được sinh ra ngẫu nhiên
          'address': '123 Đường ABC, Quận XYZ',
          'phone': '0123456789',
          'province': 'Tỉnh 1',
        },
        // Thêm dữ liệu khách hàng ở đây
      ],
    },
    {
      'date': '2022-04-26',
      'appointments': 7,
      'customers': [
        {
          'name': 'Trần Thị B',
          'age': _calculateAge(25),
          // Tính tuổi từ số ngày được sinh ra ngẫu nhiên
          'address': '456 Đường XYZ, Quận ABC',
          'phone': '0987654321',
          'province': 'Tỉnh 1',
        },
        // Thêm dữ liệu khách hàng ở đây
      ],
    },
    // Thêm dữ liệu ngày và khách hàng ở đây
  ];

  static int _calculateAge(int days) {
    final today = DateTime.now();
    final birthday = today.subtract(Duration(days: days));
    var age = today.year - birthday.year;
    if (today.month < birthday.month ||
        (today.month == birthday.month && today.day < birthday.day)) {
      age--;
    }
    return age;
  }

  static void calculateLastServiceDuration() {
    // Tính toán và cập nhật trường thời gian chăm sóc cuối cùng cho mỗi khách hàng
    DateTime now = DateTime.now();
    customerData.forEach((province, customers) {
      customers.forEach((customer) {
        DateTime lastServiceDate = DateTime.parse(customer['lastServiceDate']);
        Duration duration = now.difference(lastServiceDate);
        customer['lastServiceDuration'] = duration.inDays;
      });
    });
  }
}
