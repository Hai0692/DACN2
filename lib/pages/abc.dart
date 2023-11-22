import 'package:flutter/material.dart';

class EditProfileScreen extends StatefulWidget {
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _birthdayController = TextEditingController();

  bool validateData() {
  final name = _nameController.text;
  final email = _emailController.text;
  final phone = _phoneController.text;
  final address = _addressController.text;
  final birthday = _birthdayController.text;
  
  return true;
}


  // Hàm này hiển thị thông báo lỗi nếu cập nhật không thành công
  void showErrorDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Cập nhật không thành công'),
          content: Text('Có lỗi xảy ra trong quá trình cập nhật thông tin.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Đóng'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chỉnh sửa thông tin cá nhân'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Họ và tên'),
            ),
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextFormField(
              controller: _phoneController,
              decoration: InputDecoration(labelText: 'Số điện thoại'),
            ),
            TextFormField(
              controller: _addressController,
              decoration: InputDecoration(labelText: 'Địa chỉ'),
            ),
            TextFormField(
              controller: _birthdayController,
              decoration: InputDecoration(labelText: 'Ngày sinh'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                if (validateData()) {
                  // Gọi hàm cập nhật thông tin ở đây
                  // Nếu cập nhật thành công, có thể chuyển màn hình hoặc hiển thị thông báo thành công
                  // Nếu cập nhật không thành công, gọi showErrorDialog()
                }
              },
              child: Text('Cập nhật thông tin'),
            ),
          ],
        ),
      ),
    );
  }
}
