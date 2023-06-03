import 'package:flutter/material.dart';

class MyTile extends StatelessWidget {

  final String title;
  final String content;

  const MyTile({
    super.key,
    required this.title,
    required this.content,
    });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
           color:Colors.grey[200],
        ),
        height: 100,
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(title, style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(content, style: const TextStyle(
                  fontSize: 14,
                ),),
              ),
            ),
          ],
        ),
       ),
    );
  }
}