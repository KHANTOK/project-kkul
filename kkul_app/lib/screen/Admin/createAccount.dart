import 'package:flutter/material.dart';
import 'package:kkul_app/color.dart';
import 'package:kkul_app/widgets/button.dart';

class CreateAccScreen extends StatefulWidget {
  const CreateAccScreen({Key? key}) : super(key: key);

  @override
  _CreateAccScreenState createState() => _CreateAccScreenState();
}

class _CreateAccScreenState extends State<CreateAccScreen> {
  // Default Radio Button Selected Item When App Starts.
  String radioButtonItem = 'นักเรียน/นักศึกษา';

  // Group Value for Radio Button.
  int id = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            "สร้างบัญชี",
            style: TextStyle(color: Colors.black, fontSize: 22),
          ),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_new,
            ),
            color: kPrimaryColor,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 26),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Radio(
                    activeColor: kPrimaryLightColor,
                    value: 1,
                    groupValue: id,
                    onChanged: (val) {
                      setState(() {
                        radioButtonItem = 'นักเรียน/นักศึกษา';
                        id = 1;
                      });
                    },
                  ),
                  Text(
                    'นักเรียน/นักศึกษา',
                    style: new TextStyle(fontSize: 17.0),
                  ),
                  Radio(
                    activeColor: kPrimaryLightColor,
                    value: 2,
                    groupValue: id,
                    onChanged: (val) {
                      setState(() {
                        radioButtonItem = 'ผู้ดูแล';
                        id = 2;
                      });
                    },
                  ),
                  Text(
                    'ผู้ดูแล',
                    style: new TextStyle(
                      fontSize: 17.0,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'ชื่อและนามสกุล',
                  labelStyle: TextStyle(color: kPrimaryColor),
                  helperText: 'ตัวอย่าง : มาณี อุดมสุข',
                ),
              ),
              SizedBox(height: 15),
              TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'ไอดี',
                    labelStyle: TextStyle(color: kPrimaryColor),
                    helperText: 'ตัวอย่าง : 613040600-9'),
              ),
              SizedBox(height: 15),
              TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'อีเมล',
                    labelStyle: TextStyle(color: kPrimaryColor),
                    helperText: 'ตัวอย่าง : manee@kku.ac.th'),
              ),
              SizedBox(height: 15),
              TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'หมายเลขโทรศัพท์',
                    labelStyle: TextStyle(color: kPrimaryColor),
                    helperText: 'ตัวอย่าง : 0812345679'),
              ),
              SizedBox(height: 15),
              TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'รหัสผ่าน',
                    labelStyle: TextStyle(color: kPrimaryColor),
                    helperText: 'รหัสผ่านควรมี 9 ตัวเป็นต้นไป'),
              ),
              SizedBox(height: 30),
              SizedBox(
                child: AppsButton.button(
                    label: "สร้างบัญชี",
                    onPressed: () {
                      // Navigator.push(context,
                      //     MaterialPageRoute(builder: (context) => ));
                    },
                    height: 48,
                    width: 300),
              ),
            ],
          ),
        ));
  }
}
