import 'package:flutter/material.dart';
import 'package:old_wave_flutter/src/constants/constants.dart';
import 'package:old_wave_flutter/src/view/search.dart';

class SearchBar extends StatefulWidget {
  @override
  _SearchBar createState() => _SearchBar();
}

class _SearchBar extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: Color(0xffffffff),
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
        child: TextField(
          onSubmitted: (value) => {
            print("Búsqueda" + value),
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => Search(search: value,)
            ))
          },
          cursorColor: Colors.grey,
          style: TextStyle(fontSize: 16.0, color: Colors.black),
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.search,
              color: Colors.grey,
              size: 16,
            ),
            border: InputBorder.none,
            hintText: "Search Products",
            hintStyle: TextStyle(color: Colors.grey, fontSize: 14.0),
          ),
        ),
      ),
      decoration: BoxDecoration(
        color: purpleMainColor,
      ),
    );
  }
}
