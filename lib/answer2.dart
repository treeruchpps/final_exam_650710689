import 'package:flutter/material.dart';

class Answer2 extends StatefulWidget {
  @override
  _AnswerState2 createState() => _AnswerState2();
}

class _AnswerState2 extends State<Answer2> {
  String? _selectedItem;
  bool _acceptTerms = false;
  bool _acceptTerm = false;
  String? _price;
  final TextEditingController priceController = TextEditingController();
  final TextEditingController distanceController = TextEditingController();
  final TextEditingController packageController = TextEditingController();
  final TextEditingController howfastController = TextEditingController();
  String result = "";

  void calculate() {
    double distance = double.tryParse(distanceController.text) ?? 0;
    if (packageController == 'ในเมือง') {
      distance = double.tryParse(packageController.text) ?? 0;
    } else if (packageController == 'ต่างจังหวัด') {
      distance = double.tryParse(packageController.text) ?? 15;
    } else if (packageController == 'ต่างประเทศ') {
      distance = double.tryParse(howfastController.text) ?? 30;
    }
    double package = double.tryParse(packageController.text) ?? 0;
    if (packageController == 'แพ็คกิ้งพิเศษ: +20 บาท') {
      package = double.tryParse(packageController.text) ?? 20;
    } else if (packageController == 'ประกันพัสดุ: +50 บาท') {
      package = double.tryParse(packageController.text) ?? 50;
    }
    double howfast = double.tryParse(howfastController.text) ?? 0;
    if (howfast == 'ปกติ') {
      howfast = double.tryParse(howfastController.text) ?? 0;
    } else if (howfast == 'ด่วน') {
      howfast = double.tryParse(howfastController.text) ?? 30;
    } else if (howfast == 'ด่วนพิเศษ') {
      howfast = double.tryParse(howfastController.text) ?? 50;
    }
    setState(() {
      result = "ค่าจัดส่งทั้งหมด: ${2 * (distance + package + howfast)}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('คำนวณค่าจัดส่ง'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                TextField(
                  controller: priceController,
                  decoration:
                      const InputDecoration(labelText: "น้ำหนักสินค้า (กก.)"),
                ),
                const SizedBox(height: 10),
                Text("เลือกระยะทาง"),
                DropdownButtonFormField<String>(
                  decoration:
                      const InputDecoration(labelText: 'Select an option'),
                  value: _selectedItem,
                  items: ['ในเมือง', 'ต่างจังหวัด', 'ต่างประเทศ']
                      .map((item) =>
                          DropdownMenuItem(value: item, child: Text(item)))
                      .toList(),
                  onChanged: (value) {
                    _selectedItem = value;
                  },
                  validator: (value) =>
                      value == null ? 'Please select an option' : null,
                ),
                const SizedBox(height: 10),
                Text("บริการเสริม:"),
                Row(
                  children: [
                    const Text('แพ็คกิ้งพิเศษ: +20 บาท'),
                    Checkbox(
                      value: _acceptTerms,
                      onChanged: (value) {
                        setState(() => _acceptTerms = value!);
                      },
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Text('ประกันพัสดุ: +50 บาท'),
                    Checkbox(
                      value: _acceptTerm,
                      onChanged: (value) {
                        setState(() => _acceptTerm = value!);
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text("เลือกความเร่งด่วน:"),
                RadioListTile<String>(
                  title: const Text('ปกติ'),
                  value: 'ปกติ',
                  groupValue: _price,
                  onChanged: (value) {
                    setState(() => _price = value);
                  },
                ),
                RadioListTile<String>(
                  title: const Text('ด่วน'),
                  value: 'ด่วน',
                  groupValue: _price,
                  onChanged: (value) {
                    setState(() => _price = value);
                  },
                ),
                RadioListTile<String>(
                  title: const Text('ด่วนพิเศษ'),
                  value: 'ด่วนพิเศษ',
                  groupValue: _price,
                  onChanged: (value) {
                    setState(() => _price = value);
                  },
                ),
                const SizedBox(height: 10),
                Center(
                  child: ElevatedButton(
                      onPressed: calculate, child: const Text('คำนวณราคา')),
                ),
                Text(
                  result,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ])),
        ));
  }
}
