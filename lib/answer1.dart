import 'package:flutter/material.dart';

class Answer1 extends StatefulWidget {
  @override
  _AnswerState1 createState() => _AnswerState1();
}

class _AnswerState1 extends State<Answer1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('โปรไฟล์ผู้ใช้'),
        backgroundColor: Colors.lightBlue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // รูปโปรไฟล์
            Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundColor:
                        Colors.pinkAccent, // ถ้าต้องการให้พื้นหลังโปร่งใส
                    child: ClipOval(
                      child: Image.network(
                        'https://www.kasandbox.org/programming-images/avatars/leaf-blue.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  ListTile(
                    title: Center(
                      child: Text(
                        "ชื่อผู้ใช้: John Doe",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    subtitle: Center(
                      child: Text("อีเมล: johndoe@example.com"),
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.settings, color: Colors.blue),
                    title: Text("การตั้งค่า"),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: Icon(Icons.password, color: Colors.blue),
                    title: Text("เปลี่ยนรหัสผ่าน"),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: Icon(Icons.privacy_tip, color: Colors.blue),
                    title: Text("ความเป็นส่วนตัว"),
                    onTap: () {},
                  ),
                  Center(
                    child: ElevatedButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('แก้ไขโปรไฟล์')),
                          );
                        },
                        child: const Text('แก้ไขโปรไฟล์')),
                  ),
                  Center(
                    child: ElevatedButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('ออกจากระบบ')),
                          );
                        },
                        child: const Text('ออกจากระบบ')),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
