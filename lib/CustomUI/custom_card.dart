import 'package:chat_app/Pages/individual_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:chat_app/Model/chat_model.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key ,required this.chatModel});

  final ChatModel chatModel;
  
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              radius: 30,
              backgroundColor: Colors.blueGrey[700],
              child: SvgPicture.asset(
                chatModel.isGroup ?'assets/icons/group.svg' :'assets/icons/person.svg',
                 width: 30,
                ),
            ),
            title:
                Text(chatModel.name, style: TextStyle(color: Colors.white)),
            subtitle: Row(
              children: [
                Icon(Icons.done_all, color: Colors.white, size: 16),
                SizedBox(
                  width: 5,
                ),
                Text(chatModel.currentMessage,
                    style: TextStyle(color: Colors.white)),
              ],
            ),
            trailing: Text(chatModel.time, style: TextStyle(color: Colors.white)),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (builder) => IndividualPage(chatModel: chatModel),
                ),
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.only(left: 80, right: 20),
          )
        ],
      ),
    );
  }
}
