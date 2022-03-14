import 'package:flutter/material.dart';

class SearchWidget extends StatefulWidget {
  final String labelText;
  final ValueChanged<String> onChanged;
  final String hintText;

  const SearchWidget({
    Key? key,
    required this.labelText,
    required this.onChanged,
    required this.hintText,
  }) : super(key: key);

  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  final controller = TextEditingController();
  // Icon _searchIcon = new Icon(Icons.search);
  // final TextEditingController _filter = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    // final styleActive = TextStyle(color: Colors.black);
    // final styleHint = TextStyle(color: Colors.black54);
    // final style = widget.text.isEmpty ? styleHint : styleActive;

    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 25),
      child: TextField(
        controller: controller,
        onChanged: widget.onChanged,
        decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'ค้นหา',
            labelStyle: TextStyle(color: Colors.black),
            hintText: 'หอสมุดกลาง',
            suffixIcon: Icon(Icons.search),
            contentPadding: EdgeInsets.all(15)),
      ),
    );

    // Container(
    //   height: 48,
    //   margin: const EdgeInsets.fromLTRB(16, 16, 16, 16),
    //   decoration: BoxDecoration(
    //     borderRadius: BorderRadius.circular(4),
    //     color: Colors.white,
    //     border: Border.all(color: Colors.black26),
    //   ),
    //   padding: const EdgeInsets.symmetric(horizontal: 8),
    //   child: TextField(
    //     controller: controller,
    //     decoration: InputDecoration(
    //       icon: Icon(Icons.search, color: style.color),
    //       suffixIcon:
    //           // IconButton(onPressed: _searchPressed, icon: _searchIcon),
    //           widget.text.isNotEmpty
    //               ? GestureDetector(
    //                   child: Icon(Icons.close, color: style.color),
    //                   onTap: () {
    //                     // _searchPressed();
    //                     controller.clear();
    //                     // widget.onChanged('');
    //                     FocusScope.of(context).requestFocus(FocusNode());
    //                   },
    //                 )
    //               : null,
    //       hintText: widget.hintText,
    //       hintStyle: style,
    //       border: InputBorder.none,
    //     ),
    //     style: style,
    //     onChanged: widget.onChanged,
    //   ),
    // );
  }

  // void _searchPressed() {
  //   setState(() {
  //     if (this._searchIcon.icon == Icons.search) {
  //       this._searchIcon = new Icon(Icons.close);
  //       // this._appBarTitle = new TextField(
  //       //   controller: _filter,
  //       //   decoration: new InputDecoration(
  //       //     prefixIcon: new Icon(Icons.search),
  //       //     hintText: 'Search...'
  //       //   ),
  //       // );
  //     } else {
  //       this._searchIcon = new Icon(Icons.search);
  //       // this._appBarTitle = new Text( 'Search Example' );
  //       // filteredNames = names;
  //       _filter.clear();
  //     }
  //   });
  // }
}
