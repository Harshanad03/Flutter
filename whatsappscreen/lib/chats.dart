import 'package:flutter/material.dart';

class Chats extends StatefulWidget {
  const Chats({super.key});

  @override
  State<Chats> createState() => _ChatsState();
}

class _ChatsState extends State<Chats> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(),
      title: Text('Person 1'),
      subtitle: Row(
        children: [
          Icon(Icons.done_all),
          SizedBox(
            width: 3,
          ),
          Text('Hi'),
        ],
      ),
    );
    leading:
    CircleAvatar();
    title:
    Text('Person 2');
    subtitle:
    Row(
      children: [
        Icon(Icons.done_all),
        SizedBox(
          width: 3,
        ),
        Text('Hello'),
      ],
    );
    trailing:
    Text('11.30');
  }
}
