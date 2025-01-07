import 'dart:math';

import 'package:chat_app/CustomUI/button_card.dart';
import 'package:chat_app/CustomUI/contact_card.dart';
import 'package:chat_app/Model/chat_model.dart';
import 'package:chat_app/Model/contact_model.dart';
import 'package:chat_app/constant.dart';
import 'package:chat_app/screens/create_group.dart';

import 'package:flutter/material.dart';

class ContactsScreen extends StatefulWidget {
  const ContactsScreen({super.key, required this.chats});

  final List<ChatModel> chats;
  @override
  State<ContactsScreen> createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> {
  List<ContactModel> contacts = [
    ContactModel(name: "Venkatesh", status: "Superme" , select: false ),
    ContactModel(
        name: "virus", status: "Lier Sala and 3 ex girlfriend experinces" , select: false),
    ContactModel(name: "Sushil Bhai", status: "Attitude Boy" , select:  false),
    ContactModel(name: "Akash", status: "Lover Boy" ,select:  false),
    ContactModel(name: "Akash", status: "Lover Boy",select:  false),
    ContactModel(name: "Akash", status: "Lover Boy" ,select:  false),
    ContactModel(name: "Akash", status: "Lover Boy",select:  false),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: appTheme.appBarTheme.backgroundColor,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Select Contact",
              style: TextStyle(fontSize: 18.5),
            ),
            Text(
              '472 contacts',
              style: TextStyle(fontSize: 12),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.white),
            onPressed: () {},
          ),
          PopupMenuButton(
              surfaceTintColor: Color(0xFF128C7E),
              onSelected: (value) => log(value),
              itemBuilder: (BuildContext context) {
                return [
                  PopupMenuItem(
                    child: Text('Invite a friend'),
                  ),
                  PopupMenuItem(
                    child: Text('Contacts'),
                  ),
                  PopupMenuItem(
                    child: Text('Refresh'),
                  ),
                  PopupMenuItem(
                    child: Text('Help'),
                  ),
                ];
              })
        ],
      ),
      body: ListView.builder(
          itemCount: contacts.length + 2,
          itemBuilder: (context, index) {
            if (index == 0) {
              return InkWell(
                onTap: (){
                  // Navigate to new chat screen
                  Navigator.push(context, 
                  MaterialPageRoute(builder: (context) => CreateGroup()));
                },
                child: ButtonCard(name: "New group", icon: Icons.group),
              );
            } else if (index == 1) {
              return ButtonCard(name: "New Contact", icon: Icons.person);
            }
            return ContactCard(
              contactModel: contacts[index - 2],
            );
          }),
    );
  }
}
