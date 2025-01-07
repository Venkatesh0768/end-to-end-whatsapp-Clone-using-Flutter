import 'package:chat_app/Model/chat_model.dart';
import 'package:chat_app/Pages/camera_page.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class IndividualPage extends StatefulWidget {
  const IndividualPage({super.key, required this.chatModel});

  final ChatModel chatModel;

  @override
  State<IndividualPage> createState() => _IndividualPageState();
}

class _IndividualPageState extends State<IndividualPage> {
  bool show = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 75,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.arrow_back,
                size: 24,
              ),
              SizedBox(width: 10),
              CircleAvatar(
                radius: 20,
                backgroundColor: Colors.blueGrey[700],
                child: SvgPicture.asset(
                  widget.chatModel.isGroup
                      ? 'assets/icons/group.svg'
                      : 'assets/icons/person.svg',
                  width: 20,
                ),
              ),
            ],
          ),
        ),
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.chatModel.name,
              style: TextStyle(fontSize: 18.5),
            ),
            Text(
              'last seen today at 12:05',
              style: TextStyle(fontSize: 12),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.videocam),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.call),
            onPressed: () {},
          ),
          PopupMenuButton(
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(
                  child: Text('View contact'),
                ),
                PopupMenuItem(
                  child: Text('Media, links, and docs'),
                ),
                PopupMenuItem(
                  child: Text('Search'),
                ),
                PopupMenuItem(
                  child: Text('Mute notifications'),
                ),
                PopupMenuItem(
                  child: Text('Wallpaper'),
                ),
                PopupMenuItem(
                  child: Text('More'),
                ),
              ];
            },
          ),
        ],
      ),

      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            ListView(),
            Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width - 52,
                        child: Card(
                          margin: EdgeInsets.only(left: 2, right: 2, bottom: 8),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(35),
                          ),
                          child: TextField(
                            textAlignVertical: TextAlignVertical.center,
                            keyboardType: TextInputType.multiline,
                            maxLines: 5,
                            minLines: 1,
                            decoration: InputDecoration(
                                fillColor: Colors.blueGrey.shade900,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25),
                                  borderSide: BorderSide.none,
                                ),
                                hintStyle: TextStyle(fontSize: 16),
                                hintText: "Typer a message",
                                prefixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      show = !show;
                                    });
                                  },
                                  icon: Icon(Icons.emoji_emotions),
                                ),
                                suffixIcon: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        showModalBottomSheet(
                                          backgroundColor: Colors.transparent,
                                          context: context,
                                          builder: (builder) =>
                                              bottomsheet(context),
                                        );
                                      },
                                      icon: Icon(Icons.attach_file),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => CameraPage(),
                                          ),
                                        );
                                      },
                                      icon: Icon(Icons.camera_alt_outlined),
                                    )
                                  ],
                                ),
                                contentPadding: EdgeInsets.all(5)),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0, left: 2.0),
                        child: CircleAvatar(
                          radius: 25,
                          backgroundColor: Colors.green,
                          child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.mic,
                                color: Colors.black,
                              )),
                        ),
                      ),
                    ],
                  ),
                  show ? emojiselect() : Container(),
                ],
              ),
            )
          ],
        ),
      ), // Display the message from the chat model
    );
  }
}

Widget emojiselect() {
  return EmojiPicker(
    onEmojiSelected: (category, emoji) {},
  );
}

Widget bottomsheet(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 50.0),
    child: SizedBox(
      height: 400,
      width: MediaQuery.of(context).size.width,
      child: Card(
        margin: EdgeInsets.all(18),
        child: Padding(
          padding: EdgeInsets.only(top: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 50, right: 50),
                  child: Row(
                    children: [
                      Expanded(
                          child: iconcreation(
                              Icons.insert_drive_file,
                              const Color.fromARGB(255, 116, 0, 106),
                              "Document")),
                      Expanded(
                          child: iconcreation(
                            
                            
                              Icons.camera_alt, Colors.redAccent, "Camera")),
                      Expanded(
                          child: iconcreation(
                              Icons.photo_size_select_actual_outlined,
                              Colors.pinkAccent,
                              "Gallery")),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 50, right: 50),
                  child: Row(
                    children: [
                      Expanded(
                          child: iconcreation(Icons.audiotrack_outlined,
                              Colors.orange, "Audio")),
                      Expanded(
                          child: iconcreation(
                              Icons.location_on, Colors.green, "Loacation")),
                      Expanded(
                          child: iconcreation(
                              Icons.person, Colors.lightBlue, "Contact")),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 65, right: 50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      iconcreation(Icons.poll_outlined,
                          const Color.fromARGB(255, 0, 90, 3), "Poll"),
                      SizedBox(
                        width: 30,
                      ),
                      iconcreation(
                          Icons.insert_drive_file, Colors.green, "Document"),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ),
  );
}

Widget iconcreation(IconData icon, Color color, String text) {
  return InkWell(
    onTap: () {},
    child: Column(
      children: [
        CircleAvatar(
          backgroundColor: color,
          radius: 30.0,
          child: Icon(
            icon,
            size: 29,
          ),
        ),
        SizedBox(
          height: 7,
        ),
        Text(text),
      ],
    ),
  );
}
