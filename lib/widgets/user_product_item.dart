import 'package:flutter/material.dart';

class UserProductItem extends StatelessWidget {
  final String title;
  final String imageUrl;

  UserProductItem({required this.title, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(imageUrl),
      ),
      trailing: Container(
        width: 100,
        child: Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.edit),
              color: Colors.blueAccent,
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.delete),
              color: Colors.indigo,
            ),
          ],
        ),
      ),
    );
  }
}
