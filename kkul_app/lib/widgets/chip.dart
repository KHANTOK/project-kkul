import 'package:flutter/material.dart';

chipList() {
  return Wrap(
    spacing: 6.0,
    runSpacing: 6.0,
    children: <Widget>[
      _buildChip('วิศวกรรมศาสตร์', Color(0xFF75292D)),
      _buildChip('เภสัชศาสตร์', Color(0xFF799841)),
      _buildChip('พยาบาลศาสตร์', Color(0xFF278ACA)),
      _buildChip('ศึกษาศาสตร์', Color(0xFFf37321)),
      _buildChip('สถาปัตยกรรมศาสตร์', Color(0xFF86461A)),
    ],
  );
}

Widget _buildChip(String label, Color color) {
  // final String num;
  return Chip(
    labelPadding: EdgeInsets.all(2.0),
    avatar: CircleAvatar(
      backgroundColor: Colors.white70,
      child: Text(label[0].toUpperCase()),
    ),
    label: Text(
      label,
      style: TextStyle(
        color: Colors.white,
      ),
    ),
    backgroundColor: color,
    elevation: 6.0,
    shadowColor: Colors.grey[60],
    padding: EdgeInsets.all(8.0),
  );
}
