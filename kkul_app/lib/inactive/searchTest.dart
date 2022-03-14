import 'package:avatar_view/avatar_view.dart';
import 'package:flutter/material.dart';
import 'package:kkul_app/color.dart';
import 'package:kkul_app/inactive/device.dart';
import 'package:kkul_app/screen/User/device_detail_screen.dart';
import 'package:kkul_app/inactive/search.dart';

class SearchTest extends StatefulWidget {
  const SearchTest({Key? key}) : super(key: key);

  @override
  _SearchTestState createState() => _SearchTestState();
}

class _SearchTestState extends State<SearchTest> {
  // This holds a list of fiction users
  // You can use data fetched from a database or a server as well
  List<Map<String, dynamic>> _allDevice = Device.allDevice;

  // This list holds the data for the list view
  // (ลิสต์เก็บข้อมูลค้นหา)
  List<Map<String, dynamic>> _foundDevice = [];

  @override
  initState() {
    // at the beginning, all users are shown
    // (ในตอนเริ่มต้นจะแสดงผู้ใช้ทั้งหมด)
    _foundDevice = _allDevice;
    super.initState();
  }

  // This function is called whenever the text field changes
  // (ฟังก์ชันนี้ถูกเรียกเมื่อใดก็ตามที่ช่องข้อความเปลี่ยนแปลง)
  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all devices
      // (หากช่องค้นหาว่างเปล่าหรือมีเพียงช่องว่าง เราจะแสดงอุปกรณ์ทั้งหมด)
      results = _allDevice;
    } else {
      results = _allDevice
          .where((device) => device["name"]
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
      // we use the toLowerCase() method to make it case-insensitive
      // (ใช้วิธี toLowerCase() เพื่อให้ไม่คำนึงถึงขนาดตัวพิมพ์)
    }

    // Refresh the UI
    setState(() {
      _foundDevice = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          SearchWidget(
              labelText: 'ค้นหา',
              onChanged: (value) => _runFilter(value),
              hintText: 'หอสมุดกลาง'),
          // Padding(
          //   padding: const EdgeInsets.fromLTRB(20, 20, 20, 25),
          //   child: TextField(
          //     onChanged: (value) => _runFilter(value),
          //     decoration: const InputDecoration(
          //         border: OutlineInputBorder(),
          //         labelText: 'ค้นหา',
          //         hintText: 'หอสมุดกลาง',
          //         suffixIcon: Icon(Icons.search),
          //         contentPadding: EdgeInsets.all(15)),
          //   ),
          // ),
          // const SizedBox(
          //   height: 20,
          // ),
          Expanded(
            child: _foundDevice.isNotEmpty
                ? ListView.builder(
                    itemCount: _foundDevice.length,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child: Container(
                        height: 150,
                        child: Card(
                          key: ValueKey(_foundDevice[index]["id"]),
                          color: Colors.white,
                          elevation: 10,
                          borderOnForeground: true,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              ListTile(
                                  leading: AvatarView(
                                    radius: 40,
                                    borderColor: Colors.white,
                                    avatarType: AvatarType.RECTANGLE,
                                    backgroundColor: Colors.red,
                                    imagePath: _foundDevice[index]['img'],
                                    placeHolder: Container(
                                      child: Icon(
                                        Icons.person,
                                        size: 50,
                                      ),
                                    ),
                                    errorWidget: Container(
                                      child: Icon(
                                        Icons.error,
                                        size: 50,
                                      ),
                                    ),
                                  ),
                                  title: Text(_foundDevice[index]['name'],
                                      style: TextStyle(
                                          color: accentColor,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold)),
                                  subtitle: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        'ระยะการยืม : ${_foundDevice[index]["time"].toString()}',
                                        style: TextStyle(
                                            color: timeColor, fontSize: 14),
                                      ),
                                      Text(
                                        'คงเหลือทั้งหมด : ${_foundDevice[index]["remain"].toString()}',
                                        style: TextStyle(
                                            color: remainColor,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                  trailing: Icon(Icons.close),
                                  onTap: () {
                                    // Navigator.push(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //         builder: (context) =>
                                    //             DeviceDetailScreen()));
                                  })
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                : const Text(
                    'No results found',
                    style: TextStyle(fontSize: 24),
                  ),
          ),
        ],
      ),
    );
  }
}
