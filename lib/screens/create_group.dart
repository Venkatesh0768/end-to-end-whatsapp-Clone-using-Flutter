

import 'package:chat_app/CustomUI/avatar_card.dart';
import 'package:chat_app/CustomUI/contact_card.dart';
import 'package:chat_app/Model/contact_model.dart';
import 'package:chat_app/constant.dart'; // Ensure appTheme is defined here
import 'package:flutter/material.dart';

class CreateGroup extends StatefulWidget {
  const CreateGroup({super.key});

  @override
  State<CreateGroup> createState() => _CreateGroupState();
}

class _CreateGroupState extends State<CreateGroup> {
  List<ContactModel> contacts = [
    ContactModel(name: "Venkatesh", status: "Supreme", select: false),
    ContactModel(
        name: "Virus",
        status: "Liar and 3 ex-girlfriend experiences",
        select: false),
    ContactModel(name: "Sushil Bhai", status: "Attitude Boy", select: false),
    ContactModel(name: "Akash", status: "Lover Boy", select: false),
    ContactModel(name: "Raj", status: "Code Lover", select: false),
    ContactModel(name: "Ravi", status: "Tech Enthusiast", select: false),
  ];

  List<ContactModel> groups = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor:
            appTheme.appBarTheme.backgroundColor, // Ensure this is defined
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "Select Contact",
              style: TextStyle(fontSize: 18.5),
            ),
            Text(
              'Add Participants', // Fixed typo
              style: TextStyle(fontSize: 12),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: Stack(
        children: [
          Column(
            children: [
              if (groups
                  .isNotEmpty) // Show selected contacts only when groups exist
                SizedBox(
                  height: 75,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: groups.length, // Use groups.length here
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          setState(() {
                            groups[index].select = false;
                            groups.removeAt(index); // Remove from groups
                          });
                        },
                        child: AvatarCard(
                          contacts: groups[index], // Use groups[index]
                        ),
                      );
                    },
                  ),
                ),
              if (groups.isNotEmpty)
                const Divider(
                  thickness: 1,
                ),
              Expanded(
                child: ListView.builder(
                  itemCount: contacts.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        setState(() {
                          contacts[index].select = !contacts[index].select;
                          if (contacts[index].select) {
                            groups.add(contacts[index]);
                          } else {
                            groups.remove(contacts[index]);
                          }
                        });
                      },
                      child: ContactCard(
                        contactModel: contacts[index],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
