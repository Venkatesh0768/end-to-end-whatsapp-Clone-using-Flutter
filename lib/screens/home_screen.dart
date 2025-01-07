import 'package:chat_app/CustomUI/custom_card.dart';
import 'package:chat_app/Pages/camera_page.dart';
import 'package:chat_app/constant.dart';
import 'package:chat_app/screens/contacts_screens.dart';
import 'package:flutter/material.dart';
import 'package:chat_app/Model/chat_model.dart';
import 'dart:developer';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // List of chats
  List<ChatModel> getChats() {
    return [
      ChatModel(
          name: 'Venkatesh Rapolu',
          icon: 'assets/icons/group.svg',
          isGroup: false,
          time: '10:00 AM',
          currentMessage: 'Hey '),
      ChatModel(
          name: 'Venkatesh',
          icon: 'assets/icons/group.svg',
          isGroup: true,
          time: '1:00 AM',
          currentMessage: 'Hey there '),
    ];
  }

  // AppBar widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0,
      backgroundColor: appTheme.appBarTheme.backgroundColor,
      title: Text('WhatsApp', style: TextStyle(color: Colors.white)),
      actions: [
        IconButton(
          icon: Icon(Icons.camera_alt_outlined, color: Colors.white),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CameraPage(),
              ),
            );
          },
        ),
        _buildPopupMenu(),
      ],
    );
  }

  // Popup menu for settings
  PopupMenuButton<String> _buildPopupMenu() {
    List<String> menuItems = [
      'New group',
      'New broadcast',
      'WhatsApp Web',
      'Starred messages',
      'Settings',
    ];

    return PopupMenuButton<String>(
      surfaceTintColor: Color(0xFF128C7E),
      onSelected: (value) => log('Selected: $value'),
      itemBuilder: (BuildContext context) {
        return menuItems.map((String item) {
          return PopupMenuItem<String>(
            value: item,
            child: Text(item),
          );
        }).toList();
      },
    );
  }

  // Floating Action Button
  Widget _buildFloatingActionButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (builder) => ContactsScreen(
              chats: getChats(),
            ),
          ),
        );
      },
      backgroundColor: const Color.fromARGB(255, 28, 167, 32),
      child: Icon(Icons.message),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<ChatModel> chats = getChats();

    return Scaffold(
      floatingActionButton: _buildFloatingActionButton(context),
      backgroundColor: appTheme.appBarTheme.backgroundColor,
      appBar: _buildAppBar(context),
      body: ListView.builder(
        itemCount: chats.length,
        itemBuilder: (context, index) => CustomCard(
          chatModel: chats[index],
        ),
      ),
    );
  }
}
