import 'package:chat_app/Model/contact_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ContactCard extends StatelessWidget {
  const ContactCard({super.key, required this.contactModel});

  final ContactModel contactModel;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SizedBox(
        height: 53,
        width: 50,
        child: Stack(
          children: [
            CircleAvatar(
              backgroundColor: Colors.blueGrey.shade700,
              radius: 23,
              child: SvgPicture.asset(
                'assets/icons/person.svg',
                width: 30,
                height: 30,
              ),
            ),
            contactModel.select ?Positioned(
              bottom: 4,
              right: 5,
              child: CircleAvatar(
                radius: 11,
                backgroundColor: Colors.green,
                child: Icon(
                  Icons.check,
                  size: 18,
                  color: Colors.white,
                ),
              ),
            ): Container()
          ],
        ),
      ),
      title: Text(
        contactModel.name,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        contactModel.status,
        style: TextStyle(
          fontSize: 13,
        ),
      ),
    );
  }
}
