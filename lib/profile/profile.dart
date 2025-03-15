import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String name = "Treeruch pornphusri";
  String nickname = "Dan";
  String email = "pornphusri_t@su.ac.th";
  String age = "21";
  String gender = "Male";
  String dob = "10 February 1994";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("My Profile", style: TextStyle(color: Colors.white)),
        ),
        backgroundColor: Colors.indigo,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(30),
        child: Column(
          children: [
            // รูปโปรไฟล์
            Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 80,
                    backgroundImage: AssetImage('assets/profile.jpg'),
                    backgroundColor:
                        Colors.transparent, // ถ้าต้องการให้พื้นหลังโปร่งใส
                    child: ClipOval(
                      child: Image.asset(
                        'assets/profile.jpg',
                        fit: BoxFit.cover, // ทำให้รูปภาพยืดเต็มทรงกลม
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 30),

            // ข้อมูลโปรไฟล์
            Card(
              child: ListTile(
                title: Text("Name"),
                subtitle: Text(name),
              ),
            ),
            Card(
              child: ListTile(
                title: Text("Nickname"),
                subtitle: Text(nickname),
              ),
            ),
            Card(
              child: ListTile(
                title: Text("E-mail"),
                subtitle: Text(email),
              ),
            ),
            Card(
              child: ListTile(
                title: Text("Age"),
                subtitle: Text(age),
              ),
            ),
            Card(
              child: ListTile(
                title: Text("Gender"),
                subtitle: Text(gender),
              ),
            ),
            Card(
              child: ListTile(
                title: Text("Date of Birth"),
                subtitle: Text(dob),
              ),
            ),

            SizedBox(height: 20),
            // ปุ่ม Edit
            ElevatedButton.icon(
              onPressed: () {
                TextEditingController nameController =
                    TextEditingController(text: name);
                TextEditingController usernameController =
                    TextEditingController(text: nickname);
                TextEditingController emailController =
                    TextEditingController(text: email);
                TextEditingController phoneController =
                    TextEditingController(text: age);
                TextEditingController genderController =
                    TextEditingController(text: gender);
                TextEditingController dobController =
                    TextEditingController(text: dob);

                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('Edit Profile'),
                      content: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: TextField(
                                controller: nameController,
                                decoration: InputDecoration(
                                  labelText: "Name",
                                  filled: true,
                                  fillColor: Colors.grey[200],
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide.none,
                                  ),
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 12),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: TextField(
                                controller: usernameController,
                                decoration: InputDecoration(
                                  labelText: "Username",
                                  filled: true,
                                  fillColor: Colors.grey[200],
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide.none,
                                  ),
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 12),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: TextField(
                                controller: emailController,
                                decoration: InputDecoration(
                                  labelText: "E-mail",
                                  filled: true,
                                  fillColor: Colors.grey[200],
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide.none,
                                  ),
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 12),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: TextField(
                                controller: phoneController,
                                decoration: InputDecoration(
                                  labelText: "Phone Number",
                                  filled: true,
                                  fillColor: Colors.grey[200],
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide.none,
                                  ),
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 12),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: TextField(
                                controller: genderController,
                                decoration: InputDecoration(
                                  labelText: "Gender",
                                  filled: true,
                                  fillColor: Colors.grey[200],
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide.none,
                                  ),
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 12),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: TextField(
                                controller: dobController,
                                decoration: InputDecoration(
                                  labelText: "Date of Birth",
                                  filled: true,
                                  fillColor: Colors.grey[200],
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide.none,
                                  ),
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 12),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text('Cancel'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              name = nameController.text;
                              nickname = usernameController.text;
                              email = emailController.text;
                              age = phoneController.text;
                              gender = genderController.text;
                              dob = dobController.text;
                            });
                            Navigator.pop(context);
                          },
                          child: Text('Save'),
                        ),
                      ],
                    );
                  },
                );
              },
              icon: Icon(Icons.edit),
              label: Text("Edit"),
            ),
          ],
        ),
      ),
    );
  }
}
