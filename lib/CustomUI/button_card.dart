import 'package:flutter/material.dart';


class ButtonCard extends StatelessWidget {
  const ButtonCard({super.key , required this.name , required this.icon});

  final String name;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.green,
          radius: 23,
          child: Icon(
            icon,
            size: 30,
            color: Colors.black,
          ),
        ),
        title: Text(
          name,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );


  }
}